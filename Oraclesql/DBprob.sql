create table product(
p_code char(3) not null,
p_name varchar2(30),
p_cost number,
p_group varchar2(30),
constraint product_pk primary key(p_code)
);

insert into product values('101','19인치 모니터',150000,'모니터');
insert into product values('102','22인치 모니터',200000,'모니터');
insert into product values('103','25인치',260000,'모니터');
insert into product values('201','유선마우스',7000,'마우스');
insert into product values('202','무선마우스',18000,'마우스');
insert into product values('301','유선키보드',8000,'키보드');
insert into product values('302','무선키보드',22000,'키보드');
insert into product values('401','2채널 스피커',10000,'스피커');
insert into product values('402','5.1채널 스피커',120000,'스피커');

create table trade(
t_seq number not null,
p_code char(3),
c_code varchar2(4),
t_date date,
t_qty number,
t_cost number,
t_tax number,
constraint trade_pk primary key(t_seq)
);

select * from trade;
insert into trade
values (61,'131','101',to_date('2016-04-01','yyyy-mm-dd'),10,150000,150000);
insert into trade
values (5,'102','102',to_date('2016-04-26','yyyy-mm-dd'),8,200000,160000);
insert into trade
values (8,'103','101',to_date('2016-05-20','yyyy-mm-dd'),2,260000,52000);
insert into trade
values (3,'201','103',to_date('2016-04-13','yyyy-mm-dd'),7,7000,4900);
insert into trade
values (2,'201','101',to_date('2016-04-12','yyyy-mm-dd'),5,7000,3500);
insert into trade
values (9,'202','104',to_date('2016-06-02','yyyy-mm-dd'),8,18000,14400);
insert into trade
values (6,'301','103',to_date('2016-05-02','yyyy-mm-dd'),12,8000,9600);
insert into trade
values (10,'302','103',to_date('2016-06-09','yyyy-mm-dd'),9,22000,19800);
insert into trade
values (4,'401','104',to_date('2016-04-20','yyyy-mm-dd'),15,10000,15000);
insert into trade
values (11,'401','105',to_date('2016-06-15','yyyy-mm-dd'),20,10000,20000);
insert into trade
values (7,'402','102',to_date('2016-05-08','yyyy-mm-dd'),5,120000,60000);

create table customer(
c_code varchar2(4) not null,
c_name varchar2(30),
c_ceo varchar2(12),
c_addr varchar2(100),
c_phone varchar2(13),
constraint custromer_pk primary key(c_code)
);

select * from customer;
insert into customer values('101','늘푸른회사','김수종','경기도 안산시','010-1234-5678');
insert into customer values('102','사랑과바다','박나리','경기도 평택시','010-1122-3344');
insert into customer values('103','대한회사','이민수','서울시 구로구','010-3785-8809');
insert into customer values('104','하얀기판','허진수','경상북도 포항시','010-8569-3468');
insert into customer values('105','한마음한뜻','하민우','인천시 남동구','010-9455-6033');


create table stock(
p_code char(3) not null,
s_qty number not null,
s_lastdate date,
constraint stock_pk1 primary key(p_code,s_qty)
);

insert into stock values('101',50,to_date('2016-04-1','yyyy-mm-dd'));
insert into stock values('102',20,to_date('2016-04-26','yyyy-mm-dd'));
insert into stock values('103',5,to_date('2016-05-20','yyyy-mm-dd'));
insert into stock values('201',2,to_date('2016-04-13','yyyy-mm-dd'));
insert into stock values('202',15,to_date('2016-06-02','yyyy-mm-dd'));
insert into stock values('301',0,to_date('2016-05-02','yyyy-mm-dd'));
insert into stock values('302',20,to_date('2016-06-09','yyyy-mm-dd'));
insert into stock values('401',10,to_date('2016-06-15','yyyy-mm-dd'));
insert into stock values('402',7,to_date('2016-05-08','yyyy-mm-dd'));

--1.	상품 정보(product)테이블에 열 이름이 ‘비고’ 라는 열을 varchar2(20)으로 삽입해라.
ALTER TABLE product
ADD (VIGO VARCHAR2(20));
--2.	1번에서 삽입한 열이 상품 정보(product)테이블에 삽입되었는지 확인해라.
SELECT * FROM PRODUCT;
--3.	상품 정보(product)테이블에 ‘비고’ 열의 구조를 char(3)으로 변경해라.
ALTER TABLE PRODUCT
MODIFY(VIGO VARCHAR(3));
--4.	상품코드 401에 대한 거래내역 뷰(v_trade)를 만들어라.
CREATE OR REPLACE VIEW V_TRADE
AS (SELECT * FROM PRODUCT
WHERE P_CODE = 401);

SELECT * FROM V_TRADE;
--5.	상품 정보(product)테이블에 가장 최근에 들어온 거래처 코드 정보를 검색해라(top-n질의)
SELECT * 
FROM (SELECT * FROM PRODUCT ORDER BY ROWID DESC)
WHERE ROWNUM = 1;

