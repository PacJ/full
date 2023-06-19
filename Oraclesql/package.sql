-- package
create package pack11
is
procedure test2
(v_stu_no in student.stu_no%type,
v_stu_grade in student.stu_grade%type);

function test6(v_enr_grade in number)

return char;
end;
/

create package body pack11
is
    procedure test2
    (v_stu_no in student.stu_no%type,
    v_stu_grade in student.stu_grade%type)
    is
    begin
        update student
        set stu_grade = v_stu_grade
        where stu_no = v_stu_no;
    end test2;

    function test6(v_enr_grade in number)
    return char 
    is
        enr_score char;
        
    begin 
        if v_enr_grade >=90 then enr_score:='A';
        elsif v_enr_grade>=80 then enr_score:='B';
        elsif v_enr_grade>=70 then enr_score:='C';
        else enr_score:='F';
        end if;
        return (enr_score);
    end test6;
end pack11;
/

execute pack11.test2(20153088,3);

begin
pack11.test2(20153088, 2);
end;
/

select * from student;