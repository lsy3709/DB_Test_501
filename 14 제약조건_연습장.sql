-- 실습 14-1 

CREATE TABLE TABLE_NOTNULL( 

   LOGIN_ID VARCHAR2(20) NOT NULL, 

   LOGIN_PWD VARCHAR2(20) NOT NULL, 

   TEL VARCHAR2(20) 

); 

 

DESC TABLE_NOTNULL; 

 

-- 실습 14-2 

INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD, TEL) 

VALUES ('TEST_ID_01', NULL, '010-1234-5678'); 

 

-- 실습 14-3 

INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD) 

VALUES ('TEST_ID_01', '1234'); 

 

SELECT * FROM TABLE_NOTNULL; 

 

-- 실습 14-4 

UPDATE TABLE_NOTNULL 

   SET LOGIN_PWD = NULL 

 WHERE LOGIN_ID = 'TEST_ID_01'; 

 

-- 실습 14-5 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS; 

 

-- 실습 14-6 

CREATE TABLE TABLE_NOTNULL2( 

   LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL, 

   LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL, 

   TEL VARCHAR2(20) 

); 

 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS; 

 

-- 실습 14-7 

ALTER TABLE TABLE_NOTNULL 

MODIFY(TEL NOT NULL); 

 

-- 실습 14-8 

UPDATE TABLE_NOTNULL 

   SET TEL = '010-1234-5678' 

 WHERE LOGIN_ID = 'TEST_ID_01'; 

 

SELECT * FROM TABLE_NOTNULL; 

 

-- 실습 14-9 

ALTER TABLE TABLE_NOTNULL 

MODIFY(TEL NOT NULL); 

 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS; 

 

-- 실습 14-10 

ALTER TABLE TABLE_NOTNULL2 

MODIFY(TEL CONSTRAINT TBLNN_TEL_NN NOT NULL); 

 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS; 

 

-- 실습 14-11 

DESC TABLE_NOTNULL2; 

 

-- 실습 14-12 

ALTER TABLE TABLE_NOTNULL2 

RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN; 

 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS; 

 

-- 실습 14-13 

ALTER TABLE TABLE_NOTNULL2 

 DROP CONSTRAINT TBLNN2_TEL_NN; 

 

DESC TABLE_NOTNULL2; 

 

-- 실습 14-14 

CREATE TABLE TABLE_UNIQUE( 

   LOGIN_ID VARCHAR2(20) UNIQUE, 

   LOGIN_PWD VARCHAR2(20) NOT NULL, 

   TEL VARCHAR2(20) 

); 

 

DESC TABLE_UNIQUE; 

 

-- 실습 14-15 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS 

 WHERE TABLE_NAME = 'TABLE_UNIQUE'; 

 

-- 실습 14-16 

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL) 

VALUES('TEST_ID_01', 'PWD01', '010-1234-5678'); 

 

SELECT * FROM TABLE_UNIQUE; 

 

-- 실습 14-17 

INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL) 

VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678'); 

 

-- 실습 14-18 

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL) 

VALUES('TEST_ID_02', 'PWD01', '010-1234-5678'); 

 

SELECT * FROM TABLE_UNIQUE; 

 

-- 실습 14-19 

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL) 

VALUES(NULL, 'PWD01', '010-2345-6789'); 

 

SELECT * FROM TABLE_UNIQUE; 

 

-- 실습 14-20 

UPDATE TABLE_UNIQUE 

   SET LOGIN_ID='TEST_ID_01' 

 WHERE LOGIN_ID IS NULL; 

 

-- 실습 14-21 

CREATE TABLE TABLE_UNIQUE2( 

   LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE, 

   LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPW_NN NOT NULL, 

   TEL VARCHAR2(20) 

); 

 

-- 실습 14-22 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS 

 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%'; 

 

-- 실습 14-23 

ALTER TABLE TABLE_UNIQUE 

MODIFY(TEL UNIQUE); 

 

-- 실습 14-24 

UPDATE TABLE_UNIQUE 

   SET TEL = NULL; 

 

SELECT * FROM TABLE_UNIQUE; 

 

-- 실습 14-25 

ALTER TABLE TABLE_UNIQUE 

MODIFY(TEL UNIQUE); 

 

-- 실습 14-26 

ALTER TABLE TABLE_UNIQUE2 

MODIFY(TEL CONSTRAINT TBLUNQ_TEL_UNQ UNIQUE); 

 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS 

 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%'; 

 

-- 실습 14-27 

ALTER TABLE TABLE_UNIQUE2 

RENAME CONSTRAINT TBLUNQ_TEL_UNQ TO TBLUNQ2_TEL_UNQ; 

 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS 

 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%'; 

 

-- 실습 14-28 

