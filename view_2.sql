-------Creating where,group by,having and order by clause base views on following table.------------

select * from college;

select * from course;

select * from department;

select * from employees;

select * from faculty;

select * from student;

------------------------------------------------------------------------------------------------------------

----1.Create view using where clause--------------
-----Table1--------------
CREATE VIEW Students_In_ComputerScience AS
SELECT *
FROM student
WHERE major = 'Computer Science';

select * from Students_In_ComputerScience;

-----Table2--------------
CREATE VIEW Courses_With_MoreThan_3Credits AS
SELECT *
FROM course
WHERE credits > 3;

select * from Courses_With_MoreThan_3Credits;

-----Table3--------------
CREATE VIEW Faculty_With_HighSalary AS
SELECT *
FROM faculty
WHERE salary > 70000;

select * from Faculty_With_HighSalary;
-------------------------------------------------------------------------------------------------------------

----2.Create view using group by clause--------------
------Table1--------------
CREATE VIEW Department_Avg_Salary AS
SELECT
    d.dept_name,
    AVG(f.salary) AS avg_salary
FROM
    department AS d
JOIN
    faculty AS f
ON
    d.dept_id = f.faculty_id
GROUP BY
    d.dept_name;

select * from Department_Avg_Salary;

------Table2--------------
CREATE VIEW Student_Count_Per_Major AS
SELECT
    major,
    COUNT(student_id) AS student_count
FROM
    student
GROUP BY
    major;

select * from Student_Count_Per_Major;

------Table3--------------
CREATE VIEW Course_Count_Per_Department AS
SELECT
    d.dept_name,
    COUNT(c.course_id) AS course_count
FROM
    department AS d
JOIN
    course AS c
ON
    d.dept_id = c.course_id
GROUP BY
    d.dept_name;

select * from Course_Count_Per_Department;

-------------------------------------------------------------------------------------------------------------

----3.Create view using having clause--------------
------Table1--------------
CREATE VIEW High_Credit_Courses AS
SELECT
    course_name,
    credits
FROM
    course
GROUP BY
    course_name, credits
HAVING
    credits > 3;

select * from High_Credit_Courses;

------Table2--------------
CREATE VIEW Departments_With_MoreThan_1_Faculty AS
SELECT
    d.dept_name,
    COUNT(f.faculty_id) AS faculty_count
FROM
    department AS d
JOIN
    faculty AS f
ON
    d.dept_id = f.faculty_id
GROUP BY
    d.dept_name
HAVING
    COUNT(f.faculty_id) > 1;

select * from Departments_With_MoreThan_1_Faculty;

------Table3--------------
CREATE VIEW Departments_With_AvgSalary_GreaterThan_60000 AS
SELECT
    d.dept_name,
    AVG(f.salary) AS avg_salary
FROM
    department AS d
JOIN
    faculty AS f
ON
    d.dept_id = f.faculty_id
GROUP BY
    d.dept_name
HAVING
    AVG(f.salary) > 60000;

select * from Departments_With_AvgSalary_GreaterThan_60000;
-------------------------------------------------------------------------------------------------------------

----4.Create view using order by clause--------------
------Table1--------------
CREATE VIEW Students_Ordered_By_LastName AS
SELECT
    student_id,
    first_name,
    last_name
FROM
    student
ORDER BY
    last_name ASC;

select * from Students_Ordered_By_LastName;

------Table2--------------
CREATE VIEW Courses_Ordered_By_Credits_Desc AS
SELECT
    course_id,
    course_name,
    credits
FROM
    course
ORDER BY
    credits DESC;

select * from Courses_Ordered_By_Credits_Desc;

------Table3--------------
CREATE VIEW Faculty_Ordered_By_Salary_Desc AS
SELECT
    faculty_id,
    first_name,
    last_name,
    salary
FROM
    faculty
ORDER BY
    salary DESC;

select * from Faculty_Ordered_By_Salary_Desc;
--------------------------------------------------------------------------------------------------------------