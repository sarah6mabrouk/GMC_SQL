CREATE DATABASE TestJoinsDB;
USE TestJoinsDB;

-- Table des étudiants
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    dept_id INT
);


-- Table des départements

CREATE TABLE Departmentxs (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);
-- Table des cours

CREATE TABLE Coursexs (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    dept_id INT
);
-- Table des inscriptions
CREATE TABLE Enrollmentxs (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(3, 2)
);

ALTER TABLE Enrollmentxs
ALTER COLUMN grade REAL;

-- Table des professeurs

CREATE TABLE Professorxs (
    professor_id INT PRIMARY KEY,
    professor_name VARCHAR(100),
    course_id INT
);
-- Insertion de 50 étudiants
INSERT INTO Students (student_id, student_name, dept_id) VALUES
(1, 'Alice', 1), (2, 'Bob', 2), (3, 'Charlie', 3), (4, 'David', 1), (5, 'Eve', 2),
(6, 'Frank', 3), (7, 'Grace', 1), (8, 'Heidi', 2), (9, 'Ivan', 3), (10, 'Judy', 1),
(11, 'Karl', 2), (12, 'Liam', 3), (13, 'Mia', 1), (14, 'Nina', 2), (15, 'Oscar', 3),
(16, 'Paul', 1), (17, 'Quinn', 2), (18, 'Rita', 3), (19, 'Sam', 1), (20, 'Tina', 2),
(21, 'Uma', 3), (22, 'Vera', 1), (23, 'Will', 2), (24, 'Xena', 3), (25, 'Yuri', 1),
(26, 'Zara', 2), (27, 'Aaron', 3), (28, 'Bella', 1), (29, 'Cody', 2), (30, 'Duke', 3),
(31, 'Ella', 1), (32, 'Faye', 2), (33, 'Gary', 3), (34, 'Hank', 1), (35, 'Ivy', 2),
(36, 'Jake', 3), (37, 'Kara', 1), (38, 'Lara', 2), (39, 'Mike', 3), (40, 'Nina', 1),
(41, 'Olly', 2), (42, 'Pia', 3), (43, 'Quinn', 1), (44, 'Ruth', 2), (45, 'Seth', 3),
(46, 'Tara', 1), (47, 'Ursula', 2), (48, 'Vick', 3), (49, 'Walt', 1), (50, 'Xavi', 2);

-- Insertion de 50 départements
INSERT INTO Departmentxs (dept_id, dept_name) VALUES
(1, 'Computer Science'), (2, 'Mathematics'), (3, 'Physics'),
(4, 'Chemistry'), (5, 'Biology'), (6, 'Engineering'), (7, 'Economics'), (8, 'History'),
(9, 'Geography'), (10, 'Law'), (11, 'Philosophy'), (12, 'Sociology'), (13, 'Music'),
(14, 'Art'), (15, 'Literature'), (16, 'Psychology'), (17, 'Business'), (18, 'Political Science'),
(19, 'Astronomy'), (20, 'Anthropology'), (21, 'Architecture'), (22, 'Education'),
(23, 'Environmental Science'), (24, 'Media Studies'), (25, 'Nursing'), (26, 'Pharmacy'),
(27, 'Public Health'), (28, 'Sports Science'), (29, 'Theology'), (30, 'Veterinary Science'),
(31, 'Agriculture'), (32, 'Linguistics'), (33, 'Statistics'), (34, 'Design'),
(35, 'Ethics'), (36, 'Genetics'), (37, 'Geology'), (38, 'Horticulture'), (39, 'Journalism'),
(40, 'Marine Biology'), (41, 'Meteorology'), (42, 'Neuroscience'), (43, 'Optometry'),
(44, 'Paleontology'), (45, 'Zoology'), (46, 'Civil Engineering'), (47, 'Mechanical Engineering'),
(48, 'Electrical Engineering'), (49, 'Computer Engineering'), (50 ,'Data Science');

