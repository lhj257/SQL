--�׷��Լ�(�����Լ�)
select round(avg(salary))��տ���, max(salary)�ִ�, 
       min(salary)�ּҰ�, sum(salary)��������, count(salary)�Ѱ���
from employees
where job_id ='IT_PROG';

--�׷��� GROUP BY �׷캰 �����Լ�
select department_id �μ���, round(avg(salary)) ��ձ޿�, count(*) �μ����ο�
from employees
group by department_id
order by department_id;
--����1
select department_id �μ���, count(*) �����, max(salary)�ְ�޿�
,min(salary)�ּұ޿�,sum(salary)�޿��հ�,round(avg(salary))��ձ޿�
from employees
group by department_id
order by �޿��հ� desc;
--����2
select department_id �μ���ȣ, job_id ����, sum(salary) �޿��հ�, count(*)������
from employees
group by department_id, job_id
order by department_id;
--����3
select round(avg(max(salary))) �μ����ְ�������,
round(avg(min(salary))) �μ��������������
from employees
group by department_id;

--�׷��Լ� HAVING ������
select department_id �μ�, count(*) �����
from employees
group by department_id
having count(*) > 5; --�׷��������� ���Ǽ�(�����)�� 5���Ѵ� �׷�
--����1
select job_id ����, sum(salary) ���޿��հ�
from employees
--where job_id <> 'AC_MGR'<where ���� ���� �ᵵ ��(�Ϲ�����)
group by job_id
HAVING avg(salary)>10000 and job_id <> 'AC_MGR'
order by ���޿��հ� desc;
--����2
select department_id �μ���ȣ, round(avg(salary)) ��ձ޿�
from employees
group by department_id
having department_id <>40 and avg(salary)<=7000;
--����3
select job_id, sum(salary) �޿��Ѿ�
from employees
group by job_id
having job_id not like '%REP%' and sum(salary)>=13000
order by �޿��Ѿ� desc;