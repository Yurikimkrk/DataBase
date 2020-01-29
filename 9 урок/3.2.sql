use shop;

-- 3.2 Триггер на проверку ненулевых значений в обоих полях сразу
DELIMITER //
 
CREATE trigger check_null before insert on products
for each row begin
	if (new.name is null) and (new.description is null) then
 		signal sqlstate '45000' set message_text = "Operation canceled";
 	end if;
END; //
 
DELIMITER ;

-- Дает вставить
INSERT INTO shop.products
(name, description, price, catalog_id, created_at, updated_at)
VALUES('Проц', null, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Выдает ошибку
INSERT INTO shop.products
(name, description, price, catalog_id, created_at, updated_at)
VALUES(null, null, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
