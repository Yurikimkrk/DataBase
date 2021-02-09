use shop;

-- Операторы,фильрация...
-- Задание 1. Сначала очистил поля, потом заполнил текущим временем. 
-- Можно было сразу 2ой update исполнять
update users set created_at = null, updated_at = null;

update users set created_at = NOW(), updated_at = NOW();

-- Задание 2. Привел поля к типу varchar
alter table users change created_at created_at varchar(50);
alter table users change updated_at updated_at varchar(50);

-- Ввел данные в поля
update users set created_at = '10.10.2015 8:10', updated_at = '05.05.2019 22:22';

-- Затем с помощью str_to_date сделал верный формат
update users set created_at = STR_TO_DATE(created_at,'%d.%m.%Y %H:%i');
update users set updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %H:%i');

-- Преобразовал поля к типу datetime
alter table users change created_at created_at datetime;
alter table users change updated_at updated_at datetime;

-- Задание 3. Заполним таблицу storehouses_products
INSERT INTO storehouses_products (storehouse_id, product_id, value) values
('1', '1', 5),
('1', '2', 0),
('2', '1', 1),
('2', '2', 10),
('3', '1', 0),
('3', '2', 3)
;
-- отсортируем от 1 и выше value, в конце 0
SELECT * FROM storehouses_products ORDER BY IF (value > 0, 0, 1), value;

-- Задание 4. пользователи, родившиеся в августе и мае
SELECT * from users WHERE birthday_at LIKE '%-08-%';
SELECT * from users WHERE birthday_at LIKE '%-05-%';

-- Задание 5. Сортировка по айди в заданном порядке
SELECT * FROM catalogs WHERE id IN (5, 1, 2) order by if (id = 5, 0, 1), id;


-- Агрегация данных
-- Задание 1. Средний возраст пользователей
select floor(avg((to_days(NOW()) - to_days(birthday_at))/365.25)) as average_age from users;

-- Задание 2. Дни рождения по дням недели
select count(*) as total,
dayname (CONCAT_WS('-', YEAR (CURRENT_DATE), DATE_FORMAT(birthday_at, '%m-%d' ))) as week_day
from users group by week_day




