--직원테이블의 인덱스 모음
select
 TABLE_NAME    테이블명,
 INDEX_NAME    인덱스이름,
 COLUMN_NAME   컬럼이름
from ALL_IND_COLUMNS
where table_name ='EMPLOYEES';
--기본키, 유니크 열은 자동으로 인덱스가 생성됨 또한 기본키를 참조하는 외래키도 인덱스가 있음

--예제용 멤버 테이블 만들기
create table members(
  member_id NUMBER,
  first_name varchar2(100) not null,
  last_name varchar2(100) not null,
  gender char(1) not null,
  dob date not null,
  email varchar2(255) not null,
  primary key(member_id) --제약조건을 아래의 행에 따로 넣을떄 괄호안에 열의 이름 입력
);
select
 TABLE_NAME    테이블명,
 INDEX_NAME    인덱스이름,
 COLUMN_NAME   컬럼이름
from ALL_IND_COLUMNS
where table_name ='MEMBERS'; --테이블명은 대문자

select * from members
where last_name = 'Harse';

explain plan for 
select * from members
where last_name = 'Harse';
--보고서 확인
select plan_table_output
from table (dbms_xplan.display());

--인덱스 만들기 멤버즈 테이블의 last_name열, 이름은 members_last_name_i
create index members_last_name_i
on members(last_name);

--인덱스 삭제 (인덱스는 테이블 삭제시 자동삭제됨)
drop index members_last_name_i;