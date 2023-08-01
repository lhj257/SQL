--서브쿼리
--팝 직원의 고용일보다 이후에 고용된 직원들
--단일행 서브쿼리는 서브쿼리의 결과가 한줄만 나와야 한다.
select last_name 이름, hire_date 고용일자
from employees
where hire_date > (select hire_date 
                   from employees 
                   where last_name='Popp');
--집계함수 서브쿼리
select last_name 이름, job_id 직종, salary 급여
from employees
where salary = (select min(salary) 
                from employees);
--예제1
select last_name, salary
from employees
where salary > (select salary 
                from employees 
                where last_name = 'Abel');
--예제2
select employee_id, last_name, department_id, salary
from employees
where salary > (select salary 
                from employees
                where last_name = 'Bull')
and department_id = (select department_id 
                     from employees 
                     where last_name = 'Bull');
--예제3
select last_name, salary, manager_id
from employees
where manager_id = (select employee_id 
                    from employees 
                    where last_name = 'Russell');
--예제4
select *
from employees 
where job_id = (select job_id 
                from jobs 
                where job_title = 'Stock Manager');
                
--다중행 서브쿼리
select min(salary)
from employees
group by department_id;
-- 부서별 최소급여와 같은 급여를 받는 직원들
select employee_id, last_name
from employees
where salary in (select min(salary)
               from employees
               group by department_id);
--다중열 ANY연산자 : 서브쿼리 결과중 하나라도 차이면 검색됨
select employee_id, last_name, job_id, salary
from employees
where salary < any (select salary
                    from employees
                    where job_id='IT_PROG')
and job_id <> 'IT_PORG'
order by salary desc;
-- ALL: 서브쿼리 결과가 모두 참이어야 검색도미
select employee_id, last_name, job_id, salary
from employees
where salary < all (select salary
                    from employees
                    where job_id='IT_PROG')
and job_id <> 'IT_PORG'
order by salary desc;
--예제1
select employee_id, first_name, job_id, salary
from employees
where manager_id in (select manager_id
                     from employees
                     where department_id=20)
and department_id <> 20;
--예제2
select employee_id,last_name, job_id, salary
from employees
where salary < any (select salary
                    from employees
                    where job_id ='ST_MAN');
--예제3
select employee_id,last_name, job_id, salary
from employees
where salary < all (select salary
                    from employees
                    where job_id ='IT_PROG');

--서브쿼리 다중열
--브루스와 같은 직종과 같은 상사인 직원들
select employee_id, first_name, job_id ,salary, manager_id
from employees
where (manager_id, job_id) in (select manager_id, job_id
                               from employees
                               where first_name='Bruce')
and first_name <> 'Bruce';

--집합연산자(UNION, INTERSECT, MINUS)
--UNION(합집합)
select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;
--INTERSECT(교집합)
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;
--MINUS ( A와B의 차집합)
select employee_id, job_id
from employees
MINUS
select employee_id, job_id
from job_history;
--예제1
select department_id
from employees
union
select department_id
from departments;
--예제2
select department_id
from employees
union all
select department_id
from departments;
--예제3
select department_id
from employees
intersect
select department_id
from departments;
--예제4
select department_id
from departments
minus
select department_id
from employees;