ALTER TABLE TABLE_UNIQUE2 

 DROP CONSTRAINT TBLUNQ2_TEL_UNQ; 

 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS 

 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%'; 

 

-- 실습 14-29 

CREATE TABLE TABLE_PK( 

   LOGIN_ID VARCHAR2(20) PRIMARY KEY, 

   LOGIN_PWD VARCHAR2(20) NOT NULL, 

   TEL VARCHAR2(20) 

); 

 

DESC TABLE_PK; 

 

-- 실습 14-30 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS 

 WHERE TABLE_NAME LIKE 'TABLE_PK%'; 

 

-- 실습 14-31 

SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME 

  FROM USER_INDEXES 

 WHERE TABLE_NAME LIKE 'TABLE_PK%'; 

 

-- 실습 14-32 

CREATE TABLE TABLE_PK2( 

   LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LGNID_PK PRIMARY KEY, 

   LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLPK2_LGNPW_NN NOT NULL, 

   TEL VARCHAR2(20) 

); 

 

DESC TABLE_PK2; 

 

-- 실습 14-33 

INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL) 

VALUES('TEST_ID_01', 'PWD01', '010-1234-5678'); 

 

SELECT * FROM TABLE_PK; 

 

-- 실습 14-34 

INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL) 

VALUES('TEST_ID_01', 'PWD02', '010-2345-6789'); 

 

-- 실습 14-35 

INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL) 

VALUES(NULL, 'PWD02', '010-2345-6789'); 

 

-- 실습 14-36 

INSERT INTO TABLE_PK(LOGIN_PWD, TEL) 

VALUES('PWD02', '010-2345-6789'); 

 

-- 실습 14-37 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME 

  FROM USER_CONSTRAINTS 

 WHERE TABLE_NAME IN ('EMP', 'DEPT'); 

 

-- 실습 14-38 

INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 

VALUES(9999, '홍길동', 'CLERK', '7788', TO_DATE('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 50); 

 

-- 실습 14-39 

CREATE TABLE DEPT_FK( 

   DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY, 

   DNAME VARCHAR2(14), 

   LOC VARCHAR2(13) 

); 

 

DESC DEPT_FK; 

 

-- 실습 14-40 

CREATE TABLE EMP_FK( 

   EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY, 

   ENAME VARCHAR2(10), 

   JOB VARCHAR2(9), 

   MGR NUMBER(4), 

   HIREDATE DATE, 

   SAL NUMBER(7,2), 

   COMM NUMBER(7,2), 

   DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO) 

); 

 

DESC EMP_FK; 

 

-- 실습 14-41 

INSERT INTO EMP_FK 

VALUES(9999, 'TEST_NMAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 

       3000, NULL, 10); 

 

-- 실습 14-42 

INSERT INTO DEPT_FK 

VALUES(10, 'TEST_DNAME', 'TEST_LOC'); 

 

SELECT * FROM DEPT_FK; 

 

-- 실습 14-43 

INSERT INTO EMP_FK 

VALUES(9999, 'TEST_NMAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 

       3000, NULL, 10); 

 

SELECT * FROM EMP_FK; 

 

-- 실습 14-44 

DELETE FROM DEPT_FK 

 WHERE DEPTNO = 10; 

 

-- 실습 14-45 

CREATE TABLE TABLE_CHECK( 

   LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_PK PRIMARY KEY, 

   LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGINPW_CK CHECK (LENGTH(LOGIN_PWD) > 3), 

   TEL VARCHAR2(20) 

); 

 

DESC TABLE_CHECK; 

 

-- 실습 14-46 

INSERT INTO TABLE_CHECK 

VALUES ('TEST_ID', '123', '010-1234-5678'); 

 

-- 실습 14-47 

INSERT INTO TABLE_CHECK 

VALUES ('TEST_ID', '1234', '010-1234-5678'); 

 

SELECT * FROM TABLE_CHECK; 

 

-- 실습 14-48 

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 

  FROM USER_CONSTRAINTS 

 WHERE TABLE_NAME LIKE 'TABLE_CHECK'; 

 

-- 실습 14-49 

CREATE TABLE TABLE_DEFAULT( 

   LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK2_LOGINID_PK PRIMARY KEY, 

   LOGIN_PWD VARCHAR2(20) DEFAULT '1234', 

   TEL VARCHAR2(20) 

); 

 

DESC TABLE_DEFAULT; 

 

-- 실습 14-50 

INSERT INTO TABLE_DEFAULT VALUES ('TEST_ID', NULL, '010-1234-5678'); 

 

INSERT INTO TABLE_DEFAULT (LOGIN_ID, TEL) VALUES ('TEST_ID2', '010-1234-5678'); 

 

SELECT * FROM TABLE_DEFAULT; 