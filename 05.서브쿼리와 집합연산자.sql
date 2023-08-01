--��������
--�� ������ ����Ϻ��� ���Ŀ� ���� ������
--������ ���������� ���������� ����� ���ٸ� ���;� �Ѵ�.
select last_name �̸�, hire_date �������
from employees
where hire_date > (select hire_date 
                   from employees 
                   where last_name='Popp');
--�����Լ� ��������
select last_name �̸�, job_id ����, salary �޿�
from employees
where salary = (select min(salary) 
                from employees);
--����1
select last_name, salary
from employees
where salary > (select salary 
                from employees 
                where last_name = 'Abel');
--����2
select employee_id, last_name, department_id, salary
from employees
where salary > (select salary 
                from employees
                where last_name = 'Bull')
and department_id = (select department_id 
                     from employees 
                     where last_name = 'Bull');
--����3
select last_name, salary, manager_id
from employees
where manager_id = (select employee_id 
                    from employees 
                    where last_name = 'Russell');
--����4
select *
from employees 
where job_id = (select job_id 
                from jobs 
                where job_title = 'Stock Manager');
                
--������ ��������
select min(salary)
from employees
group by department_id;
-- �μ��� �ּұ޿��� ���� �޿��� �޴� ������
select employee_id, last_name
from employees
where salary in (select min(salary)
               from employees
               group by department_id);
--���߿� ANY������ : �������� ����� �ϳ��� ���̸� �˻���
select employee_id, last_name, job_id, salary
from employees
where salary < any (select salary
                    from employees
                    where job_id='IT_PROG')
and job_id <> 'IT_PORG'
order by salary desc;
-- ALL: �������� ����� ��� ���̾�� �˻�����
select employee_id, last_name, job_id, salary
from employees
where salary < all (select salary
                    from employees
                    where job_id='IT_PROG')
and job_id <> 'IT_PORG'
order by salary desc;
--����1
select employee_id, first_name, job_id, salary
from employees
where manager_id in (select manager_id
                     from employees
                     where department_id=20)
and department_id <> 20;
--����2
select employee_id,last_name, job_id, salary
from employees
where salary < any (select salary
                    from employees
                    where job_id ='ST_MAN');
--����3
select employee_id,last_name, job_id, salary
from employees
where salary < all (select salary
                    from employees
                    where job_id ='IT_PROG');

--�������� ���߿�
--��罺�� ���� ������ ���� ����� ������
select employee_id, first_name, job_id ,salary, manager_id
from employees
where (manager_id, job_id) in (select manager_id, job_id
                               from employees
                               where first_name='Bruce')
and first_name <> 'Bruce';

--���տ�����(UNION, INTERSECT, MINUS)
--UNION(������)
select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;
--INTERSECT(������)
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;
--MINUS ( A��B�� ������)
select employee_id, job_id
from employees
MINUS
select employee_id, job_id
from job_history;
--����1
select department_id
from employees
union
select department_id
from departments;
--����2
select department_id
from employees
union all
select department_id
from departments;
--����3
select department_id
from employees
intersect
select department_id
from departments;
--����4
select department_id
from departments
minus
select department_id
from employees;