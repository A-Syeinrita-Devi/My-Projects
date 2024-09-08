CREATE DATABASE student_info;

USE student_info;

-- Create the Student table
CREATE TABLE Student (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

-- Create the Term_GPA table
CREATE TABLE Term_GPA (
  id INT,
  term INT,
  gpa FLOAT,
  FOREIGN KEY (id) REFERENCES Student(id)
);

-- Create the Degree table
CREATE TABLE Degree (
  id INT PRIMARY KEY,
  term INT,
  degree CHAR(10),
  FOREIGN KEY (id) REFERENCES Student(id)
);

-- Insert data into the Student table
INSERT INTO Student (id, name)
VALUES (1, 'William'),
       (2, 'Kate'),
       (3, 'Hisham'),
       (4, 'Ahmad'),
       (5, 'Hussien');

-- Insert data into the Term_GPA table
INSERT INTO Term_GPA (id, term, gpa)
VALUES (1, 2011, 3.32),
       (1, 2012, 3.51),
       (2, 2011, 2.22),
       (2, 2013, 1.7),
       (3, 2011, 3.7),
       (4, 2011, 3.1),
       (4, 2012, 3.21),
       (4, 2013, 3.3),
       (5, 2013, 2.99);


-- Insert data into the Degree table
INSERT INTO Degree (id, term, degree)
VALUES (1, 2012, 'Econ'),
       (2, 2011, 'Math'),
       (3, 2012, 'Comp'),
       (4, 2011, 'Eng');
       
       
#b)
SELECT Student.id, Student.name, Term_GPA.term, Term_GPA.gpa
FROM Student
JOIN Term_GPA ON Student.id = Term_GPA.id
WHERE Student.name = 'Ahmad';

#c)
CREATE VIEW performance_2011 AS
SELECT Student.id, Student.name, Term_GPA.gpa
FROM Student
JOIN Term_GPA ON Student.id = Term_GPA.id
WHERE Term_GPA.term = 2011;

SELECT Student.id, Student.name, Term_GPA.gpa
FROM Student
JOIN Term_GPA ON Student.id = Term_GPA.id
WHERE Term_GPA.gpa = (SELECT MAX(gpa) FROM Term_GPA);

#d)
CREATE OR REPLACE VIEW performance_2011 AS
SELECT Student.id, Student.name, Term_GPA.term, Term_GPA.gpa,
    CASE
        WHEN Term_GPA.gpa > 3.5 THEN 'Excellent'
        WHEN Term_GPA.gpa > 3.0 THEN 'Very Good'
        WHEN Term_GPA.gpa > 2.7 THEN 'Good'
        WHEN Term_GPA.gpa > 2.0 THEN 'Satisfactory'
        ELSE 'Fail'
    END AS status
FROM Student
JOIN Term_GPA ON Student.id = Term_GPA.id
WHERE Term_GPA.term = 2011;


#e)
SELECT Student.id, Student.name, Term_GPA.gpa, Degree.degree
FROM Student
LEFT JOIN Term_GPA ON Student.id = Term_GPA.id
LEFT JOIN Degree ON Student.id = Degree.id AND Term_GPA.term = Degree.term;

	
#f)
SELECT S.id, S.name, ROUND(AVG(T.gpa), 2) AS average_gpa
FROM Student S
JOIN Term_GPA T ON S.id = T.id
WHERE S.id NOT IN (SELECT id FROM Degree WHERE id IS NOT NULL)
GROUP BY S.id, S.name;
