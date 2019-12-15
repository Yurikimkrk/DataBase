-- новые таблицы ДЗ дописаны в конце скрипта

drop database if exists vk;
create database vk;
use vk;

drop table if exists users;
create table users(
	id serial primary key,
	firstname varchar(100),
	lastname varchar(100),
	email varchar(100) unique,
	password_hash varchar(100),
	phone varchar(12),
	index (phone),
	index (firstname, lastname)
);

drop table if exists `profiles`;
create table `profiles`(
	user_id serial primary key,
	gender char(1),
	birthday date,
	photo_id bigint unsigned,
	hometown varchar(100),
	created_at datetime default now()	
);

alter table `profiles` add constraint fk_user_id
	foreign key (user_id) references users(id)
	on update cascade
	on delete restrict
;

drop table if exists messages;
create table messages(
	id serial primary key,
	from_user_id bigint unsigned not null,
	to_user_id bigint unsigned not null,
	body text,
	created_at datetime default now() ,
	
	index (from_user_id),
	index (to_user_id),
	foreign key (from_user_id) references users(id),
	foreign key (to_user_id) references users(id)
);

drop table if exists friend_requests;
create table friend_requests(
	initiator_user_id bigint unsigned not null,
	target_user_id bigint unsigned not null,
	`status` enum('requested', 'approved', 'unfriended', 'declined'),
	created_at datetime default now(),
	updated_at datetime,
	
	primary key (initiator_user_id, target_user_id),
	index (initiator_user_id),
	index (target_user_id),
	foreign key (initiator_user_id) references users(id),
	foreign key (target_user_id) references users(id)
);

drop table if exists communities;
create table communities(
	id serial primary key,
	name varchar(200),
	
	index (name)
);

drop table if exists users_communities;
create table users_communities(
	user_id bigint unsigned not null,
	community_id bigint unsigned not null,
	
	primary key (user_id, community_id),
	foreign key (user_id) references users(id),
	foreign key (community_id) references communities(id)
);

drop table if exists media_types;
create table media_types(
	id serial primary key,
	name varchar(200),
    created_at datetime default now(),
    updated_at datetime default current_timestamp on update current_timestamp

);

drop table if exists media;
create table media(
	id serial primary key,
    media_type_id bigint unsigned not null,
    user_id bigint unsigned not null,
  	body text,
    filename varchar(255),
    `size` int,
	metadata JSON,
    created_at datetime default now(),
    updated_at datetime default current_timestamp on update current_timestamp,

    index (user_id),
    foreign key (user_id) references users(id),
    foreign key (media_type_id) references media_types(id)
);

drop table if exists likes;
create table likes(
	id serial primary key,
    user_id bigint unsigned not null,
    media_id bigint unsigned not null,
    created_at datetime default now(),
    
    foreign key (user_id) references users(id),
    foreign key (media_id) references media(id)

);

drop table if exists photo_albums;
create table photo_albums(
	id serial primary key,
	name varchar(200),
    user_id bigint unsigned not null,

    foreign key (user_id) references users(id)
);

drop table if exists photos;
create table photos(
	id serial primary key,
	album_id bigint unsigned not null,
	media_id bigint unsigned not null,

	foreign key (album_id) references photo_albums(id),
    foreign key (media_id) references media(id)
);

-- Сделаны 3 новые таблицы, "Настройки пользователя", "Видеотека", "Видео".
-- Последние 2 сделаны по примеру фото и фотоальбомов с такими же связями относительно
-- "пользователей" и "медиа".
-- Настройки сделаны для сохранения индивидуальных пользовательских данных страницы.

drop table if exists user_settings;
create table user_settings(
	user_id serial primary key,
	color_theme enum('white', 'black', 'gray') not null default 'white',
	privacy enum('invisible', 'limited', 'open') not null default 'open',
	
	foreign key (user_id) references users(id)
);

drop table if exists video_library;
create table video_library(
	id serial primary key,
	name varchar(200),
    user_id bigint unsigned not null,

    foreign key (user_id) references users(id)
);

drop table if exists videos;
create table videos(
	id serial primary key,
	library_id bigint unsigned not null,
	media_id bigint unsigned not null,

	foreign key (library_id) references video_library(id),
    foreign key (media_id) references media(id)
);

-- В качестве наглядного примера для себя создал 3х пользователей, их профили и настройки
-- В настройках проверил работу default присвоения значений
-- (все получили по умолчанию уровень приватности - открытый) 

insert into users (firstname, lastname, email, password_hash, phone) values 
("pavel", "durov", "ivanov@yandex.ru", "qwerty", "89505555555"),
("bill", "gates", "petrov@yandex.ru", "asdfgh", "895011111111"),
("ivan", "grozny", "i.pushkina@yandex.ru", "zxcvbn", "89502222222");

insert into profiles (gender, birthday, photo_id, hometown) values 
("m", "1984.10.10", "1", "St.Petersburg"),
("m", "1955.10.28", "2", "Seattle"),
("m", "1530.08.25", "3", "Moscow");

insert into user_settings (color_theme) values 
("black"),
("white"),
("white");






