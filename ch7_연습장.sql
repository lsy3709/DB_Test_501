-- 실습 7-1
select sum(sal) from emp;


-- 실습 7-2
-- 단일행, 다중행 함수를 동시에 사용시 오류 
select ename,sum(sal) from emp;

-- 실습 7-3
select sum(comm) from emp;

-- 실습 7-4
-- distinct , all 
select sal from emp;
select sum(distinct sal), sum(all sal), sum(sal) from emp;


-- 실습 7-5
select count(*) from emp;

-- 실습 7-6 

SELECT COUNT(*) 
  FROM EMP 
 WHERE DEPTNO = 30; 

 

-- 실습 7-7 

SELECT COUNT(DISTINCT SAL), 
       COUNT(ALL SAL), 
       COUNT(SAL) 
  FROM EMP; 

 

-- 실습 7-8 

SELECT COUNT(COMM) 
  FROM EMP; 

 -- 실습 7-9 
SELECT COUNT(COMM) 
  FROM EMP 
 WHERE COMM IS NOT NULL; 
 
 -- 실습 7-10 
SELECT MAX(SAL) 
  FROM EMP 
 WHERE DEPTNO = 10; 

 

-- 실습 7-11 

SELECT MIN(SAL) 
  FROM EMP 
 WHERE DEPTNO = 10; 

 

-- 실습 7-12 
SELECT MAX(HIREDATE) 
  FROM EMP 
 WHERE DEPTNO = 20; 
 

-- 실습 7-13 
SELECT MIN(HIREDATE) 
  FROM EMP 
 WHERE DEPTNO = 20; 

 

-- 실습 7-14 
SELECT AVG(SAL) 
  FROM EMP 
 WHERE DEPTNO = 30; 

 

-- 실습 7-15 
SELECT AVG(DISTINCT SAL) 
  FROM EMP 
 WHERE DEPTNO = 30; 

 

-- 실습 7-16 
SELECT AVG(SAL), '10' AS DEPTNO FROM EMP 
WHERE DEPTNO = 10 
UNION ALL 
SELECT AVG(SAL), '20' AS DEPTNO FROM EMP 
WHERE DEPTNO = 20 
UNION ALL 
SELECT AVG(SAL), '30' AS DEPTNO FROM EMP 
WHERE DEPTNO = 30; 

 --실습 7-17 
SELECT AVG(SAL), DEPTNO 
  FROM EMP 
GROUP BY DEPTNO; 

 

-- 실습 7-18 
SELECT DEPTNO, JOB, AVG(SAL) 
  FROM EMP 
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO, JOB; 

 

-- 실습 7-19 
SELECT ENAME, DEPTNO, AVG(SAL) 
  FROM EMP 
GROUP BY DEPTNO; 

-- 실습 7-20 

SELECT DEPTNO, JOB, AVG(SAL) 

  FROM EMP 

GROUP BY DEPTNO, JOB 

HAVING AVG(SAL) >= 2000 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-21 

SELECT DEPTNO, JOB, AVG(SAL) 

  FROM EMP 

 WHERE AVG(SAL) >= 2000 

GROUP BY DEPTNO, JOB 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-22 

SELECT DEPTNO, JOB, AVG(SAL) 

  FROM EMP 

GROUP BY DEPTNO, JOB 

HAVING AVG(SAL) >= 2000 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-23 

SELECT DEPTNO, JOB, AVG(SAL) 

  FROM EMP 

 WHERE SAL <= 3000 

GROUP BY DEPTNO, JOB 

HAVING AVG(SAL) >= 2000 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-24 

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) 

  FROM EMP 

GROUP BY DEPTNO, JOB 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-25 

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) 

  FROM EMP 

GROUP BY ROLLUP(DEPTNO, JOB); 

 

-- 실습 7-26 

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) 

  FROM EMP 

GROUP BY CUBE(DEPTNO, JOB) 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-27 

SELECT DEPTNO, JOB, COUNT(*) 

  FROM EMP 

GROUP BY DEPTNO, ROLLUP(JOB); 

 

-- 실습 7-28 

SELECT DEPTNO, JOB, COUNT(*) 

  FROM EMP 

GROUP BY JOB, ROLLUP(DEPTNO); 

 

-- 실습 7-29 

SELECT DEPTNO, JOB, COUNT(*) 

  FROM EMP 

GROUP BY GROUPING SETS(DEPTNO, JOB) 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-30 

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL), 

       GROUPING(DEPTNO), 

       GROUPING(JOB) 

  FROM EMP 

GROUP BY CUBE(DEPTNO, JOB) 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-31 

SELECT DECODE(GROUPING(DEPTNO), 1, 'ALL_DEPT', DEPTNO) AS DEPTNO, 

       DECODE(GROUPING(JOB), 1, 'ALL_JOB', JOB) AS JOB, 

       COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL) 

  FROM EMP 

GROUP BY CUBE(DEPTNO, JOB) 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-32 

SELECT DEPTNO, JOB, COUNT(*), SUM(SAL), 

       GROUPING(DEPTNO), 

       GROUPING(JOB), 

       GROUPING_ID(DEPTNO, JOB) 

  FROM EMP 

GROUP BY CUBE(DEPTNO, JOB) 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-33 

SELECT DEPTNO, ENAME 

FROM EMP 

GROUP BY DEPTNO, ENAME; 

 

-- 실습 7-34 

SELECT DEPTNO, 

       LISTAGG(ENAME, ', ') 

       WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES 

  FROM EMP 

GROUP BY DEPTNO; 

 

-- 실습 7-35 

SELECT DEPTNO, JOB, MAX(SAL) 

  FROM EMP 

GROUP BY DEPTNO, JOB 

ORDER BY DEPTNO, JOB; 

 

-- 실습 7-36 

SELECT * 

  FROM(SELECT DEPTNO, JOB, SAL 

         FROM EMP) 

PIVOT(MAX(SAL) 

      FOR DEPTNO IN (10, 20, 30) 

      ) 

ORDER BY JOB; 

 

-- 실습 7-37 

SELECT * 

  FROM(SELECT JOB, DEPTNO, SAL 

         FROM EMP) 

PIVOT(MAX(SAL) 

     FOR JOB IN ('CLERK' AS CLERK, 

                 'SALESMAN' AS SALESMAN, 

                 'PRESIDENT' AS PRESIDENT, 

                 'MANAGER' AS MANAGER, 

                 'ANALYST' AS ANALYST) 

     ) 

ORDER BY DEPTNO; 

 

-- 실습 7-38 

SELECT DEPTNO, 

       MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK", 

       MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN", 

       MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT", 

       MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER", 

       MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST" 

  FROM EMP 

GROUP BY DEPTNO 

ORDER BY DEPTNO; 

 

-- 실습 7-39 

SELECT * 

  FROM(SELECT DEPTNO, 

              MAX(DECODE(JOB, 'CLERK' , SAL)) AS "CLERK", 

              MAX(DECODE(JOB, 'SALESMAN' , SAL)) AS "SALESMAN", 

              MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT", 

              MAX(DECODE(JOB, 'MANAGER' , SAL)) AS "MANAGER", 

              MAX(DECODE(JOB, 'ANALYST' , SAL)) AS "ANALYST" 

         FROM EMP 

       GROUP BY DEPTNO 

       ORDER BY DEPTNO) 

UNPIVOT( 

   SAL FOR JOB IN (CLERK, SALESMAN, PRESIDENT, MANAGER,ANALYST)) 

ORDER BY DEPTNO, JOB; 

 
