--1
select department_name 부서명, count(*)사원수
from departments d join employees e
on d.department_id= e.department_id
group by department_name
order by 사원수 desc;
--2
select d.department_name 부서명, round(avg(salary)) 평균급여
from employees e join departments d
on e.department_id= d.department_id
group by d.department_name
order by 평균급여 desc;
--3(지금못품)
