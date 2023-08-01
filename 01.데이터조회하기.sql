SELECT*
from countries;

SELECT*
from departments;

SELECT department_name
from departments;

SELECT department_name, department_id
from departments;

SELECT department_name 부서이름, department_id 부서번호
from departments;

select *
from employees;

select last_name 이름, job_id 직종, salary 월급, salary+100 보너스월급, salary-salary*0.1 감봉
from employees;

select job_id
from employees;

select job_id 직종
from employees;
--DISTINCT < 중복값 제거
select distinct job_id 직종
from employees;

select employee_id, first_name,last_name
from employees;

select employee_id 사원번호, first_name 이름, last_name 성
from employees;

select first_name, salary, salary*1.1 AS뉴셀러리
from employees;
--|| < 연결 연산자
select last_name || ' is a ' ||job_id as "직업정보"
from employees;

select employee_id ||' '||first_name ||' '||last_name "사번 이름", email||'@company.com' as 이메일
from employees;
--WHERE (조건 연산자)
select *
from employees
where salary > 14000;

select *
from employees
where last_name = 'King'; -- 문자열은 대소문자 구분

select *
from employees
where hire_date < '2002-06-10'; -- 날짜는 문자열이 자동으로 바뀐다

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
where location_id<>1700;  --같지 않음 <> , !=
--AND OR NOT 연산자
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
--IN 연산자
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
--BETWEEN 연산자
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

--LIKE 연산자 문자열 키워드 조회시 % 또는 _같이 사용
SELECT *
from employees
where last_name LIKE 'B%'; --B로 시작하는 모든 문자열 검색

SELECT *
from employees
where last_name LIKE '%b%'; -- 중간에 b가 들어가는 모든 문자열 검색

SELECT *
from employees
where last_name LIKE '____y'; -- _(언더바)는  딱 한문자를 의미한다.
--예제
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
--IS NULL, ORDER BY 연산자
--널 값을 검색할때 is null
SELECT *
from employees
where commission_pct is null;
--널이 아닌 경우 is not null
SELECT *
from employees
where commission_pct is not null;
--예제
SELECT *
from employees
where manager_id is null;
-- 정렬순서를 지정할때 ORDER BY
select *
from employees
order by salary; --ASC(오름차순,디폴트 생략가능) DESC(내림차순)
--2개 이상의 열로 정렬시
select department_id, employee_id, first_name, last_name
from employees
order by department_id, employee_id; -- 처음에 부서번호순이고, 같으면 진원번호순서

--별칭열로 정렬
SELECT department_id, last_name, salary*12 연봉
from employees
order by 연봉 desc; --연봉이 큰순으로 정렬
--예제
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
select employee_id 직원번호, first_name 직원이름, department_id 부서번호, salary 월급
from employees
where employee_id between 120 and 150
order by department_id desc, salary desc;