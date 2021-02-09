use cinemapark;

--  Активность в оценке фильмов среди пользователей 
SELECT login as `user`, COUNT(*) AS total_ratings
  FROM users
    JOIN ratings ON users.id = ratings.user_id
  where rating
  GROUP BY users.id
  ORDER BY total_ratings DESC;
 
-- Количество сыгранных ролей каждого актера (представление)
CREATE or replace VIEW actors_activity
 AS 
 SELECT firstname, lastname, COUNT(*) AS total_films
  FROM actors
    JOIN actors_filmography ON actors.id = actors_filmography.actor_id
  GROUP BY actors.id
  order by count(*) desc;
 
-- Количество снятых фильмов у каждого режиссера (представление)
CREATE or replace VIEW producers_activity
 AS 
 SELECT firstname, lastname, COUNT(*) AS total_films
  FROM producers
    JOIN producer_filmography ON producers.id = producer_filmography.producer_id
  GROUP BY producers.id
  order by count(*) desc;
  
-- Рейтинги фильмов на основании голосов зарегестрированных пользователей  (представление)
CREATE or replace VIEW films_rating
 AS
SELECT films_name, round(avg(rating),1) AS average_rating
  FROM films
  GROUP BY films_name
  ORDER BY average_rating DESC;
 
 
select * from actors_activity;
select * from producers_activity;
select * from films_rating;

 
 
