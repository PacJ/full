set serveroutput on;

--1.	emp1 테이블을 복사하여 emp01 이라는 테이블을 생성해라.
create table emp01
as select * from emp;

select * from emp01;
--2.	emp01 테이블의 모든 데이터를 삭제시키는 프로시저를 생성해라. (프로시저: all_del)
create or replace procedure all_del
is
begin
    delete from emp01;
end;
/
execute all_del;
select * from emp01;

--3.	2번에서 지웠던 데이터들을 다시 1번처럼 복구해라.
insert into emp01 select * from emp;
select * from emp01;

--4.	emp01 테이블의 사원이름과 같은 타입인 v_ename을 선언하여 이름에 ‘M’이 들어간 사원들을 다 삭제하는 프로시저를 생성하라.(프로시저: del_name)
create or replace procedure del_name
is
v_ename emp01.ename %type;

begin
    delete from emp01
    where ename LIKE '%M%';
end;
/

execute del_name;
select * from emp01;

--5.	emp01 테이블에 있는 사원번호(empno)와 입력한 사원번호값이 같은 사원이름(ename)과 월급(sal), 직무(job)를 검색하는 프로시저를 생성하라.(프로시저: search_pro)
--단, 받는 변수를 바인드 변수로 설정하여 프로시저를 실행시켜라.
--사원번호는 7844로 입력해라.
create or replace procedure search_pro
(v_empno in emp01.empno%type,
v_ename out emp01.ename%type,
v_sal out emp01.sal%type,
v_job out emp01.job%type
)
is
begin
    select ename, sal, job
    into v_ename, v_sal, v_job
    from emp01
    where empno = v_empno;
end;
/

  variable o_ename VARCHAR2(20);
  variable o_sal NUMBER;
  variable o_job VARCHAR2(20);


execute search_pro(7844, :o_ename, :o_sal, :o_job);

print o_ename;
print o_sal;
print o_job;
