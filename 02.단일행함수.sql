--문자형 함수
select LOWER('ABCD'), upper('abcd'), INITCAP('abc')
from dual;

-- CONCAT(두개 문자열 연결), SUBSTR(문자열, 시작위치,문자열 개수),LENGTH(문자열길이)
--INSTR(지정문자의 위치), TRIM(공백을 없애줌)
select concat('헬로우','월드!'), substr('헬로우월드',2,2),length('헬로우'),
instr('헬로우','로'), trim('   공백   '),'  공백   '
from dual;

--문자형 함수 예제
select department_id, last_name, department_id
from employees
where lower(last_name) ='higgins';

select last_name, concat('직업명이 ',job_id) as 직업명
from employees
where substr(job_id,4,3)='REP';

--문자열 치환 함수 REPLACE
select replace('헬로우월드','월드','세상')from dual;

--1
select last_name 이름, lower(last_name) LOWER적용, upper(last_name) UPPER적용, email 이메일, initcap(email) INITCAP적용
from employees;
--2
select job_id 직업명,substr(job_id,1,2) 앞의2개
from employees;

--숫자형 함수
--ROUND(반올림), TRUNC(버림), MOD(나머지)
select round(15.193,1) 소수첫째, round(15.193) 정수 ,round(15.193,2) 소수두번째
from dual;
select trunc(15.193,1) 소수첫째, trunc(15.193) 정수 ,trunc(15.193,2) 소수두번째
from dual;
--짝수번째 번호를 가진 직원들을 출력
select employee_id 짝수번호, last_name 이름 
from employees
where mod(employee_id,2) = 0
order by 1;--첫번째 열로 정열
--예제
select salary, round(salary/30) 정수, round(salary/30, 1) 소수1, round(salary/30, -1) "10의자리"
from employees;

--날짜형 함수
select round(sysdate, 'dd') 일,
round(sysdate, 'mm') 월,
round(sysdate, 'yyyy') 년도,
months_between('2017/10/10', '2017/07/10') 월차이,
add_months('2017/07/10', 3)애드먼쓰
from dual;
--날짜 연산
select sysdate-1 어제, sysdate 오늘, sysdate+1 내일
from dual;
--90번 부서 직원들의 근무일자
select last_name, floor(sysdate - hire_date) 근무일수
from employees
where department_id = 90;
--예제1
select sysdate, hire_date, trunc(months_between(sysdate,hire_date)) 월차이
from employees
where department_id=100;
--예제2
select hire_date, add_months(hire_date,3) "더하기 3개월", add_months(hire_date,-3) "빼기 3개월"
from employees
where employee_id BETWEEN 100 and 106;

--변환형 함수
-- TO_CHAR 숫자를 형식에 맞게 문자열로 표시
select
to_char(12345678,'999,999,999') 콤마,
to_char(123.45678,'999,999,999.99') 소수점,
to_char(123.45678,'$999,999,999.99') 달러,
to_char(12345678,'L999,999,999') 원화
from dual;
--날짜를 문자열로 변경
select
to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') 현재날짜시간
from dual;
--예제1
select employee_id, to_char(hire_date, 'mm/yy') 입사월
from employees
where department_id=100;
--예제2
select last_name 이름, to_char(salary,'$999,999.99')월급
from employees
where salary>10000
order by salary desc;

--문자열을 DATE 타입으로 변환하는 예제
select to_date ('2011-01-01','yyyy-mm--dd')
from dual;
--문자를 숫자로 변환하는 간단한 예제이다.
select to_number('0121')+10
from dual;

--NVL : null값을 다른 값으로 바꿀때 사용, 모든 데이터 타입에 적용가능
select last_name, nvl(manager_id, 0) 매니저
from employees
where last_name ='King';
--NVL2 : null값이 아닐경우 첫번째 , null 값일 경우 두번째로 바뀜
select last_name, nvl2(manager_id,1,0) 매니저
from employees
where last_name ='King';
--예제
select last_name 이름, salary 월급, nvl(commission_pct,0) 커미션, (salary*12)+(salary*12*nvl(commission_pct,0)) 연봉,
nvl2(commission_pct, 'SAL+COMM', 'SAL') 연봉계산
from employees
order by 연봉 desc;

--DECODE(VALUE,IF1,THEN1, IF2,THEN2...)함수 : 조건에 따라 데이터를 다른 값이나 컬럼값으로 추출
select last_name 이름, job_id, salary,
 decode(job_id, 'IT_PROG', salary*1.10,
                'ST_CLERK', salary*1.15,
                'SA_REP', salary*1.20,
                          salary) "수정월급"
  from employees;
-- 예제
select last_name 이름, job_id 직무, salary 월급,
decode(trunc(salary/2000),0,0,
                       1,0.09,
                       2,0.2,
                       3,0.3,
                       4,0.4,
                       5,0.42,
                       6,0.44,
                        0.45)세율
from employees;
--CASE 함수 : DECODE 합수가 제공하지 못하는 비교연산의 단점을 해결할 수 있는 함수
select last_name 이름, job_id, salary,
case when salary<5000 then 'Low'
when salary<10000 then 'Medium'
when salary<20000 then 'Good'
else 'Excellent'
end 급여등급
from employees;
--예제
select employee_id, first_name, last_name,salary,
case when salary>=9000 then '상위급여'
     when salary>=6000 then '중위급여'
     else '하위급여'
     end 급여등급 
from employees
where job_id ='IT_PROG';