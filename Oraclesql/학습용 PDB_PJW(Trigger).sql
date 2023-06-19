--Trigger: 특정 상황/이벤트 발생 시 수행할 기능을 구현하는데 사용한다.
--간편한 데이터 작업
--복잡한 데이터 규칙 정의
--보안성, 안정성을 위한 대처 활용
--sysdba로 돌아가지 않음.

create table tmp
(userid varchar2(10),
workdate date,
msg char(1));

--student 테이블을 변경하면(한 후에) tmp테이블에 insert가 됨.
create or replace trigger tril
after
update on student

begin
    insert into tmp values('pjw', sysdate, 'A');
end tril;
/

update student
set stu_height = stu_height-10;

select * from student;
select * from tmp;
select * from subject;
select * from enrol;
commit;
rollback;

create or replace trigger tri2
after
update on student
for each row

begin
    insert into tmp values('pjw', sysdate, 'A');
end tri2;
/

---------------------------------------------------------------------------
create table dept_delete(
empno number(10),
ename varchar2(10),
sal number(10));

create or replace trigger tri5
after delete on emp
for each row
begin
                                --이전 value들
    insert into dept_delete values(:old.empno, :old.ename, :old.sal);
    end;
/
select * from emp;
select * from dept_delete;
rollback;
delete from emp
where empno = 7788;