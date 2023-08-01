desc emp;




select *
from emp
where ename = upper('smith');






select *
from emp
where length(ename) <=4;




select count( distinct job)
from emp;





select *
from emp
where sal < (select sal
      from emp
      where ename = 'MARTIN');
      
      
      
      
      
select *
from emp
where sal > (select max(sal)
            from emp
            where deptno =30);
            
            
            
            
            
select *
from emp e join salgrade s
on e.sal between s.losal and s.hisal
where e.deptno= 30 and s.grade= 3;





rollback;





select empno 사원번호, ename 사원이름, sal 월급, nvl(comm,0) 추가수당,
sal*12+nvl(comm,0) "annsal(연봉)"
from emp;





select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where sal >=3000;