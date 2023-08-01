--입력 INSERT
--테이블 열의 데이터타입 간단히 보기
desc departments;
insert into departments(department_id, department_name,manager_id,location_id)
values(300,'Game',100,1700);
--열이름 생략할때(모든 열을 다입력해야함)
insert into departments
values(290,'Fishing',100,1700);
--NULL값이 입력될 때(입력을 하지 않으면 NULL)
insert into departments(department_id, department_name)
values(280,'Music');

--직원테이블 입력
desc employees;
insert into employees
values (207, '길동','홍','hong@naver.com','010.1234.5678',sysdate,'IT_PROG',
9999,null,205,300);
--예제1
insert into departments
values (271,'Sample Dept 1',200,1700);
insert into departments
values (272,'Sample Dept 2',200,1700);
insert into departments
values (273,'Sample Dept 3',200,1700);

--수정 UPDATE (※주의:where이 없으면 모든행이 없데이트됨)
--음악부서의 매니저와 로케이션 수정하기
update departments
set manager_id = 100, location_id =1700
where department_name = 'Music';
--예제 부서번호 150에서 200번까지 매니저ID를 100으로 수정
update departments
set manager_id = 100
where department_id between 150 and 200;

--삭제 DELETE
delete from departments
where department_name = 'Music';
delete from departments
where department_name = 'Game';
--만약 삭제하는 데이터를 참조하는 테이블과 데이터가 있을경우 참조하는 데이터를 먼저 삭제해야 삭제가능
delete from employees
where last_name= '홍';
--삭제시 where을 안적으면? : 전체가 적용되므로 주의

--그전 상태로 복구 (이전의 성공적 commit 상태로 돌아감)
rollback;
--입력 수정 삭제 연습하기
--scott 계정
desc bonus;
desc dept;
insert into bonus
values ('Lee', 'PROG', 3000, 0.5);
delete from bonus
where ename = 'Lee';