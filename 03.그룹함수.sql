--그룹함수(집계함수)
select round(avg(salary))평균월급, max(salary)최댓값, 
       min(salary)최소값, sum(salary)월급총합, count(salary)총갯수
from employees
where job_id ='IT_PROG';

--그룹절 GROUP BY 그룹별 집계함수
select department_id 부서명, round(avg(salary)) 평균급여, count(*) 부서별인원
from employees
group by department_id
order by department_id;
--예제1
select department_id 부서명, count(*) 사원수, max(salary)최고급여
,min(salary)최소급여,sum(salary)급여합계,round(avg(salary))평균급여
from employees
group by department_id
order by 급여합계 desc;
--예제2
select department_id 부서번호, job_id 직종, sum(salary) 급여합계, count(*)직원수
from employees
group by department_id, job_id
order by department_id;
--예제3
select round(avg(max(salary))) 부서별최고월급평균,
round(avg(min(salary))) 부서별최저월급평균
from employees
group by department_id;

--그룹함수 HAVING 조건절
select department_id 부서, count(*) 사원수
from employees
group by department_id
having count(*) > 5; --그룹조건으로 행의수(사원수)가 5가넘는 그룹
--예제1
select job_id 직종, sum(salary) 월급여합계
from employees
--where job_id <> 'AC_MGR'<where 절에 먼저 써도 됨(일반조건)
group by job_id
HAVING avg(salary)>10000 and job_id <> 'AC_MGR'
order by 월급여합계 desc;
--예제2
select department_id 부서번호, round(avg(salary)) 평균급여
from employees
group by department_id
having department_id <>40 and avg(salary)<=7000;
--예제3
select job_id, sum(salary) 급여총액
from employees
group by job_id
having job_id not like '%REP%' and sum(salary)>=13000
order by 급여총액 desc;