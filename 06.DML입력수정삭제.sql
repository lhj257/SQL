--�Է� INSERT
--���̺� ���� ������Ÿ�� ������ ����
desc departments;
insert into departments(department_id, department_name,manager_id,location_id)
values(300,'Game',100,1700);
--���̸� �����Ҷ�(��� ���� ���Է��ؾ���)
insert into departments
values(290,'Fishing',100,1700);
--NULL���� �Էµ� ��(�Է��� ���� ������ NULL)
insert into departments(department_id, department_name)
values(280,'Music');

--�������̺� �Է�
desc employees;
insert into employees
values (207, '�浿','ȫ','hong@naver.com','010.1234.5678',sysdate,'IT_PROG',
9999,null,205,300);
--����1
insert into departments
values (271,'Sample Dept 1',200,1700);
insert into departments
values (272,'Sample Dept 2',200,1700);
insert into departments
values (273,'Sample Dept 3',200,1700);

--���� UPDATE (������:where�� ������ ������� ������Ʈ��)
--���Ǻμ��� �Ŵ����� �����̼� �����ϱ�
update departments
set manager_id = 100, location_id =1700
where department_name = 'Music';
--���� �μ���ȣ 150���� 200������ �Ŵ���ID�� 100���� ����
update departments
set manager_id = 100
where department_id between 150 and 200;

--���� DELETE
delete from departments
where department_name = 'Music';
delete from departments
where department_name = 'Game';
--���� �����ϴ� �����͸� �����ϴ� ���̺�� �����Ͱ� ������� �����ϴ� �����͸� ���� �����ؾ� ��������
delete from employees
where last_name= 'ȫ';
--������ where�� ��������? : ��ü�� ����ǹǷ� ����

--���� ���·� ���� (������ ������ commit ���·� ���ư�)
rollback;
--�Է� ���� ���� �����ϱ�
--scott ����
desc bonus;
desc dept;
insert into bonus
values ('Lee', 'PROG', 3000, 0.5);
delete from bonus
where ename = 'Lee';