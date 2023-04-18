CREATE TABLE students (
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
classification VARCHAR(20),
major VARCHAR(50),
email VARCHAR(100)
);

CREATE TABLE courses (
id INTEGER PRIMARY KEY AUTOINCREMENT,
department VARCHAR(50),
course_number VARCHAR(10),
course_name VARCHAR(100),
semester VARCHAR(20),
year INTEGER
);

CREATE TABLE categories (
id INTEGER PRIMARY KEY AUTOINCREMENT,
course_id INTEGER REFERENCES courses(id),
category_name VARCHAR(50),
percentage FLOAT
);

CREATE TABLE assignments (
id INTEGER PRIMARY KEY AUTOINCREMENT,
category_id INTEGER REFERENCES categories(id),
assignment_name VARCHAR(50),
total_points FLOAT
);

CREATE TABLE grades (
id INTEGER PRIMARY KEY AUTOINCREMENT,
assignment_id INTEGER REFERENCES assignments(id),
student_id INTEGER REFERENCES students(id),
points FLOAT,
final_grade FLOAT
);

-- Insert students
INSERT INTO students (first_name, last_name, classification, major, email) VALUES
('John', 'Doe', 'Junior', 'Computer Science', 'john.doe@example.com'),
('Jane', 'Qoe', 'Senior', 'Biology', 'jane.doe@example.com'),
('Bob', 'Smith', 'Freshman', 'Psychology', 'bob.smith@example.com');

-- Insert courses
INSERT INTO courses (department, course_number, course_name, semester, year) VALUES
('Computer Science', 'CS101', 'Introduction to Programming', 'Fall', 2022),
('Biology', 'BIO201', 'Genetics', 'Spring', 2023),
('Psychology', 'PSY301', 'Abnormal Psychology', 'Fall', 2022),
('Mathematics', 'MAT202', 'Calculus II', 'Spring', 2023),
('History', 'HIS101', 'World History', 'Fall', 2022);

-- Insert categories
INSERT INTO categories (course_id, category_name, percentage) VALUES
(1, 'Participation', 10),
(1, 'Homework', 20),
(1, 'Tests', 50),
(1, 'Projects', 20);


-- Insert assignments
INSERT INTO assignments (category_id, assignment_name, total_points) VALUES
(1, 'Participation', 10),
(1, 'Homework', 20),
(1, 'Tests', 50),
(1, 'Projects', 20);

-- Insert grades for John Doe
INSERT INTO grades (assignment_id, student_id, points) VALUES 
    (1, 1, 8), -- Introduction to Programming - Participation 1
    (2, 1, 88), -- Introduction to Programming - Homework 1
    (3, 1, 95), -- Introduction to Programming - Test 1
    (4, 1, 100); -- Introduction to Programming - Project 1

-- Insert grades for Jane Doe
INSERT INTO grades (assignment_id, student_id, points) VALUES 
    (1, 2, 6), -- Introduction to Programming - Participation 1
    (2, 2, 90), -- Introduction to Programming - Homework 1
    (3, 2, 87), -- Introduction to Programming - Test 1
    (4, 2, 95); -- Introduction to Programming - Project 1

-- Insert grades for Bob Smith
INSERT INTO grades (assignment_id, student_id, points) VALUES 
    (1, 3, 10), -- Introduction to Programming - Participation 1
    (2, 3, 75), -- Introduction to Programming - Homework 1
    (3, 3, 80), -- Introduction to Programming - Test 1
    (4, 3, 85); -- Introduction to Programming - Project 1




-- Compute the final grade for each student in every class. Reading the grade, catagories and assignemnt tables.
/*

SELECT students.first_name || ' ' || students.last_name AS student_name,
       courses.course_name,
       SUM(grades.points * assignments.total_points / 10 * categories.percentage / 100) AS final_grade
FROM students
JOIN grades ON students.id = grades.student_id
JOIN assignments ON grades.assignment_id = assignments.id
JOIN categories ON assignments.category_id = categories.id
JOIN courses ON categories.course_id = courses.id
GROUP BY students.id, courses.id;

*/

-- QUERIES:
