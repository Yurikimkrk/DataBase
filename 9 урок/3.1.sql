use shop;
 
-- Хранимые процедуры и функции, триггеры

-- задание 1.Функции hello() 
delimiter //
drop function if exists hello//
create function hello ()
returns varchar(100) deterministic
begin
	if (CURRENT_TIME() > "00:00:00") and (CURRENT_TIME() < "05:59:59") then
		return CONCAT('Доброй ночи');
	elseif (CURRENT_TIME() > "06:00:00") and (CURRENT_TIME() < "11:59:59") then
		return CONCAT('Доброе утро');
	elseif (CURRENT_TIME() > "12:00:00") and (CURRENT_TIME() < "17:59:59") then
		return CONCAT('Добрый день');
	else 
		return CONCAT('Добрый вечер');
	end if;
end//

select hello ()//





















