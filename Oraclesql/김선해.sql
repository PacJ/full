CREATE TABLE BOOK (
    BOOKID NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
    BOOKNAME VARCHAR2(200),
    PUBLISHER VARCHAR(200),
    PRICE NUMBER);

SELECT * FROM BOOK;

CREATE TABLE ORDERS (
    ORDERID NUMBER CONSTRAINT ORDER_PK PRIMARY KEY,
    CUSTID NUMBER,
    BOOKID NUMBER,
    SALEPRICE NUMBER,
    ORDERDATE DATE
);

SELECT * FROM ORDERS;

CREATE TABLE CUSTOMER (
    CUSTID NUMBER CONSTRAINT CUSTOMER_PK PRIMARY KEY,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(200),
    PHONE VARCHAR(13)
);

SELECT * FROM CUSTOMER;

--시퀀스(SEQUENCE) : 
CREATE SEQUENCE SEQ_BOOK --시퀀스 생성
INCREMENT BY 1 --증감값
START WITH 1 --시작값
NOCYCLE --최대값 도달 후 시퀀스 생성 중단
NOCACHE; --캐시에 저장하지 않음.

CREATE SEQUENCE SEQ_ORDERS
INCREMENT BY 1 
START WITH 1 
NOCYCLE 
NOCACHE; 

CREATE SEQUENCE  SEQ_CUSTOMER
INCREMENT BY 1 
START WITH 1 
NOCYCLE 
NOCACHE;

INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, '컴퓨터의 역사', '아이티', 7000);
INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, '컴퓨터는 무엇일까', '굿북', 13000);
INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, '컴퓨터의 이해', '이젠', 22000);
INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, '자바 이론', '이젠', 35000);
INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, '데이터베이스 교본', '아이티', 8000);
INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, 'HTML 기술', '아이티', 6000);
INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, '스프링의 개념', '에비씨미디어', 20000);
INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, '스프링을 부탁해', '에비씨빛미디어', 13000);
INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, '파이썬 이야기', '코딩빔', 7500);
INSERT INTO BOOK VALUES(SEQ_BOOK.NEXTVAL, 'python story', 'Pearson', 13000);

SELECT * FROM BOOK;

INSERT INTO CUSTOMER VALUES (SEQ_CUSTOMER.NEXTVAL, '박건우', '인천시 송도', '010-1111-2222');
INSERT INTO CUSTOMER VALUES (SEQ_CUSTOMER.NEXTVAL, '김선해', '서울시 종로구', '010-2111-2222');
INSERT INTO CUSTOMER VALUES (SEQ_CUSTOMER.NEXTVAL, '장지혜', '서울시 용산구', '010-3111-2222');
INSERT INTO CUSTOMER VALUES (SEQ_CUSTOMER.NEXTVAL, '추오섭', '경기도 의정부', '010-4111-2222');
INSERT INTO CUSTOMER VALUES (SEQ_CUSTOMER.NEXTVAL, '박승철', '서울시 마포구', NULL);

SELECT * FROM CUSTOMER;

INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 1, 1, 6000, '2022-05-01');
INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 1, 3, 21000, '2022-05-03');
INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 2, 5, 8000, '2022-05-03');
INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 3, 6, 6000, '2022-05-04');
INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 4, 7, 20000, '2022-05-05');
INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 1, 2, 12000, '2022-05-07');
INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 4, 8, 13000, '2022-05-07');
INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 3, 10, 12000, '2022-05-08');
INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 2, 10, 7000, '2022-05-09');
INSERT INTO ORDERS VALUES (SEQ_ORDERS.NEXTVAL, 3, 8, 13000, '2022-05-10');

SELECT * FROM ORDERS;
commit;

