--신입사원을 채용하였다.
--사원번호, 사원이름, 사원직무, 상급자사원번호, 급여, 부서번호를 입력받아
--사원 테이블에 삽입하는 프로시저를 작성해라.
select * from emp;
select * from dept;

create or replace procedure insertEmp(
v_emp_no in emp.empno%type,
v_emp_name in emp.ename%type,
v_emp_job in emp.job%type,
v_emp_mgr in emp.mgr%type,
v_emp_sal in emp.sal%type,
v_emp_deptno in emp.deptno%type
)
is
begin
    insert into emp(empno, ename, job, mgr, sal, deptno)
    values(v_emp_no, v_emp_name, v_emp_job, v_emp_mgr, v_emp_sal, v_emp_deptno);
    
commit;
end insertEmp;
/

execute insertEmp(7777, 'Bark', 'Analyst', 7566, 3000, 20);
select * from emp;

--부서번호를 변경하는 프로시저를 작성해라.
--(emp 테이블에서) - update~set~where
--(입력된 사원번호가 같을때 부서번호 변경해라)
create or replace procedure setDeptNo(
e_emp_no in emp.empno%type,
d_dept_no in emp.deptno%type
)
is
begin
    update emp
    set deptno = d_dept_no
    where empno = e_emp_no;

commit;
end setDeptNo;
/

execute setDeptNo(7777, 40);
select * from emp;

create sequence seq1
increment by 1
start with 1
maxvalue 999;

