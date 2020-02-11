use cinemapark;

-- Триггер для заполнения столбца rating в таблице films. 
-- После того, как пользователь выставит оценку фильму, рейтинг меняется
DELIMITER //

DROP trigger IF EXISTS update_rating//
CREATE TRIGGER update_rating
AFTER insert ON ratings FOR EACH ROW
BEGIN
   update films 
  Set rating = (SELECT avg(rating)
  	  FROM ratings where movie_id = new.movie_id)
     where id = new.movie_id;
end//


-- Функция приветствия пользователя. Обычное приветствие в обычные дни 
-- и для поздравления с днём рождения (при его входе на сайт, к примеру)
drop function if exists birthday//
CREATE FUNCTION birthday (x int) RETURNS varchar(100) deterministic
BEGIN
	if date_format(now(),'%m-%d') = date_format((select birthday from users where id = x),'%m-%d') then
		return CONCAT('Добро пожаловать и с днем рождения!');
	else 
		return CONCAT('Приветствую вас на сайте просмотра фильмов');
	end if;
end//

DELIMITER ;

select birthday ('1');