-- Insertion de 50 cours
INSERT INTO Coursexs  (course_id, course_name, dept_id) VALUES
(1, 'Algorithms', 1), (2, 'Linear Algebra', 2), (3, 'Quantum Mechanics', 3),
(4, 'Organic Chemistry', 4), (5, 'Cell Biology', 5), (6, 'Thermodynamics', 6),
(7, 'Microeconomics', 7), (8, 'World History', 8), (9, 'Cartography', 9), (10, 'Constitutional Law', 10),
(11, 'Ethics in Philosophy', 11), (12, 'Sociology of Family', 12), (13, 'Music Theory', 13),
(14, 'Art History', 14), (15, 'Shakespearean Literature', 15), (16, 'Cognitive Psychology', 16),
(17, 'Financial Accounting', 17), (18, 'Political Systems', 18), (19, 'Stellar Physics', 19),
(20, 'Cultural Anthropology', 20), (21, 'Modern Architecture', 21), (22, 'Child Education', 22),
(23, 'Sustainable Development', 23), (24, 'Media Law', 24), (25, 'Clinical Nursing', 25),
(26, 'Pharmaceutical Chemistry', 26), (27, 'Epidemiology', 27), (28, 'Sports Medicine', 28),
(29, 'Theology of Religion', 29), (30, 'Veterinary Practices', 30), (31, 'Agricultural Economics', 31),
(32, 'Phonetics', 32), (33, 'Statistical Methods', 33), (34, 'Graphic Design', 34),
(35, 'Bioethics', 35), (36, 'Genomic Sequencing', 36), (37, 'Geophysics', 37),
(38, 'Plant Pathology', 38), (39, 'Investigative Journalism', 39), (40, 'Marine Ecosystems', 40),
(41, 'Atmospheric Dynamics', 41), (42, 'Cognitive Neuroscience', 42), (43, 'Optical Physics', 43),
(44, 'Paleobiology', 44), (45, 'Zoological Studies', 45), (46, 'Structural Engineering', 46),
(47, 'Heat Transfer', 47), (48, 'Signal Processing', 48), (49, 'Machine Learning', 49),
(50, 'Deep Learning', 50);

-- Insertion de 50 inscriptions (Enrollments)
INSERT INTO Enrollmentxs (enrollment_id, student_id, course_id, grade) VALUES
(1, 1, 1, 85.50), (2, 2, 2, 90.00), (3, 3, 3, 95.00), (4, 4, 1, 88.00), (5, 1, 4, 92.00),
(6, 5, 2, 76.00), (7, 6, 3, 83.50), (8, 7, 1, 89.00), (9, 8, 4, 91.50), (10, 9, 2, 80.00),
(11, 10, 3, 84.00), (12, 11, 1, 86.50), (13, 12, 4, 93.00), (14, 13, 2, 78.00), (15, 14, 3, 88.50),
(16, 15, 1, 90.00), (17, 16, 4, 95.50), (18, 17, 2, 76.00), (19, 18, 3, 81.50), (20, 19, 1, 87.00),
(21, 20, 4, 92.50), (22, 21, 2, 77.00), (23, 22, 3, 85.50), (24, 23, 1, 90.50), (25, 24, 4, 94.00),
(26, 25, 2, 75.00), (27, 26, 3, 82.50), (28, 27, 1, 89.50), (29, 28, 4, 93.50), (30, 29, 2, 79.00),
(31, 30, 3, 86.50), (32, 31, 1, 91.00), (33, 32, 4, 96.00), (34, 33, 2, 74.00), (35, 34, 3, 83.00),
(36, 35, 1, 88.00), (37, 36, 4, 92.00) ;
-- Insertion de 50 professeurs
INSERT INTO Professorxs (professor_id, professor_name, course_id) VALUES
(1, 'Prof. Smith', 1), (2, 'Prof. Johnson', 2), (3, 'Prof. Lee', 3), (4, 'Prof. Brown', 4),
(5, 'Prof. Taylor', 5), (6, 'Prof. Williams', 6), (7, 'Prof. Davis', 7), (8, 'Prof. Wilson', 8),
(9, 'Prof. Clark', 9), (10, 'Prof. Lewis', 10), (11, 'Prof. Robinson', 11), (12, 'Prof. Walker', 12),
(13, 'Prof. Hall', 13), (14, 'Prof. Young', 14), (15, 'Prof. King', 15), (16, 'Prof. Scott', 16),
(17, 'Prof. Green', 17), (18, 'Prof. Adams', 18), (19, 'Prof. Baker', 19), (20, 'Prof. Hill', 20),
(21, 'Prof. Wright', 21), (22, 'Prof. Turner', 22), (23, 'Prof. Carter', 23), (24, 'Prof. Phillips', 24),
(25, 'Prof. Parker', 25), (26, 'Prof. Evans', 26), (27, 'Prof. Collins', 27), (28, 'Prof. Stewart', 28),
(29, 'Prof. Morris', 29), (30, 'Prof. Murphy', 30), (31, 'Prof. Reed', 31), (32, 'Prof. Cook', 32),
(33, 'Prof. Howard', 33), (34, 'Prof. Ward', 34), (35, 'Prof. Torres', 35), (36, 'Prof. Peterson', 36),
(37, 'Prof. Gray', 37), (38, 'Prof. Ramirez', 38), (39, 'Prof. James', 39), (40, 'Prof. Watson', 40),
(41, 'Prof. Brooks', 41), (42, 'Prof. Kelly', 42), (43, 'Prof. Sanders', 43), (44, 'Prof. Price', 44),
(45, 'Prof. Bennett', 45), (46, 'Prof. Wood', 46), (47, 'Prof. Foster', 47), (48, 'Prof. Richardson', 48),
(49, 'Prof. Cox', 49), (50, 'Prof. Powell', 50);

