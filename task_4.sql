-- Task_4

-- 1. Total salary of all employees
SELECT SUM(salary) AS total_salary
FROM empmst;


-- 2. Average salary of all employees
SELECT AVG(salary) AS average_salary
FROM empmst;


-- 3. Highest and lowest salary
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary
FROM empmst;


-- 4. Count total number of employees
SELECT COUNT(*) AS total_employees
FROM empmst;


-- 5. Total salary paid by each department
SELECT deptno, SUM(salary) AS total_salary
FROM empmst
GROUP BY deptno;


-- 6. Average salary per department
SELECT deptno, AVG(salary) AS avg_salary
FROM empmst
GROUP BY deptno;


-- 7. Number of employees in each city
SELECT city, COUNT(*) AS employee_count
FROM empmst
GROUP BY city;


-- 8. Departments where total salary exceeds ₹1,00,000
SELECT deptno, SUM(salary) AS total_salary
FROM empmst
GROUP BY deptno
HAVING SUM(salary) > 100000;


-- 9. Cities with more than 2 employees
SELECT city, COUNT(*) AS employee_count
FROM empmst
GROUP BY city
HAVING COUNT(*) > 2;


-- 10. Departments where average salary is above ₹50,000
SELECT deptno, AVG(salary) AS avg_salary
FROM empmst
GROUP BY deptno
HAVING AVG(salary) > 50000;


-- 11. Count of employees in each department
SELECT deptno, COUNT(empno) AS emp_count
FROM empmst
GROUP BY deptno;


-- 12. Departments where minimum salary > 40000
SELECT deptno, MIN(salary) AS min_salary
FROM empmst
GROUP BY deptno
HAVING MIN(salary) > 40000;


-- 13. Count of employees with NULL DOB
SELECT COUNT(*) AS null_dob_count
FROM empmst
WHERE dob IS NULL;


-- 14. Total salary per city where salary > 70000
SELECT city, SUM(salary) AS total_city_salary
FROM empmst
GROUP BY city
HAVING SUM(salary) > 70000;


-- 15. Departments with more than 1 employee and avg salary < 60000
SELECT deptno, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM empmst
GROUP BY deptno
HAVING COUNT(*) > 1 AND AVG(salary) < 60000;


-- 16. Total salary per department sorted highest to lowest
SELECT deptno, SUM(salary) AS total_salary
FROM empmst
GROUP BY deptno
ORDER BY total_salary DESC;


-- 17. Number of employees born between 1980 and 1990 per dept
SELECT deptno, COUNT(*) AS emp_count
FROM empmst
WHERE dob BETWEEN '1980-01-01' AND '1990-12-31'
GROUP BY deptno;


-- 18. Departments where max salary is less than 70000
SELECT deptno, MAX(salary) AS max_salary
FROM empmst
GROUP BY deptno
HAVING MAX(salary) < 70000;


-- 19. Group employees into salary ranges (above/below 50k)
SELECT 
    CASE 
        WHEN salary < 50000 THEN 'Below 50K'
        ELSE '50K and Above'
    END AS salary_range,
    COUNT(*) AS count_in_range
FROM empmst
GROUP BY 
    CASE 
        WHEN salary < 50000 THEN 'Below 50K'
        ELSE '50K and Above'
    END;


-- 20. Count of employees grouped by birth year
SELECT EXTRACT(YEAR FROM dob) AS birth_year, COUNT(*) AS count
FROM empmst
WHERE dob IS NOT NULL
GROUP BY EXTRACT(YEAR FROM dob)
ORDER BY birth_year;