SELECT *
FROM PRODUCT, TRADE
WHERE PRODUCT.P_CODE = TRADE.P_CODE
ORDER BY T_DATE DESC;

SELECT * FROM PRODUCT
ORDER BY ROWID DESC;

SELECT * FROM TRADE;
--6.	상품을 삽입하는 프로시저를 생성해라. 
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P_PRO(
V_P_CODE IN PRODUCT.P_CODE%TYPE,
V_P_NAME IN PRODUCT.P_NAME%TYPE,
V_P_COST IN PRODUCT.P_COST%TYPE,
V_P_GROUP IN PRODUCT.P_GROUP%TYPE
)
IS
V_COUNT NUMBER;
BEGIN
    INSERT INTO PRODUCT(P_CODE, P_NAME, P_COST, P_GROUP)
    VALUES(V_P_CODE, V_P_NAME, V_P_COST, V_P_GROUP);
    DBMS_OUTPUT.PUT_LINE('완료되었다.');

    EXCEPTION 
    WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('이미 P_CODE가 들어있다.');
    
END P_PRO;
/


execute p_pro('101', '7.1채널 스피커', 180000, '스피커');
--        이미 p_code가 들어있다.

execute p_pro('403', '7.1채널 스피커', 180000, '스피커');
--    완료되었다.

SELECT * FROM PRODUCT;

--7.	product_del 테이블을 만들어라.
create table product_del
(u_id varchar2(10),
wdate date,
p_code number(6),
p_name varchar2(30),
p_cost number,
p_group varchar2(30));


--8.	7번을 한 후, 상품 삭제 시(product테이블에서) product_del 테이블에 삽입이 이루어지는트리거를 작성해라.
--p_code , p_name , p_cost , p_group은 기존 product테이블에 있는 값으로 삽입해라.
CREATE OR REPLACE TRIGGER ONDEL
AFTER
DELETE ON PRODUCT
FOR EACH ROW

BEGIN
    INSERT INTO PRODUCT_DEL(WDATE, P_CODE, P_NAME, P_COST, P_GROUP)
    VALUES(SYSDATE, :OLD.P_CODE, :OLD.P_NAME, :OLD.P_COST, :OLD.P_GROUP);
END ONDEL;
/


SELECT * FROM PRODUCT;
SELECT * FROM PRODUCT_DEL;
delete from product where p_code='201';

--9.	Emp, dept, salgrade테이블로 작업해라.
--(없으면 카페에 “부서, 사원, 급여 테이블” 복붙해서 생성하기)
--9-1 부서번호를 입력하면 부서에 근무하는 모든 사원들의 사원번호, 사원이름, 사원직무가 화면에 출력되며, 
--사원직무를 입력하면 사원번호, 사원이름, 부서이름이 화면에 출력되는 프로시저를 같은 이름으로 작성하여 한 패키지로 구성해라.

CREATE OR REPLACE PACKAGE SEARCH1
IS
PROCEDURE SEARCHBY(S_DEPTNO IN EMP.DEPTNO%TYPE);
PROCEDURE SEARCHBY(S_JOB IN EMP.JOB%TYPE);
--PROCEDURE SEARCHB(S_PARAM IN VARCHAR2);
END SEARCH1;
/

CREATE OR REPLACE PACKAGE BODY SEARCH1
IS    
    PROCEDURE SEARCHBY(S_DEPTNO IN EMP.DEPTNO%TYPE)
    IS
        S_EMPNO EMP.EMPNO%TYPE;
        S_ENAME EMP.ENAME%TYPE;
        S_JOB EMP.JOB%TYPE;
        
        CURSOR SDEPT_CUR IS
            SELECT EMPNO, ENAME, JOB
            FROM EMP
            WHERE EMP.DEPTNO = S_DEPTNO;
    
    BEGIN
        OPEN SDEPT_CUR;
        LOOP
            FETCH SDEPT_CUR INTO S_EMPNO, S_ENAME, S_JOB;
            EXIT WHEN SDEPT_CUR%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(S_EMPNO || ' ' || S_ENAME || ' ' || S_JOB);
        END LOOP;
        CLOSE SDEPT_CUR;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('부서번호가 잘못 입력되었습니다.');
        
    END SEARCHBY;
    
    PROCEDURE SEARCHBY(S_JOB IN EMP.JOB%TYPE)
    IS
        S_EMPNO EMP.EMPNO%TYPE;
        S_ENAME EMP.ENAME%TYPE;
        S_DNAME DEPT.DNAME%TYPE;
        
        CURSOR SJOB_CUR IS
            SELECT EMPNO, ENAME, DNAME
            FROM EMP, DEPT
            WHERE S_JOB = EMP.JOB AND EMP.DEPTNO = DEPT.DEPTNO;
        
    BEGIN
        OPEN SJOB_CUR;
        LOOP
            FETCH SJOB_CUR INTO S_EMPNO, S_ENAME, S_DNAME;
            EXIT WHEN SJOB_CUR%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(S_EMPNO || ' ' || S_ENAME || ' ' || S_DNAME);
        END LOOP;
        CLOSE SJOB_CUR;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('직무가 잘못 입력되었습니다.');
    END SEARCHBY;
    
    --PROCEDURE SEARCHB(S_PARAM IN VARCHAR2)
