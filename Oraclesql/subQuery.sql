--서브쿼리
select stu_no, stu_height, stu_name
from student
where stu_height > (select stu_height from student where stu_name = '옥성우');

select * from student;
--11. FORD 사원과 같은 급여를 받는 사원의 사원번호를검색하라. (부질의)
select empno
from emp
where emp.sal = (select emp.sal from emp where emp.ename = 'FORD');

--12. 부서이름이 ‘SALES’이면서 사원직무가 ‘MANAGER’인 사원의 사원번호, 사원이름을 사원이름 순으로 검색하라. (natural join)
select empno, ename
from emp natural join dept
where dept.dname = 'SALES' and emp.job = 'MANAGER';

--13. SCOTT 사원보다 많은 급여를 받는 사원 정보를검색하라. (부질의)
select * from emp
where emp.sal > (select emp.sal from emp where emp.ename = 'SCOTT');

--14. ALLEN 사원보다 적은 급여를 받는 사원 정보를검색하라. (부질의)
select * from emp
where emp.sal < (select emp.sal from emp where emp.ename = 'ALLEN');

--15. 전체 사원의 평균 급여보다 급여가 많은 사원 정보를 검색하라. (부질의)
select * from emp
where emp.sal > (select avg(emp.sal) from emp);

--16. CHICAGO 지역에 위치하는 부서에 근무하는사원 정보를 검색하라. (부질의)
select * from emp
where emp.deptno = (select deptno from dept where loc = 'CHICAGO');

select * 
from emp natural join dept
where dept.loc = 'CHICAGO';