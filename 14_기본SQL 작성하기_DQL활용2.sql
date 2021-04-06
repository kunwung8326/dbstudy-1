/*
    보기 좋은 쿼리문
    
    1. SELECT절 바로 직전이나 SELECT절 오른쪽에 테이블 주석을 작성한다.
    2. SELECT절, FROM절, WHERE절, GROUP BY절, ORDER BY절 모두 라인을 맞춘다.
    3. 칼럼은 라인당 한 칼럼이거나(주석을 함께 작성), 한 라인에 모은다.
    4. 칼럼이나 테이블을 대문자로 작성한다. 소문자로 작성한다면 항상 소문자로 작성한다.
*/


/* 무슨무슨 테이블 */
SELECT A, B, C
  FROM TABLE;

SELECT /* 무슨무슨 테이블 */
        A  -- xx
      , B  -- xx
      , C  -- xx
  FROM table
 WHERE A = 'xx'
 GROUP BY A
HAVING COUNT(*) > 2
 ORDER BY C;


-- 26. 연봉(salary) 총액과 연봉(salary) 평균을 조회한다.
SELECT 
       SUM(salary) AS 연봉총액
     , ROUND(AVG(salary), 2) AS 연봉평균
  FROM employees;


-- 27. 최대연봉(salary)과 최소연봉의 차이를 조회한다.
SELECT
        MAX(salary) AS 최대연봉
      , MIN(salary) AS 최소연봉
  FROM employees;


-- 28. 직업(job_id) 이 ST_CLERK 인 사원들의 전체 수를 조회한다.
SELECT
       COUNT(*) AS 사원수
  FROM employees
 WHERE job_id = 'ST_CLERK';


-- 29. 매니저(manager_id)로 근무하는 사원들의 전체 수를 조회한다.
-- 누군가의 상사인 사원들의 수(manager_id에서 중복을 제거한 개수)
-- GROUP BY절
SELECT
       manager_id
  FROM employees
 WHERE manager_id IS NOT NULL
 GROUP BY manager_id;

-- COUNT()
SELECT
       COUNT(DISTINCT manager_id)
  FROM employees;


-- 30. 회사 내에 총 몇 개의 부서가 있는지 조회한다.
-- department_id에서 중복을 제거한 개수
SELECT
       COUNT(DISTINCT department_id)
  FROM employees;
  


-- 그룹화 연습

-- << departments 테이블 >>

-- 31. 같은 지역(location_id) 끼리 모아서 조회한다.


-- 32. 같은 지역(location_id) 끼리 모아서 각 지역(location_id) 마다 총 몇 개의 부서가 있는지 개수를 함께 조회한다.


-- 33. 같은 지역(location_id) 끼리 모아서 해당 지역(location_id) 에 어떤 부서(department_name) 가 있는지 조회한다.



-- << employees 테이블 >>

-- 34. 각 부서(department_id)별로 그룹화하여 department_id 와 부서별 사원의 수를 출력한다.


-- 35. 부서(department_id)별로 집계하여 department_id 와 급여평균을 department_id 순으로 오름차순 정렬해서 출력한다.


-- 36. 동일한 직업(job_id)을 가진 사원들의 job_id 와 인원수와 급여평균을 급여평균의 오름차순 정렬하여 출력한다.


-- 37. 직업(job_id)이 SH_CLERK 인 직원들의 인원수와 최대급여 및 최소급여를 출력한다.


-- 38. 근무 중인 사원수가 5명 이상인 부서의 department_id 와 해당 부서의 사원수를 department_id 의 오름차순으로 정렬하여 출력한다.


-- 39. 평균급여가 10000 이상인 부서의 department_id 와 급여평균을 출력한다.


-- 40. 부서(department_id)마다 같은 직업(job_id)을 가진 사원수를 department_id 순으로 정렬하여 출력한다.
-- 단, department_id 가 없는 사원은 출력하지 않는다.
