--���̺� �����
drop table comp;
create table comp(
������ char(10),
������ varchar2(10));
desc comp;
insert into comp values('1','�ϳ�');
insert into comp values('2','��');
insert into comp values('3','��');
--���ڿ� ��¥ ���̺�
create table ex_date(
id number(2), start_date date default sysdate);
desc ex_date;
insert into ex_date(id) values(10);
insert into ex_date(id) values(11);
insert into ex_date(id) values(12);
select * from ex_date;
--����
create table sample_product(
product_id number , produck_name varchar2(20), menu_date date);
drop table sample_porduct;
--���̺� ��������
drop table emp1;
create table emp1(
id number(3) primary key, --�⺻Ű
name varchar2(20) not null,--�ΰ��� �Է��� �� ����
sal number check(sal>1000) --üũ�� ������ �Է�
);
desc emp1;
insert into emp1 values(1,'�浿',1001);
insert into emp1 values(2,'���',2000);-- �⺻Ű�� �ߺ��ȵ�, �ΰ��Է¾ȵ�
--����
drop table members;
create table members(
member_id number(2) primary key,
first_name varchar2(50) not null,
last_name varchar2(50) not null,
gender varchar2(5) check(gender in('Woman','Man')),
birth_day date default sysdate,
email varchar2(200) unique not null);
desc members;

desc �μ�;

insert into �μ� values(1,'�濵');
insert into �μ� values(2,'����');
delete from �μ� where ��ȣ =1;

desc ����;
insert into ���� values(1,'ȫ�浿',1);
insert into ���� values(2,'���',2);

--CREATE TABLE AS
drop table emp_temp;
create table emp_temp
as
select * from emp where 1 != 1;  --���ǿ� �����ϴ� �����Ͱ� ���� --> ���� �����

select * from emp_temp;