--IS
--    S_EMPNO EMP.EMPNO%TYPE;
--    S_ENAME EMP.ENAME%TYPE;
--    S_DNAME DEPT.DNAME%TYPE;
--    S_JOB EMP.JOB%TYPE;
--    
--    CURSOR SDEPT_CUR IS
--        SELECT EMPNO, ENAME, JOB
--        FROM EMP
--        WHERE (S_PARAM IS NOT NULL AND EMP.DEPTNO = TO_NUMBER(S_PARAM));
--           
--    CURSOR SJOB_CUR IS
--        SELECT EMPNO, ENAME, DNAME
--        FROM EMP, DEPT
--        WHERE S_PARAM = EMP.JOB AND EMP.DEPTNO = DEPT.DEPTNO;
--            
--BEGIN
--    IF S_PARAM IS NOT NULL AND REGEXP_LIKE(S_PARAM, '^[[:digit:]]+$') THEN
--        OPEN SDEPT_CUR;
--        LOOP
--            FETCH SDEPT_CUR INTO S_EMPNO, S_ENAME, S_JOB;
--            EXIT WHEN SDEPT_CUR%NOTFOUND;
--            DBMS_OUTPUT.PUT_LINE(S_EMPNO || ' ' || S_ENAME || ' ' || S_JOB);
--        END LOOP;
--        CLOSE SDEPT_CUR;
--    ELSE
--        OPEN SJOB_CUR;
--        LOOP
--            FETCH SJOB_CUR INTO S_EMPNO, S_ENAME, S_DNAME;
--            EXIT WHEN SJOB_CUR%NOTFOUND;
--            DBMS_OUTPUT.PUT_LINE(S_EMPNO || ' ' || S_ENAME || ' ' || S_DNAME);
--        END LOOP;
--        CLOSE SJOB_CUR;
--        
--    END IF;
--END SEARCHB;

  
END SEARCH1;
/
EXECUTE SEARCH1.SEARCHBY(10);
EXECUTE SEARCH1.SEARCHBY('MANAGER');
EXECUTE SEARCH1.SEARCHB(10);
EXECUTE SEARCH1.SEARCHB('MANAGER');


---예외 처리
--1. 입력된 부서번호가 테이블에 없을 경우 “부서번호가 잘못 입력되었다”
--2. 입력된 사원직무가 테이블에 없을경우 “사원직무가 잘못 입력되었다”를 출력

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

CREATE OR REPLACE PACKAGE emppack IS
PROCEDURE viewemp(v_deptno IN emp.deptno%TYPE);
PROCEDURE viewemp(v_job IN emp.job%TYPE);
END emppack;
/

CREATE OR REPLACE PACKAGE emppack IS
PROCEDURE viewemp(v_deptno IN emp.deptno%TYPE);
PROCEDURE viewemp(v_job IN emp.job%TYPE);
END emppack;
/

CREATE OR REPLACE PACKAGE BODY emppack AS
PROCEDURE viewemp(v_deptno IN emp.deptno%TYPE) IS
v_empno emp.empno%TYPE;
v_ename emp.ename%TYPE;
v_job emp.job%TYPE;
CURSOR c1 IS
    SELECT empno, ename, job
    FROM emp
    WHERE deptno = v_deptno;
BEGIN
SELECT empno INTO v_empno FROM emp WHERE deptno = v_deptno AND ROWNUM <= 1;
OPEN c1;
LOOP
    FETCH c1 INTO v_empno, v_ename, v_job;
    EXIT WHEN c1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_empno || ' ' || v_ename || ' ' || v_job);
END LOOP;
CLOSE c1;

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('부서번호가 잘못 입력되었다');
END;

PROCEDURE viewemp(v_job IN emp.job%TYPE) IS
v_empno emp.empno%TYPE;
v_ename emp.ename%TYPE;
v_deptno emp.deptno%TYPE;
v_dname dept.dname%TYPE;
CURSOR c1 IS
SELECT empno, ename, deptno
FROM emp
WHERE job = v_job;
BEGIN
SELECT empno INTO v_empno FROM emp WHERE job = v_job AND ROWNUM <= 1;
OPEN c1;
LOOP
FETCH c1 INTO v_empno, v_ename, v_deptno;
EXIT WHEN c1%NOTFOUND;
SELECT dname INTO v_dname FROM dept WHERE deptno = v_deptno;
DBMS_OUTPUT.PUT_LINE(v_empno || ' ' || v_ename || ' ' || v_dname);
END LOOP;
CLOSE c1;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('사원직무가 잘못 입력되었다');
END;
END emppack;
/

EXECUTE emppack.viewemp(10);
EXECUTE emppack.viewemp('MANAGER');


