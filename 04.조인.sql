--기본 JOIN 방법
select e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, 
       d.department_name 부서명
from employees e join departments d
on e.department_id = d.department_id;
--3개 테이블 조인
select employee_id, city, department_name
from employees e join departments d
on e.department_id=d.department_id
join locations l
on d.location_id= l.location_id;
--조인과 함께  where 조건절을 적는다
select e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, 
       d.department_name 부서명
from employees e join departments d
on e.department_id = d.department_id
where d.department_id=50;
--예제
select department_name 부서명, city 도시명, country_name 국가명
from departments d join locations l
on d.location_id = l.location_id
join countries c on l.country_id=c.country_id
where city= 'Seattle' or city='London';

--자체조인(같은 테이블내에서 참조하고 있을경우)
select e.last_name 직원 ,m.last_name 매니저
from employees e join employees m
on e.manager_id = m.employee_id;

--외부조인
--왼쪽 외부조인
select last_name 직원, e.department_id 부서번호, d.department_name 부서명
from employees e left outer join departments d
on e.department_id= d.department_id;
--오른쪽 외부조인
select last_name 직원, d.department_id 부서번호, d.department_name 부서명
from employees e right outer join departments d
on e.department_id= d.department_id;
--풀 외부조인
select last_name 직원, d.department_id 부서번호, d.department_name 부서명
from employees e full outer join departments d
on e.department_id= d.department_id;
--예제
select c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, 
       l.city 도시
from countries c left outer join locations l
on c.country_id=l.country_id
order by 지역번호 desc;

--크로스 조인 예제 CROSS JOIN (25*4)
select c.country_name 국가, r.region_name 지역이름
from countries c cross join regions r; 