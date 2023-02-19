CREATE TABLE city
(
    city_id   BIGSERIAL   NOT NULL PRIMARY KEY,
    city_name VARCHAR(60) NOT NULL
);
INSERT INTO city (city_name)
VALUES ('Moskow');
INSERT INTO city (city_name)
VALUES ('Yfa');
INSERT INTO city (city_name)
VALUES ('Orsk');
INSERT INTO city (city_name)
VALUES ('Orel');
INSERT INTO city (city_name)
VALUES ('Krasnodar');
CREATE TABLE employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);
ALTER TABLE employee ADD COLUMN city_id INT;
INSERT INTO employee(first_name, last_name, gender, age, city_id)
VALUES ('Lena', 'Lenina', 'Woman', 23, 1);
INSERT INTO employee(first_name, last_name, gender, age, city_id)
VALUES ('Oleg', 'Vasin', 'Man', 30, 2);
INSERT INTO employee(first_name, last_name, gender, age, city_id)
VALUES ('Maria', 'Nikitina', 'Woman', 17, 3);
INSERT INTO employee(first_name, last_name, gender, age, city_id)
VALUES ('Irina', 'Morozova', 'Woman', 50, 4);
INSERT INTO employee(first_name, last_name, gender, age, city_id)
VALUES ('Svetlana', 'Fomina', 'Woman', 19, 5);
SELECT * FROM employee;
SELECT * FROM city;
ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city (city_id);
SELECT first_name, last_name, city_name FROM employee RIGHT JOIN city ON city.city_id = employee.city_id;
INSERT INTO employee(first_name, last_name, gender, age, city_id)
VALUES ('Alena', 'Krotova', 'Woman', 45, 5);
SELECT first_name, last_name, city_name FROM employee RIGHT JOIN city ON city.city_id = employee.city_id;
ALTER TABLE employee ALTER COLUMN first_name DROP NOT NULL;
INSERT INTO city (city_name) VALUES ('Samara');
SELECT first_name, last_name, city_name FROM employee RIGHT JOIN city ON city.city_id = employee.city_id;
SELECT first_name, city_name FROM employee RIGHT JOIN city ON city.city_id = employee.city_id;
