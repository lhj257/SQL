--테이블 만들기
drop table comp;
create table comp(
고정열 char(10),
가변열 varchar2(10));
desc comp;
insert into comp values('1','하나');
insert into comp values('2','둘');
insert into comp values('3','셋');
--숫자와 날짜 테이블
create table ex_date(
id number(2), start_date date default sysdate);
desc ex_date;
insert into ex_date(id) values(10);
insert into ex_date(id) values(11);
insert into ex_date(id) values(12);
select * from ex_date;
--예제
create table sample_product(
product_id number , produck_name varchar2(20), menu_date date);
drop table sample_porduct;
--테이블 제약조건
drop table emp1;
create table emp1(
id number(3) primary key, --기본키
name varchar2(20) not null,--널값을 입력할 수 없음
sal number check(sal>1000) --체크는 조건을 입력
);
desc emp1;
insert into emp1 values(1,'길동',1001);
insert into emp1 values(2,'펭수',2000);-- 기본키는 중복안됨, 널값입력안됨
--예제
drop table members;
create table members(
member_id number(2) primary key,
first_name varchar2(50) not null,
last_name varchar2(50) not null,
gender varchar2(5) check(gender in('Woman','Man')),
birth_day date default sysdate,
email varchar2(200) unique not null);
desc members;

desc 부서;

insert into 부서 values(1,'경영');
insert into 부서 values(2,'개발');
delete from 부서 where 번호 =1;

desc 직원;
insert into 직원 values(1,'홍길동',1);
insert into 직원 values(2,'펭수',2);

--CREATE TABLE AS
drop table emp_temp;
create table emp_temp
as
select * from emp where 1 != 1;  --조건에 만족하는 데이터가 없음 --> 열만 복사됨

select * from emp_temp;