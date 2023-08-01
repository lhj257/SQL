--시퀀스
create sequence 시퀀스1; --생성(옵션없이)
create sequence 시퀀스2
start with 1000
increment by 10; --1000번부터 시작 10씩 증가하는 시퀀스2

select * from user_sequences
where sequence_name = '시퀀스1';

--테이블에 입력시 시퀀스 사용방법
drop table 부서;
create table 부서(
번호 number primary key,
이름 varchar2(100)
);
insert into 부서 values ( 시퀀스2.nextval, '영업부');
insert into 부서 values ( 시퀀스2.nextval, '개발부');
insert into 부서 values ( 시퀀스2.nextval, '회계부');
insert into 부서 values ( 시퀀스2.nextval, '경영부');
select * from 부서;
--시퀀스의 현재값 확인 CURRVAL
select 시퀀스1.currval from dual;
select 시퀀스2.currval from dual;

--시퀀스의 삭제 DROP
drop sequence 시퀀스1;
drop sequence 시퀀스2;

update 부서 
set 번호 = 시퀀스1.nextval;