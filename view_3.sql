select * from college;

select * from course;

select * from department;

select * from employees;

select * from faculty;

select * from student;
-------------------------------------------------------------------------------------------------------------
-----Create multi join base views on following table.----------

CREATE VIEW Student_Faculty_Department_Course_Details AS
SELECT
    s.student_id,
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    s.major,
    f.first_name AS faculty_first_name,
    f.last_name AS faculty_last_name,
    f.email AS faculty_email,
    d.dept_name,
    c.course_name,
    c.credits
FROM
    student AS s
JOIN
    faculty AS f ON s.student_id = f.faculty_id -- Assuming a logical join key, adjust if different
JOIN
    department AS d ON f.faculty_id = d.dept_id
JOIN
    course AS c ON s.student_id = c.course_id; -- Assuming a logical join key, adjust if different

select * from Student_Faculty_Department_Course_Details;

-------------------------------------------------------------------------------------------------------------
-------Create CTE base views on following table.------------

WITH StudentCourseCTE AS (
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
        s.student_id = c.course_id
)
SELECT * FROM StudentCourseCTE;

--------------------------------------------------------------------------------------------------------------
-----Create view using subquery--------------

CREATE VIEW Students_Enrolled_In_MoreThan_One_Course AS
SELECT
    s.student_id,
    s.first_name,
    s.last_name
FROM
    student AS s
WHERE
    s.student_id IN (SELECT student_id FROM course GROUP BY student_id HAVING COUNT(course_id) > 1);

select * from Students_Enrolled_In_MoreThan_One_Course;
--------------------------------------------------------------------------------------------------------------