-- ROWNUM �������� �Ϸù�ȣ
select rownum, emp.*
from emp where rownum<=5;
-- 6������ 10������?(�ο���� 1������ �ӽ÷� ��ȣ�� �ű�� �Ŷ� �ٸ� �������δ� �˻��ȵ�)
select rownum, emp.*
from emp where rownum between 6 and 10;
--���̺� ���������� �Է½� ROWNUM�� �ִ� ���̺�
select *
from (select rownum as RN, emp.* from emp)
where RN between 6 and 10;

--����(order by) ������ ROWNUM ��ȣ�� �ű�� ������ ����������
select rownum, emp.*
from emp
where rownum <=5 order by ename;
--������ ���̺��� ���������� ���� ������ �ο������ ��ȣ
select rownum, a.*
from (select empno, ename from emp order by ename) a
where rownum <=5;