--1
select department_name �μ���, count(*)�����
from departments d join employees e
on d.department_id= e.department_id
group by department_name
order by ����� desc;
--2
select d.department_name �μ���, round(avg(salary)) ��ձ޿�
from employees e join departments d
on e.department_id= d.department_id
group by d.department_name
order by ��ձ޿� desc;
--3(���ݸ�ǰ)
