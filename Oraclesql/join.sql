--최대 키가 175이상인 학과와 학과별 최대 키 추출
select stu_dept, max(stu_height)
from student
group by stu_dept having max(stu_height)>=175;

--학과별 평균 키 중 가장 높은 평균 키 구하기
select to_char(max(avg(stu_height)), '999.99')
from student
group by stu_dept;

select * from student;
select * from enrol;
select * from subject;

--조인
select student.stu_no, stu_name, stu_dept, enr_grade
from student, enrol
where student.stu_no=enrol.stu_no;

--natural join으로 변경
select stu_no, stu_name, stu_dept, enr_grade
from student natural join enrol;

--101번 과목을 수강하는 학생들의 학번, 이름 추출
select student.stu_no, stu_name
from student,enrol
where student.stu_no=enrol.stu_no and sub_no=101;

--join~using
select stu_no, stu_name, stu_dept, enr_grade
from student join enrol using(stu_no);

--join~on
select student.stu_no, stu_name, stu_dept, enr_grade
from student join enrol on student.stu_no=enrol.stu_no;

--self join
select a.empno as 사원번호, a.ename as 사원이름,
       b.empno as 상급자번호, b.ename as 상급자이름
from emp a, emp b --emp 테이블이 두번 사용됨
where a.mgr = b.empno; --구분하기 위해 별칭 사용함

--outer join
--조인조건을 만족하지 않는 행들도 질의 결과에 포함하기 위한 조인
select a.*, sub_name
from enrol a right outer join subject b
on a.sub_no = b.sub_no
order by 1; --필드 번호(1:sub_no, 2:stu_no, 3:enr_grade, 4:sub_name)

select * from enrol;
select * from subject;



--1. ADAMS사원이 근무 중인 부서이름과 지역을검색하라.(equi join)
select dept.dname, dept.loc
from emp, dept
where emp.ename = 'ADAMS' and emp.deptno = dept.deptno;

select * from dept;
select * from emp;

--2. 급여가 2000이상인 사원들의 사원명과 지역을검색하라. (natural join)
select ename, loc
from emp natural join dept
where emp.sal >= 2000;

--3. 2번을equi join으로 바꿔라.
select ename, loc
from emp, dept
where emp.sal >=2000 and emp.deptno = dept.deptno;

--4. 급여가 1000 이상 2000 이하인 사원들의 사원번호, 사원이름, 부서이름을 사원번호순으로 검색하라. (join using)
select empno, ename, dept.dname
from emp join dept using(deptno)
where emp.sal >= 1000 and emp.sal <=2000
order by empno;

--5. 사원직무가 SALESMAN이면서 CHICAGO 지역에 근무 중인 사원명을 검색하라.
select ename
from emp natural join dept
where loc = 'CHICAGO' and job = 'SALESMAN';

--6. NEW YORK이나 DALLAS 지역에 근무하는 사원들의 사원번호와 사원이름을 사원번호 순으로 검색하라. (equi join)
select empno, ename
from emp, dept
where emp.deptno = dept.deptno
and (dept.loc='NEW YORK' or dept.loc='DALLAS')
order by empno;

--7. 부서이름이 ACCOUNTING이거나, 지역이 CHICAGO인 사원의 사원번호와 사원이름을 검색하라. (equi join)
select empno, ename
from emp, dept
where emp.deptno = dept.deptno
and (dept.dname = 'ACCOUNTING' or dept.loc = 'CHICAGO');

--8. NEW YORK이나 DALLAS 지역에 근무하는 사원들의 사원번호와 사원이름을 사원번호 순으로 검색하라. (natural join)
select empno, ename
from emp natural join dept
where dept.loc = 'NEW YORK' or dept.loc = 'DALLAS'
order by empno;

