--Trigger: 특정 상황/이벤트 발생 시 수행할 기능을 구현하는데 사용한다.
--간편한 데이터 작업
--복잡한 데이터 규칙 정의
--보안성, 안정성을 위한 대처 활용

create table tmp
(userid varchar2(10),
workdate date,
msg char(1));

create or replace trigger tril
after
update on student

begin
    insert into tmp values('pjw', sysdate, 'A');
end tril;
/