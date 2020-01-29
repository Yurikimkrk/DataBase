use shop;

-- Транзакции, переменные, представления

-- задание 1. Транзакция 
-- 1) удаление id = 1 с sample 
-- 2) вставка записи id 1 из shop в sample 
-- (из за разного числа столбцов вставлял id и name)
-- 3) удаление id = 1 с shop 
-- Получилось перемещение с затиранием значения и удалением из источника 
-- все условия были выполнены, поэтому транзакция завершилась успешно 
START TRANSACTION; 
DELETE FROM sample.users WHERE id = 1;
INSERT INTO sample.users SELECT id, name FROM shop.users WHERE id = 1;
DELETE FROM users WHERE id = 1 LIMIT 1;
COMMIT;

-- задание 2. Товарные позиции и название каталога (тип)
create or replace view prod as 
  select p.name as name, c.name as `type` from products p inner join catalogs c on p.catalog_id = c.id;
  
select * from prod;
