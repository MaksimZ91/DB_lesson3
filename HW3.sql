USE mydb;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8, 2),
    age INT   
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
	("Вася", "Петров", "Начальник", 40, 100000, 60),
    ("Петр", "Власов", "Начальник", 8, 70000, 30),
    ("Катя", "Катина", "Инженер", 2, 70000, 25),
    ("Саша", "Сасин", "Инженер", 12, 50000, 35),
    ("Иван", "Иванов", "Рабочий", 40, 30000, 59),
    ("Петр", "Петров", "Рабочий", 20, 25000, 40),
    ("Сидр", "Сидоров", "Рабочий", 10, 20000, 35),
    ("Антон", "Антонов", "Рабочий", 8, 19000, 28),
    ("Юрий", "Юрков", "Рабочий", 5, 15000, 25),
    ("Максим", "Максимов", "Рабочий", 2, 11000, 22),
    ("Юрий", "Галкин", "Рабочий", 3, 12000, 24),
    ("Людмила", "Маркина", "Уборщик", 10, 10000, 49);
    
SELECT * FROM staff;

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
-- порядке: убывания

SELECT *
FROM staff
ORDER BY salary DESC;

-- порядке: возрастания
SELECT *
FROM staff
ORDER BY salary;

-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT *
FROM staff
ORDER BY salary DESC 
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post AS "Должность", 
	   SUM(salary) AS "Суммарная ЗП"
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT 	post AS "Должность" ,
		COUNT(age) AS "Количество сотрудников"
FROM staff
WHERE age BETWEEN 24 AND 49    -- WHERE post = "Рабочий" AND  age BETWEEN 24 AND 49  без HAVING
GROUP BY post
HAVING post = "Рабочий";       

-- 5. Найдите количество специальностей
SELECT post AS "Cпециальность", 
		COUNT(salary)AS "Количество специальностей"
FROM staff
GROUP BY post;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT 	post AS "Должность" , AVG(age) AS "Cредний возраст"
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;




        