SELECT* FROM Students;

SELECT* FROM Departmentxs ;

SELECT* FROM Professorxs;

SELECT* FROM Coursexs;

select* from Enrollmentxs ;



--1.	Quels sont les professeurs qui n'enseignent aucun cours ?

SELECT professor_name , course_name FROM Professorxs 

LEFT JOIN Coursexs 

ON Professorxs.course_id  = Coursexs.course_id  WHERE Course_name is NULL ;

INSERT INTO Professorxs (professor_id , professor_name) VALUES (51 , 'laila');

SELECT professor_name FROM Professorxs where course_id not in (SELECT course_id from Coursexs);

--2.	Quels cours n'ont aucun étudiant inscrit ?

SELECT course_name FROM Coursexs where course_id  not in (SELECT course_id FROM Enrollmentxs );

--3.	Quels départements ont plus de 3 cours proposés ?

SELECT dept_name ,Count(course_id) as nb_course, Departmentxs.dept_id  FROM Departmentxs 

INNER JOIN Coursexs 

ON Departmentxs.dept_id = Coursexs.dept_id  GROUP BY Departmentxs.dept_id ,dept_name  HAVING COUNT(course_id) >3;

SELECT d.dept_id, d.dept_name  FROM Departmentxs  d  WHERE (SELECT COUNT(c.course_id)  FROM Coursexs  c  WHERE c.dept_id = d.dept_id) = 1;

--4.	Quels sont les étudiants avec la plus haute et la plus basse note ?

SELECT TOP(1) student_name , grade FROM Students

INNER JOIN Enrollmentxs 

ON Students.student_id = Enrollmentxs.student_id ORDER BY grade ASC ;

SELECT S.student_id, S.student_name, E.grade
FROM Students S
JOIN Enrollmentxs E ON S.student_id = E.student_id
WHERE E.grade = (SELECT MIN(grade) FROM Enrollmentxs) OR E.grade = (SELECT MAX(grade) FROM Enrollmentxs );


--5.	Quel professeur a le plus d'étudiants inscrits à ses cours ?

SELECT TOP(1) professor_name , Count(student_id) as nb_students FROM Professorxs 

INNER JOIN Enrollmentxs 

ON Professorxs.course_id = Enrollmentxs.course_id GROUP BY professor_name ORDER BY count(student_id) DESC;

--6.	Quels étudiants ont une note moyenne supérieure à 85 dans tous les cours auxquels ils sont inscrits ?

SELECT student_name , avg(grade) as moyenne FROM Students

INNER JOIN Enrollmentxs 

ON Students.student_id = Enrollmentxs.student_id  GROUP BY student_name Having avg(grade) > 85;

SELECT* FROM Students;
SELECT* From Enrollmentxs ;

--7.	Quels départements ont plus de 5 étudiants inscrits dans leurs cours ?

