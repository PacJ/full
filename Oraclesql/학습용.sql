create table dept(
deptno number(2) constraint pk_dept primary key,
dname varchar2(14),
loc varchar2(13));

insert into dept values
(10,'ACCOUNTING','NEW YORK');

insert into dept values
(20,'RESEARCH','DALLAS');

insert into dept values
(30,'SALES','CHICAGO');

insert into dept values
(40,'OPERATIONS','BOSTON');

create table emp(
empno number(4)
constraint pk_emp primary key,
ename varchar2(10),
job varchar2(9),
mgr number(4),
hiredate date,
sal number(7,2),
comm number(7,2),
deptno number(2));

insert into emp values(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);

insert into emp values(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);

insert into emp values(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);

insert into emp values(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);

insert into emp values(7788,'SCOTT','ANALYST',7566,to_date('13-07-1987','dd-mm-yyyy'),3000,NULL,20);

insert into emp values(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);

insert into emp values(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);

insert into emp values(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);

insert into emp values(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);

insert into emp values(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);

insert into emp values(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);

insert into emp values(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

insert into emp values(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);

insert into emp values(7876,'ADAMS','CLERK',7788,to_date('13-07-1987','dd-mm-yyyy'),1100,NULL,20);

create table salgrade(

grade number(7,2),

losal number(7,2),

hisal number(7,2));

insert into salgrade values(1,700,1200);

insert into salgrade values(2,1201,1400);

insert into salgrade values(3,1401,2000);

insert into salgrade values(4,2001,3000);

insert into salgrade values(5,3001,9999);

select * from dept;
select * from emp;
select * from salgrade;


select empno, ename, to_char(hiredate,'yyyy-mm') as 입사년월
from emp;

select sysdate from dual; --현재날짜 --  년/월/일
select next_day(sysdate,3)from dual;

--일 :1
--월 :2
--화 :3
--수 :4

--숫자형태의 문자를 숫자로 변환하는 함수 (9: 자릿수)
select to_char(to_number(1234.5678),'9999.999')from dual;

select to_char(to_number(1234.5678),'999.999')from dual;  --에러

select empno, ename, to_char(to_number(sal),'$999') salary
from emp;

--nullif(인수1, 인수2) : 인수1과 인수2값이 같으면 null, 아니면 인수1값 반환
select nvl(nullif('A', 'A'), '널')
from dual;


select empno, ename, sal,
    case job when 'SALESMAN' then sal*1.1
        when 'CLERK' then sal*1.15
        when 'MANAGER' then sal*1.2
        else sal
    end as 연봉인상
from emp;

select empno, ename, job, sal,
    decode(job, 'SALESMAN', sal*1.1,
                'CLERK', sal*1.15,
                'MANAGER',
                sal*1.2,
                sal) as 연봉인상
from emp;

select stu_grade, avg(stu_height)
from student
where stu_dept = '기계'
group by stu_grade;


select * from student;