--현재날짜를 표시한다
SELECT sysdate from dual;
--HR계정을 언락학 ㅗ비밀번호를 1234로 수정
alter user HR account unlock identified by 1234;
--scott.sql을 실행(연습용 scott계정을 사용하기 위함)
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
--scott계정읠 비밀번호를 1234로 수정
alter user scott identified by 1234;
