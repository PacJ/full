SET SERVEROUTPUT ON;
--V_CON이라는 변수를 하나 만들어 1을 대입함

DECLARE
    V_CON NUMBER:=1;
    
BEGIN
    IF V_CON > 1 THEN
        DBMS_OUTPUT.PUT_LINE('1초과');
    ELSIF V_CON < 1 THEN
        DBMS_OUTPUT.PUT_LINE('1보다작다');
    ELSIF V_CON = 1 THEN
        DBMS_OUTPUT.PUT_LINE('같다');
        
    END IF;
END;
/
    
    
DECLARE
    V_SCORE NUMBER:=87;
    
BEGIN
    CASE
        WHEN V_SCORE>=90 THEN DBMS_OUTPUT.PUT_LINE('A');
        WHEN V_SCORE>=80 THEN DBMS_OUTPUT.PUT_LINE('B');
    END CASE;
END;
/

--기본 LOOP
DECLARE 
    V_CNT NUMBER:=0;
    V_SUM NUMBER:=0;
    
BEGIN
    LOOP
        V_CNT:=V_CNT+1;
        V_SUM:=V_SUM+V_CNT;
        DBMS_OUTPUT.PUT_LINE(V_SUM);
        EXIT WHEN V_CNT=10;
    END LOOP;
END;
/
        
--WHILE LOOP으로 변경
DECLARE 
    V_CNT NUMBER:=0;
    V_SUM NUMBER:=0;
BEGIN
    WHILE V_CNT < 10
        LOOP
            V_CNT:=V_CNT+1;
            V_SUM:=V_SUM+V_CNT;
            DBMS_OUTPUT.PUT_LINE(V_SUM);
        END LOOP;
END;
/    
    
--FOR LOOP
declare
    v_sum number := 0;
begin
    for i in 0..10 loop
        v_sum := v_sum + i;
    end loop;
    dbms_output.put_line(v_sum);
end;
/
    
DECLARE
    V_CNT NUMBER := 0;
    V_SUM NUMBER := 0;
    
BEGIN
    FOR I IN 0..10 
        LOOP      
        V_SUM := V_SUM + I;
        DBMS_OUTPUT.PUT_LINE(V_SUM);
        END LOOP;
END;
/    
    
begin
    for i in 1..9 loop
    continue when mod(i, 2) = 0;
    dbms_output.put_line('현재 i의 값 : ' || i);
    end loop;
end;
/
    
DECLARE 
    V_NUM NUMBER := 0;
    
BEGIN 
    FOR I IN 0..4
        LOOP
        V_NUM := 2 * I + 1;
        DBMS_OUTPUT.PUT_LINE(V_NUM);
        END LOOP;

END;
/   

--PL/SQL
declare
    v_wrong date;
begin
    select ename into v_wrong
    from emp
    where empno=7839;
    dbms_output.put_line('예외 발생하면 다음 문장은 실행되지 않습니다.');
    
exception
    when others then
        dbms_output.put_line('오류 발생'||to_char(sysdate, '[yyyy"년" MM "월" DD "일"]'));
end;
/

create or replace procedure test22
(v_sub_no in enrol.sub_no%type)
is
    v_cnt number;
    cnt_error exception;

begin
    select count(stu_no) into v_cnt
    from enrol
    where sub_no=v_sub_no;
    dbms_output.put_line(v_sub_no || '과목 수강자는' || v_cnt ||'명');
    
    if v_cnt=0 then
        raise cnt_error;
    end if;
    
exception 
    when cnt_error then
        dbms_output.put_line('수강학생 없다');
end test22;
/

execute test22(102);
execute test22(123);
------------------------------------------------------------------------------

select * from emp1;

--emp1 테이블로부터 20번 부서의 사원들로 이루어져 있는 뷰 생성
create or replace view v_emp20
as(select * from emp1 where deptno=20);

select * from v_emp20;

-- empno, ename, dname 을 가지는 view 생성 v_emp_dept(join 활용) -- 이퀴조인
create or replace view v_emp_dept
as (select e.empno, e.ename, d.dname 
from emp e, dept d 
where e.deptno = d.deptno);

select * from v_emp_dept;

--top-n질의
select rownum, e.*
from (select * from emp e order by sal desc)e;

--가장 최근에 입사한 5명의 empno, ename, hiredate
select empno, ename, hiredate
from (select empno, ename, hiredate
    from emp e
    order by hiredate desc)
where hiredate is not null and rownum <= 5;

--급여와 커미션을 합한 금액으로 상위 7명의 empno, ename 검색
select * from emp;
select empno, ename, sal+nvl(comm, 0)
from (select empno, ename, sal, comm
    from emp e
    order by sal + nvl(comm, 0) desc)
where rownum <= 7;

--부서별 평균 급여가 가장 높은 부서 2개의 부서이름 뽑기
--조인, AVG, GROUP BY, ORDER BY, ROWNUM
select dname, avg(sal) from dept, emp where emp.deptno = dept.deptno group by dname;
select dname
from (select dname, avg(sal)
     from dept,emp
     where emp.deptno=dept.deptno
     group by dname
     order by 2 desc)
where rownum<=2;

--학생 테이블에서 키(stu_height)가 큰 상위5명의 학번, 이름, 키 추출
select * from student;
select stu_no, stu_name, stu_height
from (select stu_no, stu_name, stu_height
    from student
    where stu_height is not null
    order by stu_height desc)
where rownum <= 5;

--CURSOR
---------------------------------------------------------------------------------------------
--복수 개의 결과값(행)이 있을 경우 select into를 사용 할 수 없다.
--cursor: 쿼리문에 의해 반환되는 결과값을 저장하는 메모리 공간
--select문의 결과 행 별로 특정 작업 수행
set serveroutput on;

create or replace procedure test7
is
v_stu_no enrol.stu_no%type;
v_sub_no enrol.sub_no%type;
v_enr_grade enrol.enr_grade%type;

--1.명시적 커서 선언
cursor t_cursor is
    select stu_no, sub_no, enr_grade
    from enrol
    where sub_no=105; --데이터를 뽑아 t_cursor에 넣어줌.
    
begin
    --2. 커서열기
    open t_cursor;
    loop
        --3. 커서로부터 읽어온 데이터 가져옴.
        fetch t_cursor into v_stu_no, v_sub_no, v_enr_grade;
        exit when t_cursor%notfound;
        dbms_output.put_line(v_stu_no || ' ' || v_sub_no || ' ' || v_enr_grade);
    end loop;
    --4. 커서 닫음
    close t_cursor;
    end test7;
    /

execute test7;

declare
--커서 데이터가 입력될 변수 선언
v_row emp%rowtype;

--1. 명시적 커서 선언
cursor t_cursor is
select * from emp;

begin
--2. 커서 열기
open t_cursor;
loop
--3. 커서로부터 읽어온 데이터 가져옴
    fetch t_cursor into v_row;
    exit when t_cursor%notfound;
    dbms_output.put_line(v_row.empno || ' ' || v_row.ename);
    end loop;
    
    --4. 커서 닫음
    close t_cursor;
    end;
    /

        
    