SELECT dept_name , COUNT(student_id) as nb_students FROM Departmentxs 

INNER JOIN Students 

ON Departmentxs.dept_id= Students.dept_id GROUP BY dept_name HAVING COUNT(student_id) >16 ;


--8.	Quels sont les étudiants inscrits dans les différents cours et quelles sont leurs notes ?

SELECT Students.student_id, Students.student_name, Coursexs.course_id, Enrollmentxs.grade, Coursexs.course_name FROM Students 
JOIN Enrollmentxs 
ON Students.student_id = Enrollmentxs.student_id
JOIN Coursexs
ON Coursexs.course_id = Enrollmentxs.course_id;

--9.	Quels sont les étudiants, y compris ceux qui ne sont pas inscrits à des cours ?

SELECT student_name , Coursexs.course_id , Coursexs.course_name  FROM Students
LEFT JOIN Enrollmentxs 
ON Students.student_id = Enrollmentxs.student_id 

LEFT JOIN Coursexs 
ON Coursexs.course_id = Enrollmentxs.course_id ;

--10.	Quels sont les cours avec leurs étudiants inscrits, même si certains cours n'ont aucun étudiant inscrit ?

SELECT Coursexs.course_name, Students.student_name  , Coursexs.course_id  FROM Coursexs 
LEFT JOIN Enrollmentxs 
ON Coursexs.course_id = Enrollmentxs.course_id

LEFT JOIN Students
ON Students.student_id = Enrollmentxs.student_id  ;

--11.	Liste de tous les étudiants et tous les cours, qu'ils soient inscrits ou non ?

SELECT student_name , Coursexs.course_id , Coursexs.course_name , Enrollmentxs.enrollment_id  FROM Students
FULL OUTER JOIN Enrollmentxs 
ON Students.student_id = Enrollmentxs.student_id 

FULL OUTER JOIN Coursexs 
ON Coursexs.course_id = Enrollmentxs.course_id ;


-- 12.	Quels étudiants ont obtenu des notes supérieures à 90 dans leurs cours ?

SELECT student_id FROM Enrollmentxs where grade> 90; 

SELECT student_name FROM Students WHERE student_id IN (SELECT student_id FROM Enrollmentxs where grade> 90);


select student_name, Enrollmentxs.student_id, grade from Students 
inner join Enrollmentxs 
on Students .student_id= Enrollmentxs.student_id
where Enrollmentxs.grade> 90;

--13.	Quelle est la note moyenne obtenue par chaque étudiant ?

SELECT avg(grade) as moyenne , student_name FROM Students 

INNER JOIN Enrollmentxs 

ON Students.student_id = Enrollmentxs.student_id GROUP BY student_name;


--14.	Quels départements ont une note moyenne supérieure à 85 parmi leurs étudiants inscrits ?


select Departmentxs.dept_id, Departmentxs.dept_name, AVG(Enrollmentxs.grade) AS average_grade
FROM Departmentxs 
join Coursexs on Departmentxs.dept_id = Coursexs .dept_id
join Enrollmentxs on Coursexs.course_id = Enrollmentxs .course_id
group by Departmentxs.dept_id, Departmentxs.dept_name
having avg(Enrollmentxs.grade) > 85;

--15.	Quelle est la note moyenne des étudiants dans chaque département ?

select Departmentxs.dept_id, Departmentxs.dept_name, AVG(Enrollmentxs.grade) AS average_grade
FROM Departmentxs 
join Coursexs on Departmentxs.dept_id = Coursexs .dept_id
join Enrollmentxs on Coursexs.course_id = Enrollmentxs .course_id
group by Departmentxs.dept_id, Departmentxs.dept_name;

SELECT dept_name , grade FROM Departmentxs

INNER JOIN Coursexs 

ON Departmentxs.dept_id = Coursexs.dept_id

INNER JOIN Enrollmentxs 

ON Coursexs.course_id = Enrollmentxs .course_id ;




--16.	Quels sont les étudiants classés par ordre décroissant de leurs notes ?

SELECT student_name , grade FROM Students 

INNER JOIN Enrollmentxs 

ON Students.student_id = Enrollmentxs.student_id ORDER BY grade DESC;

-- FIN!




