SELECT*
from countries;

SELECT*
from departments;

SELECT department_name
from departments;

SELECT department_name, department_id
from departments;

SELECT department_name �μ��̸�, department_id �μ���ȣ
from departments;

select *
from employees;

select last_name �̸�, job_id ����, salary ����, salary+100 ���ʽ�����, salary-salary*0.1 ����
from employees;

select job_id
from employees;

select job_id ����
from employees;
--DISTINCT < �ߺ��� ����
select distinct job_id ����
from employees;

select employee_id, first_name,last_name
from employees;

select employee_id �����ȣ, first_name �̸�, last_name ��
from employees;

select first_name, salary, salary*1.1 AS��������
from employees;
--|| < ���� ������
select last_name || ' is a ' ||job_id as "��������"
from employees;

select employee_id ||' '||first_name ||' '||last_name "��� �̸�", email||'@company.com' as �̸���
from employees;
--WHERE (���� ������)
select *
from employees
where salary > 14000;

select *
from employees
where last_name = 'King'; -- ���ڿ��� ��ҹ��� ����

select *
from employees
where hire_date < '2002-06-10'; -- ��¥�� ���ڿ��� �ڵ����� �ٲ��

SELECT *
from employees
where employee_id<=100;
--1
SELECT *
from job_history
where start_date > '2006-03-03';
--2
SELECT *
from employees
where employee_id<=105;
--3
SELECT *
from employees
where first_name='David';
--4
SELECT *
from employees
where employee_id=100;
--5
SELECT *
from departments
where location_id<>1700;  --���� ���� <> , !=
--AND OR NOT ������
select last_name, department_id, salary
from employees
where department_id=60
or department_id=80
and salary>10000;

select *
from employees
where not (hire_date > '2004-01-01' or salary > 5000);

select last_name, department_id, salary
from employees
where (department_id=60
or department_id=80)
and salary>10000;
--1
select *
from employees
where salary >4000
and job_id = 'IT_PROG';
--2
select *
from employees
where salary >4000
and (job_id = 'IT_PROG' or job_id='FI_ACCOUNT');
--IN ������
select *
from employees
where salary in(4000,3000,2700);
--1
select *
from employees
where salary in(10000,17000,24000);
--2
select *
from employees
where department_id  not in(30,50,80,100,110);
--BETWEEN ������
--1
select *
from employees
where salary between 10000 and 20000;
--2
select *
from employees
where hire_date between '2004-01-01' and '2004-12-31';
--3
select *
from employees
where salary not between 7000 and 17000;

--LIKE ������ ���ڿ� Ű���� ��ȸ�� % �Ǵ� _���� ���
SELECT *
from employees
where last_name LIKE 'B%'; --B�� �����ϴ� ��� ���ڿ� �˻�

SELECT *
from employees
where last_name LIKE '%b%'; -- �߰��� b�� ���� ��� ���ڿ� �˻�

SELECT *
from employees
where last_name LIKE '____y'; -- _(�����)��  �� �ѹ��ڸ� �ǹ��Ѵ�.
--����
--1
SELECT *
from employees
where job_id LIKE '%AD%';
--2
SELECT *
from employees
where job_id LIKE '%AD___';
--3
SELECT *
from employees
where phone_number LIKE '%1234';
--4
SELECT *
from employees
where phone_number not LIKE '%3%' and phone_number like '%9';
--5
SELECT *
from employees
where job_id LIKE '%MGR%' or job_id like '%ASST%';
--IS NULL, ORDER BY ������
--�� ���� �˻��Ҷ� is null
SELECT *
from employees
where commission_pct is null;
--���� �ƴ� ��� is not null
SELECT *
from employees
where commission_pct is not null;
--����
SELECT *
from employees
where manager_id is null;
-- ���ļ����� �����Ҷ� ORDER BY
select *
from employees
order by salary; --ASC(��������,����Ʈ ��������) DESC(��������)
--2�� �̻��� ���� ���Ľ�
select department_id, employee_id, first_name, last_name
from employees
order by department_id, employee_id; -- ó���� �μ���ȣ���̰�, ������ ������ȣ����

--��Ī���� ����
SELECT department_id, last_name, salary*12 ����
from employees
order by ���� desc; --������ ū������ ����
--����
--1
select employee_id, first_name, last_name
from employees
order by  employee_id desc;
--2
select *
from employees
where job_id like '%CLERK%'
order by salary desc;
--3
select employee_id ������ȣ, first_name �����̸�, department_id �μ���ȣ, salary ����
from employees
where employee_id between 120 and 150
order by department_id desc, salary desc;