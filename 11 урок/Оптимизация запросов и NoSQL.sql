use shop;

-- создаю таблицу logs (archive)
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	create_time DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	table_name varchar(100) NOT NULL,
	logs_id BIGINT UNSIGNED NOT NULL,
	name varchar(100) NULL
)
ENGINE=ARCHIVE;

-- делаю триггеры для внесения логов в таблицу при новых вставках в users, products, catalogs
DELIMITER //

DROP trigger IF EXISTS new_log_user//
CREATE TRIGGER new_log_user
AFTER insert ON users FOR EACH ROW
BEGIN
   INSERT INTO logs 
  Set create_time = new.created_at, table_name = 'users',
 logs_id = new.id, name = new.name;
end//

DROP trigger IF EXISTS new_log_catalogs//
CREATE TRIGGER new_log_catalogs
AFTER insert ON catalogs FOR EACH ROW
BEGIN
   INSERT INTO logs 
  Set create_time = current_timestamp, table_name = 'catalogs',
 logs_id = new.id, name = new.name;
end//

DROP trigger IF EXISTS new_log_products//
CREATE TRIGGER new_log_products
AFTER insert ON products FOR EACH ROW
BEGIN
   INSERT INTO logs 
  Set create_time = new.created_at, table_name = 'products',
 logs_id = new.id, name = new.name;
end//

DELIMITER ;

-- ввожу новые данные в таблицы, logs заполняется
INSERT INTO shop.users
(name, birthday_at, created_at, updated_at)
VALUES('Дмитрий', '2016-10-30', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO shop.catalogs
(name)
VALUES('Соковыжималки');

INSERT INTO shop.products
(name, description, price, catalog_id, created_at, updated_at)
VALUES('Bosh', 'бери и .....', 999, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


/*								NoSQL
3. Mongo DB
db.shop.insert({category: 'Процессоры'})
db.shop.insert({category: 'Материнские платы'})

db.shop.update({category: 'Процессоры'}, {$set: { products:['Intel Core i3-8100', 'Intel Core i5-7400', 'AMD FX-8320E'] }})
db.shop.update({category: 'Материнские платы'}, {$set: { products:['ASUS ROG MAXIMUS X HERO', 'Gigabyte H310M S2H', 'MSI B250M GAMING PRO'] }})

Задания 1 и 2 пришлось гуглить, так как подробного разбора в видео не было
1. Коллекция для подсчета посещений с определенных IP-адресов Redis
HSET ipaddr 127.0.0.1 1

2. Поиск имени пользователя по электронному адресу и наоборот, 
поиск электронного адреса пользователя по его имени (Redis)
SET Yury mail@mail.ru
SET mail@mail Yury
GET Yury
GET mail@mail.ru
*/





