C:\Program Files\PostgreSQL\14\bin>psql.exe -d postgres -U postgres
Пароль пользователя postgres:
psql (14.6)
ПРЕДУПРЕЖДЕНИЕ: Кодовая страница консоли (866) отличается от основной
                страницы Windows (1251).
                8-битовые (русские) символы могут отображаться некорректно.
                Подробнее об этом смотрите документацию psql, раздел
                "Notes for Windows users".
Введите "help", чтобы получить справку.

postgres=# \c skypro
Вы подключены к базе данных "skypro" как пользователь "postgres".
skypro=# SELECT * FROM employee;
 id |  Имя  | Фамилия |  Пол  | Возраст
----+-------+---------+-------+---------
  1 | Lena  | Lenina  | Woman |      23
  2 | Oleg  | Vasin   | Man   |      30
  3 | Nina  | Mirova  | Woman |      15
  4 | Ivan  | Ivanov  | Man   |      41
  5 | Maria | Mohova  | Woman |      33


skypro=# SELECT * FROM employee WHERE Возраст < 30;
 id | Имя  | Фамилия |  Пол  | Возраст
----+------+---------+-------+---------
  1 | Lena | Lenina  | Woman |      23
  3 | Nina | Mirova  | Woman |      15


skypro=# SELECT * FROM employee WHERE Возраст > 50;
 id | Имя | Фамилия | Пол | Возраст
----+-----+---------+-----+---------


skypro=# SELECT * FROM employee
skypro-# WHERE Возраст BETWEEN 30 AND 50;
 id |  Имя  | Фамилия |  Пол  | Возраст
----+-------+---------+-------+---------
  2 | Oleg  | Vasin   | Man   |      30
  4 | Ivan  | Ivanov  | Man   |      41
  5 | Maria | Mohova  | Woman |      33


skypro=# SELECT * FROM employee
skypro-# ORDER BY Фамилия DESC;
 id |  Имя  | Фамилия |  Пол  | Возраст
----+-------+---------+-------+---------
  2 | Oleg  | Vasin   | Man   |      30
  5 | Maria | Mohova  | Woman |      33
  3 | Nina  | Mirova  | Woman |      15
  1 | Lena  | Lenina  | Woman |      23
  4 | Ivan  | Ivanov  | Man   |      41


skypro=# SELECT * FROM employee
skypro-# WHERE Имя LIKE '%_____%';
 id |  Имя  | Фамилия |  Пол  | Возраст
----+-------+---------+-------+---------
  5 | Maria | Mohova  | Woman |      33


skypro=# UPDATE employee SET Имя = 'Oleg' WHERE Имя = 'Ivan';
UPDATE 1
skypro=# UPDATE employee SET Имя = 'Maria' WHERE Имя = 'Lena';
UPDATE 1
skypro=# SELECT * FROM employee;
 id |  Имя  | Фамилия |  Пол  | Возраст
----+-------+---------+-------+---------
  2 | Oleg  | Vasin   | Man   |      30
  3 | Nina  | Mirova  | Woman |      15
  5 | Maria | Mohova  | Woman |      33
  4 | Oleg  | Ivanov  | Man   |      41
  1 | Maria | Lenina  | Woman |      23


skypro=# SELECT Имя,
skypro-# SUM (Возраст) AS Суммарный_возраст
skypro-# FROM employee GROUP BY Имя;
  Имя  | Суммарный_возраст
-------+-------------------
 Nina  |                15
 Maria |                56
 Oleg  |                71


skypro=# SELECT Имя,
skypro-# MIN (Возраст) AS Минимальный_возраст
skypro-# FROM employee GROUP BY Имя;
  Имя  | Минимальный_возраст
-------+---------------------
 Nina  |                  15
 Maria |                  23
 Oleg  |                  30


skypro=# SELECT Имя,
skypro-# MAX(Возраст) Максимальный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя
skypro-# HAVING count(Имя) > 1
skypro-# ORDER BY Максимальный_возраст;
  Имя  | Максимальный_возраст
-------+----------------------
 Maria |                   33
 Oleg  |                   41
