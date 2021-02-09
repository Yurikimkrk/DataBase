-- 2.	Создайте базу данных example, разместите в ней таблицу users, 
-- состоящую из двух столбцов, числового id и строкового name

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  unique unique_name(name(10))
);

insert into users values 
(default, 'Dmitri Ivanov'),
(default, 'Alexey Petrov'),
(default, 'Semen Sidorov');

select * from users;