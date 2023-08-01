--새 계정을 생성하려면 일반 계정에서 작업X, 관리자계정에서 가능
create user john identified by 1234; --비번 1234 존 계정을 생성
--접속권한 및 사용권한들을 모아서 한꺼번에 CONNECT, RESOURCE 롤을 부여
grant connect, resource to john;
--권한 제거
revoke resource from john;
revoke connect from john;
--계정 삭제(계정과 관계된 모든 데이터 삭제)
drop user john cascade;