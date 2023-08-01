--�������̺��� �ε��� ����
select
 TABLE_NAME    ���̺��,
 INDEX_NAME    �ε����̸�,
 COLUMN_NAME   �÷��̸�
from ALL_IND_COLUMNS
where table_name ='EMPLOYEES';
--�⺻Ű, ����ũ ���� �ڵ����� �ε����� ������ ���� �⺻Ű�� �����ϴ� �ܷ�Ű�� �ε����� ����

--������ ��� ���̺� �����
create table members(
  member_id NUMBER,
  first_name varchar2(100) not null,
  last_name varchar2(100) not null,
  gender char(1) not null,
  dob date not null,
  email varchar2(255) not null,
  primary key(member_id) --���������� �Ʒ��� �࿡ ���� ������ ��ȣ�ȿ� ���� �̸� �Է�
);
select
 TABLE_NAME    ���̺��,
 INDEX_NAME    �ε����̸�,
 COLUMN_NAME   �÷��̸�
from ALL_IND_COLUMNS
where table_name ='MEMBERS'; --���̺���� �빮��

select * from members
where last_name = 'Harse';

explain plan for 
select * from members
where last_name = 'Harse';
--���� Ȯ��
select plan_table_output
from table (dbms_xplan.display());

--�ε��� ����� ����� ���̺��� last_name��, �̸��� members_last_name_i
create index members_last_name_i
on members(last_name);

--�ε��� ���� (�ε����� ���̺� ������ �ڵ�������)
drop index members_last_name_i;