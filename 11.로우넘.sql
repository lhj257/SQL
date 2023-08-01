-- ROWNUM 데이터의 일련번호
select rownum, emp.*
from emp where rownum<=5;
-- 6번부터 10번까지?(로우넘은 1번부터 임시로 번호를 매기는 거라 다른 조건으로는 검색안됨)
select rownum, emp.*
from emp where rownum between 6 and 10;
--테이블에 서브쿼리로 입력시 ROWNUM이 있는 테이블
select *
from (select rownum as RN, emp.* from emp)
where RN between 6 and 10;

--정렬(order by) 이전에 ROWNUM 번호를 매기기 때문에 마찬가지로
select rownum, emp.*
from emp
where rownum <=5 order by ename;
--정령한 테이블을 서브쿼리에 넣은 다음에 로우넘으로 번호
select rownum, a.*
from (select empno, ename from emp order by ename) a
where rownum <=5;