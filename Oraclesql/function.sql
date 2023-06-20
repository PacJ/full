create or replace function test6
(v_enr_grade in number) --함수는 in만 사용
return char --함수를 실행한 후 반환값에 대한 자료형 선언

is
    enr_score char;

begin
    if v_enr_grade >= 90 then enr_score:='A';
    elsif v_enr_grade >= 80 then enr_score:='B';
    elsif v_enr_grade >= 70 then enr_score:='C';
    else enr_score:='F';
    end if;
    return (enr_score);
end test6;
/

variable d_score char;
--함수호출해서 d_score에 값 대입
execute :d_score:=test6(86); 
print d_score;

select enr_grade, test6(enr_grade)
from enrol
where stu_no = '20153075';

select * from enrol;