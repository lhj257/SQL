--�� ������ �����Ϸ��� �Ϲ� �������� �۾�X, �����ڰ������� ����
create user john identified by 1234; --��� 1234 �� ������ ����
--���ӱ��� �� �����ѵ��� ��Ƽ� �Ѳ����� CONNECT, RESOURCE ���� �ο�
grant connect, resource to john;
--���� ����
revoke resource from john;
revoke connect from john;
--���� ����(������ ����� ��� ������ ����)
drop user john cascade;