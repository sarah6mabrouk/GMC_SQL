USE TestjoinDB;


SELECT * FROM Students;
select student_name from Students;


select Student_name from Students where Student_name like 'A%';

select Student_name, Dept_name from Students
inner join Departments
on Departments.dept_id = Students.dept_id
where Dept_name = 'Computer Science'
order by Student_name desc
;

--professeurs = order (dept_id)

select Departments.dept_id, professor_name from Professors
inner join Courses
on Courses.course_id = Professors.course_id
inner join Departments
on Departments.dept_id = Courses.dept_id
order by dept_id desc;

-- count student number in  each dept
select count(student_name) "number of students by department", dept_id from Students group by dept_id;

-- note moy par dept
select Students.dept_id, avg(grade) "average grade", Departments.dept_name from Enrollments
inner join Students
on Students.student_id = Enrollments.student_id 
inner join Departments
on Departments.dept_id = Students.dept_id group by Students.dept_id, Departments.dept_name;
;

-- cours pr chaque dept
select Departments.dept_id, count(course_id) 'num_courses' from Courses
inner join Departments
on Departments.dept_id = Courses.dept_id group by Departments.dept_id;

-- nbre des etudiants par departments
select dept_name, count(student_id) as 'num_Students' from Students
inner join Departments
on Departments.dept_id = Students.dept_id group by Departments.dept_name
having count(student_id) > 16
;


select student_name, course_id from Students
right join Enrollments
on Enrollments.student_id = Students.student_id;

select student_name, course_id from Enrollments
right join Students
on Enrollments.student_id = Students.student_id;

select * from Departments;

select dept_id 'student and courses dept_id' from Courses
except
select dept_id from Students

--etudiants affectés à des (dept >=17 etudiants)
--num student >=17
select dept_id, count(student_id) as 'num_Students' from Students
group by dept_id
having count(student_id)>16

-- students that are in the departments which have more than 17 students
select student_name from Students 
where dept_id in 
	(select dept_id from Students
	group by dept_id
	having count(student_id)>16)
	-- >gives sum of students in the 2 departments (>=17)
