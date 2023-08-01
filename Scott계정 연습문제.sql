--1
select empno 사원번호, ename 이름, sal 월급
from emp
where deptno=10;
--2
select ename 이름, hiredate 입사일 , deptno 부서번호
from emp
where empno=7369;
--3
select *
from emp
where ename='ALLEN';
--4
select ename 이름, deptno 부서번호, sal 월급
from emp
where hiredate='81/02/20';
--5
select *
from emp
where job<>'MANAGER';
--6
select *
from emp
where hiredate>='81/04/02';
--7
select ename 이름, sal 월급, deptno 부서번호
from emp
where sal>=800;
--8
select *
from emp
where deptno>=20;
--9
select *
from emp
where ename>='L';
--10
select *
from emp
where hiredate<'81/12/09';
--11
select empno 직원번호, ename 이름
from emp
where empno<=7698;
--12
select ename 이름, sal 월급, deptno 부서번호
from emp
where hiredate >='81/04/02' and hiredate<='82/12/09';
--13
select ename 이름, job 직업, sal 월급
from emp
where sal >1600 and sal<3000;
--14
select *
from emp
where empno not between 7654 and 7782;
--15
select *
from emp 
where ename between 'B' and 'J';
--16
select *
from emp
where hiredate not like '81/%/%'; 
--17
select *
from emp
where job='MANAGER' or job='SALESMAN';
--18
select ename 이름, empno 사원번호, deptno 부서번호
from emp
where deptno <>20 and deptno<>30; -- not in (20, 30)
--19
select empno 사원번호, ename 이름, hiredate 입사일, deptno 부서번호
from emp
where ename like 'S%';
--20
select *
from emp
where hiredate like '81/%/%';
--21
select *
from emp
where ename like '%S%';
--22
select *
from emp
where ename like 'M____N';
--23
select *
from emp
where ename like '_A%';
--24
select *
from emp
where comm is null;
--25
select *
from emp
where comm is not null;
--26
select ename 이름, deptno 부서번호, sal 월급
from emp
where deptno =30 and sal>=1500;
--27
select empno 사원번호, ename 이름, deptno 부서번호
from emp
where ename like 'K%' or deptno=30;
--28
select *
from emp
where sal>=1500 and deptno=30 and job='MANAGER';
--29
select *
from emp
where deptno=30
order by empno;
--30
select *
from emp
order by sal desc;
--31
select *
from emp
order by deptno, sal desc;
--32
select deptno 부서번호, ename 이름 , sal 월급
from emp
order by deptno desc, ename, sal desc;
--33
select ename 이름, sal 급여, round(sal*0.13) 보너스, deptno 부서번호
from emp
where deptno=10;
--34
select ename 이름, sal 급여, nvl(comm,0) 커미션, sal+nvl(comm,0) 총액
from emp
order by  총액 desc;
--35
select ename 이름, sal 급여, to_char( round(sal*0.15,1) ,'$999.9' ) 회비
from emp
where sal between 1500 and 3000;
--36
select d.dname 부서명, count(e.empno) 사원수
from emp e join dept d
on e.deptno = d.deptno
group by d.dname
having count(e.empno)>5;
--37
select job 직업, sum(sal) 급여합계
from emp where job<>'SALESMAN'
group by job
having sum(sal)>5000;
--38
select e.empno 사원번호, e.ename 사원명, e.sal 급여, s.grade 급여등급
from emp e join salgrade s
on e.sal between s.losal and s.hisal;
--39
select deptno 부버번호, count(empno) 사원수, count(comm) "커미션 받은 사원수"
from emp
group by deptno;
--40
select ename 이름, deptno 부서번호,
decode(deptno, 10, '총부무',
               20, '개발부',
               30, '영업부') 부서명
from emp;