--1.	김선해 고객의 전화번호를 찾아라.
SELECT PHONE
FROM CUSTOMER
WHERE NAME = '김선해';
select * from book;
select * from orders;
select * from customer;
--2.	모든 도서의 이름과 가격을 검색해라.
SELECT BOOKNAME, PRICE
FROM BOOK;
--3.	모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색해라.
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
FROM BOOK;
--4.	도서 테이블에 있는 모든 출판사를 검색해라. (중복제거해서)
SELECT DISTINCT PUBLISHER
FROM BOOK;
--5.	가격이 20000원 미만인 도서를 검색해라.
SELECT *
FROM BOOK
WHERE PRICE < 20000;
--6.	가격이 10000원 이상 20000 이하인 도서를 검색해라.
SELECT *
FROM BOOK
WHERE PRICE >= 10000 AND PRICE <= 20000;
--7.	출판사가 ‘아이티’ 혹은 ‘이젠’ 인 도서를 검색해라.
SELECT *
FROM BOOK
WHERE PUBLISHER IN ('아이티', '이젠');
--8.	출판사가 ‘아이티’ 혹은 ‘이젠’ 아닌 도서를 검색해라.
SELECT *
FROM BOOK
WHERE PUBLISHER NOT IN ('아이티', '이젠');
--9.	‘컴퓨터의 역사’를 출간한 출판사를 검색해라.
SELECT PUBLISHER
FROM BOOK
WHERE BOOKNAME='컴퓨터의 역사';
--10.	도서이름에 ‘컴퓨터’가 포함된 출판사를 검색해라.
SELECT PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE '%컴퓨터%';
--11.	도서이름의 왼쪽 두번 째에 ‘퓨’라는 문자열을 갖는 도서를 검색해라.
SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '_퓨%';
--12.	컴퓨터에 관한 도서 중 가격이 20000원 이상인 도서를 검색해라.
SELECT *
FROM BOOK
WHERE PRICE >= 20000;
--13.	도서를 이름순으로 검색해라.
SELECT *
FROM BOOK
ORDER BY BOOKNAME;
--14.	도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색해라.
SELECT *
FROM BOOK
ORDER BY PRICE DESC, BOOKNAME;
--15.	도서를 가격의 내림차순으로 검색해라. 가격이 같다면 출판사의 오름차순으로 검색해라.
SELECT *
FROM BOOK
ORDER BY PRICE DESC, PUBLISHER ASC;
--16.	고객이 주문한 도서의 총 판매액을 구해라.
SELECT CUSTID, SUM(SALEPRICE) AS TOTAL_SALE
FROM ORDERS
GROUP BY CUSTID;
--17.	2번 김선해 고객이 주문한 도서의 총 판매액을 구해라.
SELECT SUM(SALEPRICE) AS TOTAL_SALE
FROM ORDERS
WHERE CUSTID = 2;
--18.	고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구해라.
SELECT SUM(SALEPRICE) AS TOTAL, AVG(SALEPRICE) AS AVERAGE, MIN(SALEPRICE) AS MIN, MAX(SALEPRICE) AS MAX
FROM ORDERS
GROUP BY CUSTID;
--19.	1402서점의 도서 판매 건수를 구해라.
SELECT COUNT(*) AS BOOKS_SOLD
FROM ORDERS;
--20.	고객별로 주문한 도서의 총 수량과 총 판매액을 구해라.
SELECT CUSTID, COUNT(BOOKID) AS PURCHASED, SUM(SALEPRICE) AS TOTAL
FROM ORDERS
GROUP BY CUSTID;
--21.	가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구해라. 단, 두 권 이상 구매한 고객만 구해라.
SELECT CUSTID, COUNT(BOOKID) AS PURCHASED
FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID 
HAVING COUNT(BOOKID) > 1;
--22.	고객과 고객의 주문에 관한 데이터를 모두 보여라.
SELECT *
FROM CUSTOMER NATURAL JOIN ORDERS;
--23.	고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보여라.
SELECT *
FROM CUSTOMER NATURAL JOIN ORDERS
ORDER BY CUSTID;
--24.	고객의 이름과 고객이 주문한 도서의 판매가격을 검색해라.
SELECT NAME, SALEPRICE
FROM CUSTOMER NATURAL JOIN ORDERS;
--25.	고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬해라.
SELECT CUSTOMER.CUSTID, CUSTOMER.NAME, SUM(SALEPRICE) AS TOTAL
FROM CUSTOMER JOIN ORDERS ON CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.CUSTID, CUSTOMER.NAME;
--26.	고객의 이름과 고객이 주문한 도서의 이름을 구해라.
SELECT NAME, BOOKNAME
FROM CUSTOMER NATURAL JOIN ORDERS NATURAL JOIN BOOK;
--27.	가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 구해라.
SELECT NAME, BOOKNAME
FROM CUSTOMER NATURAL JOIN ORDERS NATURAL JOIN BOOK
WHERE SALEPRICE = 20000;
--28.	도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구해라.
SELECT CUST.NAME, ORD.SALEPRICE
FROM CUSTOMER CUST LEFT OUTER JOIN ORDERS ORD ON(CUST.CUSTID=ORD.CUSTID);
--29.	가장 비싼 도서의 이름을 구해라.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE = (SELECT MAX(PRICE) FROM BOOK);
--30.	도서를 구매한 적이 있는 고객의 이름을 검색해라.
SELECT NAME
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID;

--31.	이젠에서 출판한 도서를 구매한 고객의 이름을 보여라.
SELECT NAME
FROM CUSTOMER
JOIN ORDERS ON CUSTOMER.CUSTID = ORDERS.CUSTID
JOIN BOOK ON ORDERS.BOOKID = BOOK.BOOKID
WHERE BOOK.PUBLISHER = '이젠';

