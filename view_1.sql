------Create join based view on following table.----------

select * from college;

select * from course;

select * from department;

select * from employees;

select * from faculty;

select * from student;

------------------------------------------------------------------------------------------------------------

-------Table1--------------

CREATE VIEW Department_With_Course_Info AS
SELECT
    d.dept_id,
    d.dept_name,
    c.course_id,
    c.course_name,
    c.credits
FROM
    department AS d
JOIN
    course AS c
ON
    d.dept_id = c.course_id;

select * from Department_With_Course_Info;

-------------------------------------------------------------------------------------------------------------

-------Table2--------------

CREATE VIEW Faculty_Department_Details AS
SELECT
    f.faculty_id,
    f.first_name,
    f.last_name,
    f.email,
    f.salary,
    d.dept_name
FROM
    faculty AS f
JOIN
    department AS d
ON
    f.faculty_id = d.dept_id;

select * from Faculty_Department_Details;

-------------------------------------------------------------------------------------------------------------

-------Table3--------------

CREATE VIEW Student_Course_Details AS
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    c.credits
FROM
    student AS s
JOIN
    course AS c
ON
    s.student_id = c.course_id;

select * from Student_Course_Details;

-------------------------------------------------------------------------------------------------------------