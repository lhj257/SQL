--�⺻ JOIN ���
select e.employee_id ������ȣ, e.last_name �̸�, e.department_id �μ���ȣ, 
       d.department_name �μ���
from employees e join departments d
on e.department_id = d.department_id;
--3�� ���̺� ����
select employee_id, city, department_name
from employees e join departments d
on e.department_id=d.department_id
join locations l
on d.location_id= l.location_id;
--���ΰ� �Բ�  where �������� ���´�
select e.employee_id ������ȣ, e.last_name �̸�, e.department_id �μ���ȣ, 
       d.department_name �μ���
from employees e join departments d
on e.department_id = d.department_id
where d.department_id=50;
--����
select department_name �μ���, city ���ø�, country_name ������
from departments d join locations l
on d.location_id = l.location_id
join countries c on l.country_id=c.country_id
where city= 'Seattle' or city='London';

--��ü����(���� ���̺����� �����ϰ� �������)
select e.last_name ���� ,m.last_name �Ŵ���
from employees e join employees m
on e.manager_id = m.employee_id;

--�ܺ�����
--���� �ܺ�����
select last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
from employees e left outer join departments d
on e.department_id= d.department_id;
--������ �ܺ�����
select last_name ����, d.department_id �μ���ȣ, d.department_name �μ���
from employees e right outer join departments d
on e.department_id= d.department_id;
--Ǯ �ܺ�����
select last_name ����, d.department_id �μ���ȣ, d.department_name �μ���
from employees e full outer join departments d
on e.department_id= d.department_id;
--����
select c.country_name ����, c.country_id ������ȣ, l.location_id ������ȣ, 
       l.city ����
from countries c left outer join locations l
on c.country_id=l.country_id
order by ������ȣ desc;

--ũ�ν� ���� ���� CROSS JOIN (25*4)
select c.country_name ����, r.region_name �����̸�
from countries c cross join regions r; 