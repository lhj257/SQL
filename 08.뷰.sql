--��  VIEW : ������ ���̺�
create view emp_v2
as
select employee_id ������ȣ, first_name �̸�, last_name ��, email, hire_date, job_id
from employees;

select * from emp_v2;
insert into emp_v2 values(207, '�浿', 'ȫ', 'HONG','2023-7-31','IT_PROG');
--��� ���� �������� ���̺��� �ƴѵ� �Է��� ���� => ������ �並 ���� ���̺� �Էµ�!
delete from emp_v2 where ������ȣ = 207;
select * from employees;

--�б⸸ ������ ��� �����(with read only)
create view emp_read(������ȣ, �̸�, ��, �̸���, �������, ����)
as
select employee_id, first_name, last_name , email, hire_date, job_id
from employees with read only;

select * from emp_read;
delete from emp_read where ������ȣ= 100;
--�б⸸ ������ ��� DML(�Է�, ����, ����)�� �ȵ�.