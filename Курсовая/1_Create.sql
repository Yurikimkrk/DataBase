/* Создаем базу данных онлайн кинотеатра.
 * Мы будем хранить в ней фильмы, данные о режиссерах, которые их снимали, актеров, которые в них снимались.
 * Зарегестрированные пользователи смогут сохранять фильмы в избранное, а также выставлять рейтинги фильмам.
 */

drop database if exists cinemapark;
create database cinemapark;
use cinemapark;

-- Таблица, содержащая все фотографии (фильмы, актеры, режиссеры)
drop table if exists photo;
create table photo(
	id serial primary key,
	name varchar(200) not null
);

-- Основная таблица -  фильмы
drop table if exists films;
create table films(
	id serial primary key,
	films_name varchar(100) not null,
	release_year year,
	comments varchar(300),
	duration time,
	age_limit varchar(100) not null default '0+',
	photo_id bigint unsigned,
	rating float default 0,
	
	index (films_name),
	foreign key (photo_id) references photo(id)
);

-- Таблица, содержащая все жанры
drop table if exists genre;
create table genre(
	id serial primary key,
	name varchar(200) not null,
	
	index (name)
);

-- Таблица, содержащая жанры фильмов
drop table if exists movie_genres;
create table movie_genres(
	genre_id bigint unsigned not null,
	movie_id bigint unsigned not null,

	foreign key (genre_id) references genre(id),
    foreign key (movie_id) references films(id)
);

-- Таблица, содержащая всех актеров (предпочел не объединять с режиссерами таблицей люди, а вносить в обе таблицы при необходимости)
drop table if exists actors;
create table actors(
	id serial primary key,
	firstname varchar(100) not null,
	lastname varchar(100) not null,
	birthday date,
	photo_id bigint unsigned,
	
	index (firstname, lastname),
	foreign key (photo_id) references photo(id)
);

-- Таблица, содержащая всех продюсеров
drop table if exists producers;
create table producers(
	id serial primary key,
	firstname varchar(100) not null,
	lastname varchar(100) not null,
	birthday date,
	photo_id bigint unsigned,
	
	index (firstname, lastname),
	foreign key (photo_id) references photo(id)
);

-- Таблица, содержащая фильмографию актеров
drop table if exists actors_filmography;
create table actors_filmography(
	actor_id bigint unsigned not null,
	movie_id bigint unsigned not null,
	role enum('leading role', 'supporting role', 'voice acting') not null default 'leading role',

	foreign key (actor_id) references actors(id),
    foreign key (movie_id) references films(id)
);

-- Таблица, содержащая фильмографию продюсеров
drop table if exists producer_filmography;
create table producer_filmography(
	producer_id bigint unsigned not null,
	movie_id bigint unsigned not null,

	foreign key (producer_id) references producers(id),
    foreign key (movie_id) references films(id)
);

-- Таблица авторизованных пользователей портала, которые могут ставить оценки,
-- оставлять отзывы и добавлять фильмы в избранное
drop table if exists users;
create table users(
	id serial primary key,
	login varchar(100) not null unique,
	email varchar(100) unique,
	password_hash varchar(100),
	birthday date,

	index (login)
);

-- Таблица выставления оценок фильмам (рейтинги)
drop table if exists ratings;
create table ratings(
	id serial primary key,
	user_id bigint unsigned not null,
	movie_id bigint unsigned not null,
	rating enum('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') not null,
	reviews varchar(100),

	foreign key (user_id) references users(id),
    foreign key (movie_id) references films(id)
);

-- Таблица избранных фильмов пользователя
drop table if exists favourites;
create table favourites(
	id serial primary key,
	user_id bigint unsigned not null,
	movie_id bigint unsigned not null,

	foreign key (user_id) references users(id),
    foreign key (movie_id) references films(id)
);







