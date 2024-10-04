/* ************************************************************************ 
**********************************QUESTION 01******************************
***************************************************************************

1. Write a query to find the addresses (location_id, street _ address, city,
state _ province, country_name) of all the departments
*/

SELECT locations.location_id, 
       locations.street_address, 
       locations.city, 
       locations.state_province, 
       countries.country_name
FROM departments
JOIN locations ON departments.location_id = locations.location_id
JOIN countries ON locations.country_id = countries.country_id;



/* ************************************************************************ 
**********************************QUESTION 02******************************
***************************************************************************

2. Write a query to find the name(first_name, last name), department ID and
name of all the employees
*/
SELECT employees.first_name, 
       employees.last_name, 
       departments.department_id, 
       departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id;



/* ************************************************************************ 
**********************************QUESTION 03******************************
***************************************************************************

3. Write a query to find the name (first_name, last_name), job,departmentID
and name of the employees who works in London
*/
SELECT employees.first_name, 
       employees.last_name, 
       jobs.job_title, 
       departments.department_id, 
       departments.department_name
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id
JOIN departments ON employees.department_id = departments.department_id
JOIN locations ON departments.location_id = locations.location_id
WHERE locations.city = 'London';



/* ************************************************************************ 
**********************************QUESTION 04******************************
***************************************************************************

4. Write a query to find the employee id, name (last_name) along with their
manager_id and name (last_name)
*/
SELECT e.employee_id, 
       e.last_name AS employee_last_name, 
       e.manager_id, 
       m.last_name AS manager_last_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;



/* ************************************************************************ 
**********************************QUESTION 05******************************
***************************************************************************

5. Write a query to find the name (first_name,last_name) and hire date   of 
the employees who was hired after 'Jones'
*/
SELECT first_name, 
       last_name, 
       hire_date
FROM employees
WHERE hire_date > (SELECT hire_date 
                   FROM employees 
                   WHERE last_name = 'Jones');




/* ************************************************************************ 
**********************************QUESTION 06******************************
***************************************************************************
6. Write a query to get the department name and number of employees  in the
department
*/
SELECT departments.department_name, 
       COUNT(employees.employee_id) AS num_employees
FROM departments
LEFT JOIN employees ON departments.department_id = employees.department_id
GROUP BY departments.department_name;



/* ************************************************************************ 
**********************************QUESTION 07******************************
***************************************************************************
7. Write a query to display department name, name (first _ name, last _ name),
hire date, salary of the manager for all managers whose experience is more
than 15 years
*/
SELECT departments.department_name, 
       employees.first_name, 
       employees.last_name, 
       employees.hire_date, 
       employees.salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE employees.manager_id IS NULL
AND (SYSDATE - employees.hire_date) / 365 > 15;



/* ************************************************************************ 
**********************************QUESTION 08******************************
***************************************************************************
8. Write a query to find the name (first _ name, last _ name) and the salary
of the employees who have a higher salary than the employee whoselast 
name='Bulll
*/
SELECT first_name, 
       last_name, 
       salary
FROM employees
WHERE salary > (SELECT salary 
                FROM employees 
                WHERE last_name = 'Bull');



/* ************************************************************************ 
**********************************QUESTION 09******************************
***************************************************************************

9. Write a query to find the name (first _ name, last _ name) of all employ
-ees who works in the IT department
*/
SELECT employees.first_name, 
       employees.last_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE departments.department_name = 'IT';



/* ************************************************************************ 
**********************************QUESTION 10******************************
***************************************************************************

IO. Write a query to find the name (first _ name, last _ name) of the emplo
-yees who have a manager and worked in a USA based department
*/
SELECT employees.first_name, 
       employees.last_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id
JOIN locations ON departments.location_id = locations.location_id
JOIN countries ON locations.country_id = countries.country_id
WHERE employees.manager_id IS NOT NULL
AND countries.country_name = 'United States';



/* ************************************************************************ 
**********************************QUESTION 11******************************
***************************************************************************

11. Write a query to find the name (first _ name, last _ name), and salary of the
employees whose salary is greater than the average salary
*/
SELECT first_name, 
       last_name, 
       salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);



/* ************************************************************************ 
**********************************QUESTION 12******************************
***************************************************************************

12. Write a query to find the name(first_name, last_name),and salary of the
employees whose salary is equal to the minimum salary for their job grade
*/
SELECT employees.first_name, 
       employees.last_name, 
       employees.salary
FROM employees
JOIN job_grades ON employees.job_id = job_grades.job_id
WHERE employees.salary = job_grades.min_salary;


/* ************************************************************************ 
**********************************QUESTION 13******************************
***************************************************************************

13. Write a query to find the name (first _ name, last _ name), and salary of the
employees who earns more than the average salary and works in any of the IT
departments
*/
SELECT employees.first_name, 
       employees.last_name, 
       employees.salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE employees.salary > (SELECT AVG(salary) FROM employees)
AND departments.department_name = 'IT';



/* ************************************************************************ 
**********************************QUESTION 14******************************
***************************************************************************

14. Write a query to find the name (first_name, last_name), and salary of the
employees who earn the same salary as the minimum salary for all
departments.
*/
SELECT employees.first_name, 
       employees.last_name, 
       employees.salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE employees.salary = (SELECT MIN(salary) FROM employees);


/* ************************************************************************ 
**********************************QUESTION 15******************************
***************************************************************************

15. Write a query to find the name (first_name, last_name) and salary of the
employees who earn a salary that is higher than the salary of all the Shipping
Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to
highest
*/
SELECT employees.first_name, 
       employees.last_name, 
       employees.salary
FROM employees
WHERE employees.salary > (SELECT MAX(salary) 
                          FROM employees 
                          WHERE job_id = 'SH_CLERK')
ORDER BY employees.salary ASC;



