--------------------------------------------------------------------------
-- 저장 서브프로그램

-- 저장 프로시저(sp: stored procedure) --실무에서 가장 많이 사용하는 형태
-- 개발자가 생성해놓은 쿼리문을 마치 하나의 메소드 형식으로 관리하는 것
-- SQL 문에서는 사용할 수 없다.

-- 이미 같은 이름인 procedure / table 이 있으면 or replace 를 추가해서 덮어씌운다.
-- dml(update, insert, delete) , dcl(commit, rollback,..), ddl(create, drop, alter)
drop procedure test4;

create or replace procedure test2(
v_stu_no in student.stu_no%type,
V_stu_grade in student.stu_grade % type
)
is
begin
    update student
    set stu_grade = v_stu_grade
    where stu_no = v_stu_no;
end test2;
/

execute test2(20153088, 3);

select * from student;

drop procedure test2; -- 프로시저 삭제

-- 학번을 입력으로 학생의 이름을 추출하는 프로시저
create or replace procedure test3
(v_stu_no in student.stu_no%type,
v_stu_name out student.stu_name%type)
is
begin
    select stu_name
    into v_stu_name --stu_name을 v_stu_name에 넣겠다.
    from student
    where stu_no=v_stu_no;
end test3;
/

variable d_stu_name varchar2(10)

execute test3(20153088,:d_stu_name);
select * from student;
print d_stu_name;

-- 학생의 점수를 올려주고 결과를 출력하는 저장 프로시저 만들기
-- 과목번호와 학번을 입력받아서 점수

drop procedure test4;

create or replace procedure test4(
v_sub_no in enrol.sub_no % type,
v_stu_no in enrol.stu_no % type,
v_enr_grade in out enrol.enr_grade % type -- 입력후 값 반환
)
is begin
    update enrol
    set enr_grade = enr_grade + v_enr_grade
    where stu_no = v_stu_no and sub_no = v_sub_no;
    
    select enr_grade
    into v_enr_grade
    from enrol
    where stu_no = v_stu_no and sub_no = v_sub_no;
end test4;
/

variable d_enr_grade number
begin
:d_enr_grade:=10; --10점을 더해주고 싶다.
end;
/

DECLARE
   d_enr_grade NUMBER; -- 점수에 대한 변수 정의
BEGIN
   :d_enr_grade := 10; -- 10 입력
END;
/
commit;
execute test4(101, 20131001, :d_enr_grade);

select * from enrol;
print d_enr_grade;