--32.	출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구해라.
SELECT BK.BOOKNAME
FROM BOOK BK,
(SELECT PUBLISHER, AVG(PRICE) AS AVG_PRICE
FROM BOOK
GROUP BY PUBLISHER) BK_AVG
WHERE BK.PUBLISHER = BK_AVG.PUBLISHER
AND BK.PRICE > BK_AVG.AVG_PRICE;

SELECT DISTINCT B.publisher, BB.bookname
FROM book B
CROSS JOIN book BB
WHERE BB.price > (
  SELECT AVG(price)
  FROM book
  WHERE publisher = B.publisher
)
ORDER BY B.publisher, BB.bookname;

SELECT AVG(PRICE) AS AVG_PRICE
FROM BOOK
GROUP BY PUBLISHER;

--33.	Book테이블에 새로운 도서 ‘공학 도서’를 삽입해라. 공학 도서는 더샘에서 출간했으며 가격을 40000원이다.
INSERT INTO BOOK
VALUES(SEQ_BOOK.NEXTVAL, '공학 도서', '더샘', 40000);
SELECT * FROM BOOK;

--34.	Book테이블에 새로운 도서 ‘공학 도서’를 삽입해라. 공학 도서는 더샘에서 출간했으며 가격은 미정이다.
INSERT INTO BOOK
VALUES(SEQ_BOOK.NEXTVAL, '공학 도서', '더샘', NULL);
SELECT * FROM BOOK;

--35.	Customer테이블에서 고객번호가 5인 고객의 주소를 ‘서울시 서초구’로 변경해라.
UPDATE CUSTOMER
SET ADDRESS = '서울시 서초구'
WHERE CUSTID = 5;

SELECT * FROM CUSTOMER;
--36.	Customer테이블에서 박승철 고객의 주소를 김선해 고객의 주소로 변경해라.
UPDATE CUSTOMER
SET ADDRESS = (SELECT ADDRESS FROM CUSTOMER WHERE NAME = '김선해')
WHERE NAME = '박승철';
SELECT * FROM CUSTOMER;

--37.	아이티에서 출판한 도서의 제목과 제목의 글자수를 확인해라.
SELECT BOOKNAME, LENGTH(BOOKNAME)
FROM BOOK
WHERE PUBLISHER = '아이티';

--38.	1402서점의 고객 중에서 같은 성(이름 성)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구해라.
SELECT SUNG, COUNT(*)
FROM(SELECT SUBSTR(NAME,1,1) AS SUNG FROM CUSTOMER)
GROUP BY SUNG;

SELECT SUBSTR(NAME, 1, 1) AS SURNAME_FIRST_CHAR, COUNT(*) AS TOTAL_COUNT
FROM CUSTOMER
GROUP BY SUBSTR(NAME, 1, 1);

--39.	1402서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구해라.
SELECT ORDERID, ORDERDATE + INTERVAL '10' DAY AS CONFIRM_DATE
FROM ORDERS;

--40.	1402서점이 2022년 5월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보여라. 주문일은 ‘yyyy-mm-dd요일’형태로 표시한다.
SELECT ORDERID, TO_CHAR(ORDERDATE, 'YYYY-MM-DD DAY') AS ORDERDATE, CUSTID, BOOKID
FROM ORDERS
WHERE ORDERDATE='2022-05-07';

SELECT ORDERID, ORDERDATE, CUSTID, BOOKID
FROM ORDERS
WHERE ORDERDATE = '2022-05-07';

--41.	이름, 전화번호가 포함된 고객목록을 보여라. 단, 전화번호가 없는 고객은 ‘연락처없음’으로 표시해라.
SELECT NAME, NVL(PHONE, '연락처없음') AS PHONE
FROM CUSTOMER;

--42.	평균 주문금액 이하의 주문에 대해 주문번호와 금액을 보여라.
SELECT ORDERID, SALEPRICE
FROM ORDERS
WHERE SALEPRICE <= (SELECT AVG(SALEPRICE) FROM ORDERS);

--43.	각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해 주문번호, 고객번호, 금액을 보여라.
SELECT ORDERID, CUSTID, SALEPRICE
FROM ORDERS
WHERE SALEPRICE > (SELECT AVG(SALEPRICE) FROM ORDERS);

--44.	서울시에 거주하는 고객에게 판매한 도서의 총판매액을 구해라.
SELECT SUM(SALEPRICE) AS TOTAL
FROM ORDERS NATURAL JOIN CUSTOMER
WHERE ADDRESS LIKE '%서울시%';

--45.	Customer테이블에서 고객번호가 5인 고객을 삭제해라.
DELETE FROM CUSTOMER
WHERE CUSTID = 5;
COMMIT;
SELECT * FROM CUSTOMER;
