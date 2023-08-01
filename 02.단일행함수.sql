--������ �Լ�
select LOWER('ABCD'), upper('abcd'), INITCAP('abc')
from dual;

-- CONCAT(�ΰ� ���ڿ� ����), SUBSTR(���ڿ�, ������ġ,���ڿ� ����),LENGTH(���ڿ�����)
--INSTR(���������� ��ġ), TRIM(������ ������)
select concat('��ο�','����!'), substr('��ο����',2,2),length('��ο�'),
instr('��ο�','��'), trim('   ����   '),'  ����   '
from dual;

--������ �Լ� ����
select department_id, last_name, department_id
from employees
where lower(last_name) ='higgins';

select last_name, concat('�������� ',job_id) as ������
from employees
where substr(job_id,4,3)='REP';

--���ڿ� ġȯ �Լ� REPLACE
select replace('��ο����','����','����')from dual;

--1
select last_name �̸�, lower(last_name) LOWER����, upper(last_name) UPPER����, email �̸���, initcap(email) INITCAP����
from employees;
--2
select job_id ������,substr(job_id,1,2) ����2��
from employees;

--������ �Լ�
--ROUND(�ݿø�), TRUNC(����), MOD(������)
select round(15.193,1) �Ҽ�ù°, round(15.193) ���� ,round(15.193,2) �Ҽ��ι�°
from dual;
select trunc(15.193,1) �Ҽ�ù°, trunc(15.193) ���� ,trunc(15.193,2) �Ҽ��ι�°
from dual;
--¦����° ��ȣ�� ���� �������� ���
select employee_id ¦����ȣ, last_name �̸� 
from employees
where mod(employee_id,2) = 0
order by 1;--ù��° ���� ����
--����
select salary, round(salary/30) ����, round(salary/30, 1) �Ҽ�1, round(salary/30, -1) "10���ڸ�"
from employees;

--��¥�� �Լ�
select round(sysdate, 'dd') ��,
round(sysdate, 'mm') ��,
round(sysdate, 'yyyy') �⵵,
months_between('2017/10/10', '2017/07/10') ������,
add_months('2017/07/10', 3)�ֵ�վ�
from dual;
--��¥ ����
select sysdate-1 ����, sysdate ����, sysdate+1 ����
from dual;
--90�� �μ� �������� �ٹ�����
select last_name, floor(sysdate - hire_date) �ٹ��ϼ�
from employees
where department_id = 90;
--����1
select sysdate, hire_date, trunc(months_between(sysdate,hire_date)) ������
from employees
where department_id=100;
--����2
select hire_date, add_months(hire_date,3) "���ϱ� 3����", add_months(hire_date,-3) "���� 3����"
from employees
where employee_id BETWEEN 100 and 106;

--��ȯ�� �Լ�
-- TO_CHAR ���ڸ� ���Ŀ� �°� ���ڿ��� ǥ��
select
to_char(12345678,'999,999,999') �޸�,
to_char(123.45678,'999,999,999.99') �Ҽ���,
to_char(123.45678,'$999,999,999.99') �޷�,
to_char(12345678,'L999,999,999') ��ȭ
from dual;
--��¥�� ���ڿ��� ����
select
to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') ���糯¥�ð�
from dual;
--����1
select employee_id, to_char(hire_date, 'mm/yy') �Ի��
from employees
where department_id=100;
--����2
select last_name �̸�, to_char(salary,'$999,999.99')����
from employees
where salary>10000
order by salary desc;

--���ڿ��� DATE Ÿ������ ��ȯ�ϴ� ����
select to_date ('2011-01-01','yyyy-mm--dd')
from dual;
--���ڸ� ���ڷ� ��ȯ�ϴ� ������ �����̴�.
select to_number('0121')+10
from dual;

--NVL : null���� �ٸ� ������ �ٲܶ� ���, ��� ������ Ÿ�Կ� ���밡��
select last_name, nvl(manager_id, 0) �Ŵ���
from employees
where last_name ='King';
--NVL2 : null���� �ƴҰ�� ù��° , null ���� ��� �ι�°�� �ٲ�
select last_name, nvl2(manager_id,1,0) �Ŵ���
from employees
where last_name ='King';
--����
select last_name �̸�, salary ����, nvl(commission_pct,0) Ŀ�̼�, (salary*12)+(salary*12*nvl(commission_pct,0)) ����,
nvl2(commission_pct, 'SAL+COMM', 'SAL') �������
from employees
order by ���� desc;

--DECODE(VALUE,IF1,THEN1, IF2,THEN2...)�Լ� : ���ǿ� ���� �����͸� �ٸ� ���̳� �÷������� ����
select last_name �̸�, job_id, salary,
 decode(job_id, 'IT_PROG', salary*1.10,
                'ST_CLERK', salary*1.15,
                'SA_REP', salary*1.20,
                          salary) "��������"
  from employees;
-- ����
select last_name �̸�, job_id ����, salary ����,
decode(trunc(salary/2000),0,0,
                       1,0.09,
                       2,0.2,
                       3,0.3,
                       4,0.4,
                       5,0.42,
                       6,0.44,
                        0.45)����
from employees;
--CASE �Լ� : DECODE �ռ��� �������� ���ϴ� �񱳿����� ������ �ذ��� �� �ִ� �Լ�
select last_name �̸�, job_id, salary,
case when salary<5000 then 'Low'
when salary<10000 then 'Medium'
when salary<20000 then 'Good'
else 'Excellent'
end �޿����
from employees;
--����
select employee_id, first_name, last_name,salary,
case when salary>=9000 then '�����޿�'
     when salary>=6000 then '�����޿�'
     else '�����޿�'
     end �޿���� 
from employees
where job_id ='IT_PROG';