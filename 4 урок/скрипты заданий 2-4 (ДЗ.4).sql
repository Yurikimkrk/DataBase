use vk;

-- несовершеннолетним ставим статус "true"
update `profiles`
set `underage` = 'true'
where `birthday` between '2001-12-20' and '2019-12-20'
;

-- вставляем сообщение из будущего для проверки удаления (после создания меняем дату)
insert ignore into `messages` values ('99','1','10','nihil non itaque minus reprehenderit velit. sit ea odit sed qui sit itaque qui. sint non laborum delectus veniam enim sunt a. illum inventore repudiandae excepturi perferendis dolorum voluptatem.','1973-05-13 03:39:36'),
('2','12','2','rerum rem est quo sint voluptas. voluptatem laboriosam ea eos rerum eaque doloremque eius. ut necessitatibus exercitationem dolor architecto quibusdam et. dolorem illo accusamus id hic eligendi non. velit asperiores est vero non eos ratione dignissimos.','1992-11-01 21:06:06')
;

update `messages`
set `created_at` = '2019-12-31 23:59:59'
where `id` = 99
;

-- удаляем все сообщения из будущего (в нашем случае - созданный выше)
delete from `messages`
where `created_at` > '2019-12-20 23:59:59'	
;