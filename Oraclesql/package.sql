-- package
create package pack111
is
procedure test222
(v_stu_no in student.stu_no%type,
v_stu_grade in student.stu_grade%type);

function test666(v_enr_grade in number)

return char;
end;
/

create package body pack111
is
    procedure test222
    (v_stu_no in student.stu_no%type,
    v_stu_grade in student.stu_grade%type)
    is
    begin
        update student
        set stu_grade = v_stu_grade
        where stu_no = v_stu_no;
    end test222;

    function test666(v_enr_grade in number)
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
    end test666;
end pack111;
/
commit;

execute pack111.test222(20153088,1);
select * from student;

variable d_score char;
execute :d_score := pack111.test666(95);
print d_score

begin
pack111.test222(20153088, 3);
end;
/

select * from student;