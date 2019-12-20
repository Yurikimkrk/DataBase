-- БД и рандомные данные (в profiles добавлено поле underage, по умолчанию false)

use vk;

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities` VALUES ('10','accusamus'),
('6','animi'),
('1','eaque'),
('2','explicabo'),
('8','porro'),
('7','quidem'),
('9','recusandae'),
('3','rerum'),
('4','temporibus'),
('5','ut'); 


DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friend_requests` VALUES ('1','2','requested','2015-12-02 19:57:34','1986-04-07 16:34:35'),
('2','4','requested','1998-01-03 10:57:06','2012-06-04 17:05:39'),
('3','6','approved','1998-07-17 21:02:14','2001-01-19 04:19:38'),
('1','4','requested','1986-04-25 10:17:27','1995-12-12 23:50:12'),
('5','12','requested','2000-10-29 13:35:49','1970-07-30 04:34:48'),
('14','6','declined','1980-11-04 09:51:48','2009-12-22 09:17:14'),
('7','17','declined','1976-11-05 18:34:17','1980-04-22 19:26:09'),
('10','8','requested','2003-10-10 03:04:08','2010-08-29 07:55:26'),
('16','9','approved','1993-04-04 06:53:03','1970-11-17 15:04:50'),
('10','17','requested','2010-08-14 21:18:45','1973-08-17 00:55:21'); 


DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` VALUES ('1','1','1','2005-08-20 19:57:24'),
('2','2','2','1977-05-18 21:16:57'),
('3','3','3','1996-06-27 16:50:26'),
('4','4','4','2018-04-20 11:01:54'),
('5','5','5','2010-09-29 23:38:33'),
('6','6','6','2015-08-24 17:52:42'),
('7','7','7','1976-02-13 15:06:24'),
('8','8','8','1985-06-03 14:40:25'),
('9','9','9','1979-07-06 17:29:13'),
('10','10','10','2010-07-19 08:39:32'),
('11','11','11','1979-02-27 12:55:00'),
('12','12','12','2003-12-15 15:08:10'),
('13','13','13','2013-10-18 15:23:05'),
('14','14','14','2001-02-03 02:57:12'),
('15','15','15','1983-03-21 03:49:18'),
('16','16','16','2019-06-08 15:26:49'),
('17','17','17','2001-09-20 13:19:22'),
('18','18','18','1977-06-01 19:32:21'),
('19','19','19','2012-01-01 20:04:49'),
('20','20','20','1972-03-28 20:29:57'),
('21','1','21','2011-01-20 14:47:33'),
('22','2','22','1971-12-15 15:17:19'),
('23','3','23','1974-08-15 02:27:44'),
('24','4','24','1985-06-05 16:07:26'),
('25','5','25','1975-11-26 00:40:09'),
('26','6','26','1994-06-25 12:41:59'),
('27','7','27','1992-11-01 21:55:19'),
('28','8','28','1984-08-12 01:14:06'),
('29','9','29','1977-11-16 07:48:55'),
('30','10','30','1986-01-27 08:45:06'),
('31','11','31','2008-01-08 09:05:22'),
('32','12','32','2000-03-06 15:02:41'),
('33','13','33','1973-12-28 15:20:28'),
('34','14','34','1984-02-21 10:41:24'),
('35','15','35','2001-12-05 22:41:20'),
('36','16','36','2014-04-07 16:09:14'),
('37','17','37','1989-12-04 21:01:23'),
('38','18','38','1970-04-08 23:56:48'),
('39','19','39','2000-08-13 14:48:43'),
('40','20','40','1970-09-16 13:26:44'),
('41','1','1','2014-03-10 05:44:20'),
('42','2','2','1976-11-02 21:24:36'),
('43','3','3','1999-10-20 06:12:33'),
('44','4','4','1973-03-30 10:40:21'),
('45','5','5','2011-11-19 14:02:32'),
('46','6','6','1981-02-21 14:21:30'),
('47','7','7','2015-08-28 02:02:09'),
('48','8','8','1983-11-18 03:34:34'),
('49','9','9','2010-07-10 07:51:57'),
('50','10','10','2004-01-04 12:27:56'); 


DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` VALUES ('1','1','1','Hic saepe quo laboriosam voluptatem neque maxime. Nisi reprehenderit qui maiores deserunt. Quis ut voluptas iste qui ea eveniet. Quia laudantium error voluptatem nobis esse. Eum eos natus temporibus reprehenderit odit ut beatae.','et','41',NULL,'2019-08-24 05:29:43','2007-09-07 22:27:22'),
('2','2','2','Eius tempore assumenda iure eos non sed nihil. Aliquid quas placeat ut magni esse. Veniam blanditiis debitis consequuntur a provident. Eos dicta provident aut blanditiis fugiat aut assumenda.','aut','94',NULL,'1977-09-16 12:36:42','1991-09-15 06:57:21'),
('3','3','3','Aut molestias facere expedita expedita nulla totam deleniti est. Adipisci ex pariatur fugiat aspernatur. Nulla enim quidem voluptatibus rerum expedita ex qui. Deserunt recusandae iure maiores at ipsa commodi libero.','ad','881',NULL,'2002-01-05 04:13:33','1990-04-08 13:35:53'),
('4','4','4','Et explicabo eum et et deserunt. Voluptas nihil rem nihil quia perspiciatis laboriosam. Placeat temporibus itaque dolorum ea. Eos odit consectetur quia a.','consequatur','20252',NULL,'1988-12-09 09:34:23','1982-09-22 05:22:17'),
('5','5','5','Porro et in aut eaque delectus rerum. Totam officia dolor modi ullam et. Unde ipsam aperiam doloribus beatae. Nihil eum nam eum.','rem','347',NULL,'1987-05-16 02:12:01','1987-11-01 21:29:56'),
('6','6','6','Qui in ut vel repudiandae eum. Ut quas distinctio quia iusto. Accusamus quaerat dolores rerum et ducimus.','molestiae','1',NULL,'1999-11-16 06:07:09','2018-12-25 14:59:56'),
('7','7','7','A sed quo rerum enim beatae a. Omnis est qui cupiditate assumenda ex. Et ut eos sit omnis qui cum. Beatae doloribus itaque aut quos voluptatem.','ut','136338675',NULL,'1998-09-18 02:43:47','1973-05-06 18:10:40'),
('8','8','8','Et repellat labore voluptatibus voluptatem et reiciendis odio. Libero repudiandae laboriosam autem nihil ut ea. Ut ad perspiciatis quasi aspernatur deleniti.','explicabo','37',NULL,'1978-05-17 07:04:34','2016-10-31 01:52:33'),
('9','9','9','Maxime sunt beatae doloribus provident quia enim. Et aut quo sunt et impedit nihil deserunt. Possimus itaque omnis at tempora. Pariatur ex sunt ducimus.','repellendus','52235911',NULL,'2011-03-16 17:23:41','2004-05-03 13:35:49'),
('10','10','10','Nihil modi maiores eos officia laudantium omnis. Enim dolore autem laboriosam commodi animi. Modi corporis aut at voluptatem praesentium totam enim non. Est qui quia eos illum eius.','nihil','7775',NULL,'1980-11-01 03:47:36','1982-01-22 21:32:26'),
('11','1','11','Quam dolore ex aut quia sed dolores. Dignissimos quo vero temporibus in pariatur. Quas ut ut quam qui magni quis. Aut perspiciatis non aut laboriosam vel.','qui','4247',NULL,'2003-06-22 15:35:12','1984-03-14 21:51:45'),
('12','2','12','Accusantium ex eum tenetur sit quod possimus ipsam. Sed consequuntur sed quas omnis illum repellat. Quaerat asperiores atque et numquam laboriosam temporibus expedita.','est','31',NULL,'1994-05-22 00:22:41','1985-12-07 10:42:07'),
('13','3','13','Qui consequatur perferendis et dolor quibusdam quas corporis non. Qui totam dolores rerum aut adipisci dolor quia. Nesciunt corrupti dolor illo amet voluptatibus dolorem.','id','858',NULL,'1996-06-30 21:06:26','2004-06-18 12:36:25'),
('14','4','14','Sit maiores quisquam voluptate repudiandae facilis. Odio aut occaecati fugiat saepe eum molestiae. Eos aut impedit rerum voluptatum vero. Et consequatur iste rerum sit.','error','99693944',NULL,'1988-07-14 12:04:37','1988-10-05 10:15:01'),
('15','5','15','Voluptas ea pariatur architecto reiciendis error illo corrupti. Corporis maxime provident provident nulla ea officia. Dolores pariatur deserunt accusamus dolore doloremque et assumenda aliquid. Molestiae sunt aspernatur perferendis aut. Qui sunt provident esse animi.','cupiditate','240308666',NULL,'2008-05-23 11:57:01','2003-12-17 00:57:40'),
('16','6','16','Quaerat animi maiores distinctio. Nulla neque nemo nihil quidem eos atque. Ut sed ducimus quia aut minima sint magnam. Fugiat nulla quod doloremque nihil et enim aut.','magni','977547380',NULL,'2000-03-04 09:03:50','1991-12-27 08:50:18'),
('17','7','17','Perspiciatis beatae sequi est ratione. Qui aut aliquam consequuntur corporis et voluptatibus consectetur. Nobis commodi debitis incidunt deserunt aliquam. Quam assumenda delectus placeat consequatur rerum eum et laboriosam.','voluptas','0',NULL,'1999-09-27 03:02:46','1996-09-14 16:57:43'),
('18','8','18','Qui aut aut ex quidem laborum tempore fugiat cum. Sint earum ipsam voluptatem. Voluptas enim sit in pariatur. Odio dolorem numquam rerum aspernatur libero voluptatem.','nulla','0',NULL,'2002-06-02 04:53:13','1977-06-06 23:35:30'),
('19','9','19','Dolores eveniet odio voluptatem qui rerum. Eius delectus quia distinctio fuga. Consequuntur totam atque ea aut id eius.','dolore','520',NULL,'2014-03-09 16:29:56','1977-02-27 13:06:28'),
('20','10','20','Debitis nostrum id iste iusto. Ut facilis earum fuga et est odit. Id molestias ut voluptas nesciunt sequi doloremque. Quia ut et aut rem culpa error consectetur accusantium. Et dolores ad hic sint eius blanditiis.','adipisci','173612127',NULL,'1998-12-26 10:45:15','1992-03-30 22:21:22'),
('21','1','1','Quas aperiam ea esse unde. Saepe qui non totam a quod qui. Est nemo esse repellat officiis voluptatem nihil quibusdam.','sint','412236',NULL,'1976-01-06 03:11:23','2019-08-03 18:00:17'),
('22','2','2','Saepe doloribus omnis accusantium hic id. Et voluptatem laudantium in et a. Quos adipisci perspiciatis impedit.','et','6086',NULL,'1992-05-10 08:51:09','1992-05-28 02:56:01'),
('23','3','3','Deleniti molestias incidunt sit hic sed aut. Sit eveniet quos est ea. Est placeat dignissimos omnis dolorem. Facere ea ipsa illum minima aliquid ut. Eius natus et necessitatibus et et quaerat.','sunt','2',NULL,'1988-12-19 00:43:34','2012-11-17 21:26:06'),
('24','4','4','Aut veritatis corrupti et et aut aut veritatis. Vitae accusamus quo molestiae quod commodi rerum. Et autem quod molestias minima. Optio nam doloribus ea tenetur. Ipsa consequatur explicabo magni omnis eligendi.','incidunt','2551',NULL,'2000-06-26 05:29:45','2002-03-12 12:16:48'),
('25','5','5','Maxime iste sint quis velit dolorem velit hic. Dolores harum labore sunt aperiam id voluptate.','quia','26868435',NULL,'1982-05-11 09:39:22','2012-06-04 19:06:10'),
('26','6','6','Explicabo nulla quia non corrupti est totam ut. Consequatur ad eum quibusdam nihil tempora veniam. Quia illo mollitia debitis voluptatem labore qui voluptates maiores. Est recusandae sint iure est autem autem.','eveniet','874',NULL,'1978-08-06 05:32:49','2006-01-31 03:29:45'),
('27','7','7','Ut dignissimos facere doloremque dolore deleniti ea. Tenetur eum non necessitatibus cum eligendi. Culpa deleniti adipisci dolor et aspernatur aut quasi. Porro eligendi explicabo inventore voluptatem dolorem dolorem eos totam.','est','0',NULL,'2008-11-16 08:23:48','1973-01-15 11:54:19'),
('28','8','8','Alias aut ea aut error. Unde nostrum vero reprehenderit voluptate magni. Atque quia non et unde repellat voluptatem.','corporis','76843956',NULL,'2005-01-16 22:52:20','2008-05-01 03:32:39'),
('29','9','9','Quia perferendis consectetur ipsum omnis. Et sit iste dolores fugit eligendi perspiciatis. Aut voluptatum placeat veniam itaque. Unde dolore ipsum odio autem numquam sit possimus ipsam.','soluta','502',NULL,'2014-01-23 18:34:40','2012-02-15 16:42:56'),
('30','10','10','Quod praesentium minima at molestias necessitatibus temporibus. Quia impedit vel error voluptatibus sit sunt. Reiciendis animi voluptas eaque aut quaerat sunt ducimus. Aut cumque voluptatem ipsa est. Reiciendis nihil qui ipsum fuga molestias.','inventore','44',NULL,'2004-05-15 02:34:45','1989-11-28 03:42:07'),
('31','1','11','Cupiditate qui vitae accusamus esse. Consequatur sed rerum id voluptas autem nihil rerum. Tenetur vero dolorum cumque quasi facilis earum ipsa. Quo aliquid nobis repellat exercitationem.','qui','385351',NULL,'1989-01-17 06:43:36','2013-05-10 19:21:06'),
('32','2','12','Eaque velit aliquam repellat eum dolor ducimus ea sed. Dolores enim quod et dolores sit. Laborum in consectetur molestiae similique dicta. Blanditiis id deserunt quos adipisci et.','ex','4257702',NULL,'1983-08-10 19:58:02','1992-10-16 15:02:29'),
('33','3','13','Non repellendus explicabo rem illo. Vitae voluptatem harum placeat sit tempora et. Quis ea accusamus quae temporibus. Quia delectus aut facere qui voluptas recusandae.','tempore','341505951',NULL,'2002-03-14 00:49:27','1974-05-04 21:36:34'),
('34','4','14','Ipsa facilis voluptatibus perferendis doloremque voluptatem corporis. Nisi eligendi accusantium nihil ratione molestias consequuntur. Omnis quia blanditiis ratione sit officia. Est voluptas et repudiandae tempora voluptatem.','velit','13685',NULL,'1971-06-12 10:35:57','2019-11-04 05:21:39'),
('35','5','15','Voluptatem animi non quos officia et magni in. Sunt explicabo sint similique itaque et. Voluptate et vel accusantium in provident. Culpa placeat dolorum sit qui eos.','voluptatibus','0',NULL,'2019-06-20 04:02:27','1990-12-03 11:17:09'),
('36','6','16','Optio consequatur quo explicabo. Ducimus voluptatem omnis voluptas qui assumenda. Numquam aut deleniti voluptatem ad. Error eligendi vitae et.','cumque','944900',NULL,'1980-08-19 09:43:45','2012-09-03 03:53:22'),
('37','7','17','Suscipit eveniet deleniti sed ea qui. Et excepturi eligendi sit qui culpa quibusdam sequi eveniet. Fuga neque tenetur asperiores.','laborum','0',NULL,'2018-11-24 12:23:32','1972-08-31 17:41:08'),
('38','8','18','Rerum aperiam et ipsam et similique est aspernatur. Quam dicta qui delectus nihil non voluptas. Hic dolorem quia ut aliquid distinctio. Qui possimus et et.','non','49719',NULL,'2002-01-02 14:26:55','2017-04-06 18:14:28'),
('39','9','19','Tempora et et rem velit et. Alias voluptas laboriosam eum omnis est ipsa et molestias. Enim maxime eum esse nam ut.','aut','371659852',NULL,'1989-01-27 11:38:03','1975-03-01 01:50:47'),
('40','10','20','Atque accusantium est minus autem repellendus exercitationem totam. Ut aut ab id tenetur ut doloribus. Veniam sint sint non perferendis sed. Beatae temporibus dolorum quisquam possimus earum repellendus architecto et.','eum','1',NULL,'1972-08-22 10:57:22','1983-07-07 13:17:54'); 


DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` VALUES ('1','est','1979-02-12 00:49:50','2011-04-22 23:36:34'),
('2','qui','1998-02-01 14:06:02','1984-04-02 18:00:18'),
('3','blanditiis','1990-01-05 13:09:26','2010-07-19 20:15:24'),
('4','hic','2016-10-23 21:22:50','2003-10-16 17:24:37'),
('5','repellat','2010-11-14 22:13:30','1989-12-08 01:22:02'),
('6','sint','1976-12-29 09:51:01','1971-05-27 14:43:38'),
('7','inventore','1992-12-08 02:37:14','1996-08-20 03:27:17'),
('8','quo','1996-11-18 21:20:39','2009-08-09 18:51:04'),
('9','delectus','1986-11-26 15:03:36','2019-12-04 04:42:23'),
('10','aperiam','1989-04-22 01:45:27','1985-03-10 07:30:17'); 


DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `messages` VALUES ('1','1','5','Nihil non itaque minus reprehenderit velit. Sit ea odit sed qui sit itaque qui. Sint non laborum delectus veniam enim sunt a. Illum inventore repudiandae excepturi perferendis dolorum voluptatem.','1973-05-13 03:39:36'),
('2','12','2','Rerum rem est quo sint voluptas. Voluptatem laboriosam ea eos rerum eaque doloremque eius. Ut necessitatibus exercitationem dolor architecto quibusdam et. Dolorem illo accusamus id hic eligendi non. Velit asperiores est vero non eos ratione dignissimos.','1992-11-01 21:06:06'),
('3','3','5','Enim omnis temporibus voluptatem. Sint velit exercitationem deserunt ut quia voluptas. Vitae vel doloribus est inventore est similique odit.','1991-07-27 09:37:12'),
('4','10','4','Voluptas in id id sunt. Quis hic eos aut ut est eos. Incidunt est debitis molestiae et sed.','1978-08-02 11:56:07'),
('5','5','8','Error quam nobis necessitatibus incidunt. Quo iure aut dolores doloremque enim harum non deserunt. Asperiores nisi facere quia et est officiis eos.','2002-09-20 11:16:47'),
('6','14','6','Voluptatum autem ut dolores deleniti est necessitatibus. Qui non voluptatem magnam consequatur molestiae. In aspernatur error dolores nobis qui architecto quia. Dolorem facere vel sunt sed.','2007-04-27 00:21:29'),
('7','7','3','Totam et et ratione adipisci non exercitationem eligendi aut. Suscipit quam fugiat consequatur enim deserunt earum cupiditate. Est quaerat commodi laudantium qui ipsa qui placeat. Veritatis quia id voluptas.','1990-11-01 00:12:07'),
('8','1','8','Consequuntur quibusdam eos consequatur. Reiciendis et et eum incidunt vel rem tempore. Eligendi porro velit ratione.','2003-01-30 02:50:50'),
('9','9','12','Et optio rerum doloremque non repellendus. Dolores ducimus debitis quisquam nihil. Libero omnis est et et.','2011-02-27 06:18:24'),
('10','12','10','Quo mollitia quae sunt vel totam laborum modi. Reiciendis eum voluptates quos architecto soluta cum voluptatem magnam. Eligendi sint sint consectetur. Ipsum sequi non doloribus iure.','1972-06-02 23:11:08'),
('11','5','11','Modi laudantium voluptatem magni omnis optio aliquid. Et fugit quo delectus nostrum fugit voluptas natus. Officia commodi deserunt et molestiae cumque. Recusandae voluptatem repellat aspernatur eum nesciunt quia.','2003-05-27 10:19:27'),
('12','1','12','Cumque consectetur doloremque cupiditate eum quas ut. Laudantium nostrum labore et enim numquam corporis. Natus alias qui atque animi. Eos tempora doloremque quis enim officiis vitae.','2000-08-14 14:16:43'),
('13','13','3','Pariatur sapiente maxime nemo perferendis. Similique expedita voluptatem vitae tenetur qui et exercitationem aliquid. Commodi sequi hic corrupti maxime saepe sunt id.','2008-03-28 06:06:19'),
('14','14','19','Quidem et veritatis recusandae. Dolor earum ab totam non. Rerum ipsa veniam veritatis sint perspiciatis. Quia dolorem laborum officia.','2007-10-18 21:33:54'),
('15','15','7','Nulla omnis quis recusandae rerum. Officiis sed ex temporibus sequi reiciendis veniam. Animi non dolorum aliquid laudantium enim ipsum laborum.','1998-06-20 06:13:21'); 


DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photo_albums` VALUES ('1','dolores','1'),
('2','voluptas','2'),
('3','voluptatem','3'),
('4','repellendus','4'),
('5','voluptatem','5'),
('6','soluta','6'),
('7','rerum','7'),
('8','tempora','8'),
('9','eos','9'),
('10','nihil','10'),
('11','explicabo','11'),
('12','hic','12'),
('13','quidem','13'),
('14','est','14'),
('15','illum','15'),
('16','velit','16'),
('17','et','17'),
('18','deleniti','18'),
('19','eum','19'),
('20','cum','20'); 


DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photos` VALUES ('1','1','1'),
('2','2','2'),
('3','3','3'),
('4','4','4'),
('5','5','5'),
('6','6','6'),
('7','7','7'),
('8','8','8'),
('9','9','9'),
('10','10','10'),
('11','11','11'),
('12','12','12'),
('13','13','13'),
('14','14','14'),
('15','15','15'),
('16','16','16'),
('17','17','17'),
('18','18','18'),
('19','19','19'),
('20','20','20'); 


DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `underage` enum('false','true') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'false',
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` VALUES ('1',NULL,'2017-04-30','1',NULL,'false','2014-08-27 04:51:34'),
('2',NULL,'1973-12-26','2',NULL,'false','2010-11-13 19:16:33'),
('3',NULL,'1996-06-17','3',NULL,'false','1977-06-23 01:09:01'),
('4',NULL,'2015-02-20','4',NULL,'false','1976-08-07 22:14:41'),
('5',NULL,'1982-03-28','5',NULL,'false','1982-06-21 12:45:14'),
('6',NULL,'1985-04-16','6',NULL,'false','1996-11-29 21:15:42'),
('7',NULL,'2019-11-25','7',NULL,'false','1999-09-24 14:34:47'),
('8',NULL,'1993-07-02','8',NULL,'false','2010-02-11 09:54:56'),
('9',NULL,'2014-08-25','9',NULL,'false','1986-04-12 18:03:21'),
('10',NULL,'1972-12-02','10',NULL,'false','2012-06-13 06:04:37'),
('11',NULL,'1979-08-08','11',NULL,'false','2005-08-21 22:07:39'),
('12',NULL,'2004-02-17','12',NULL,'false','1976-01-11 19:57:15'),
('13',NULL,'1988-10-07','13',NULL,'false','1975-12-05 22:29:08'),
('14',NULL,'1972-01-28','14',NULL,'false','1993-10-23 21:16:05'),
('15',NULL,'1989-06-13','15',NULL,'false','2003-12-29 12:35:38'),
('16',NULL,'1993-03-22','16',NULL,'false','2018-05-19 09:13:59'),
('17',NULL,'1984-10-22','17',NULL,'false','1980-07-13 09:36:36'),
('18',NULL,'2007-07-11','18',NULL,'false','2004-05-27 05:24:12'),
('19',NULL,'1995-08-17','19',NULL,'false','2007-08-07 13:53:22'),
('20',NULL,'2017-12-29','20',NULL,'false','1982-09-30 15:57:14'); 


DROP TABLE IF EXISTS `user_settings`;
CREATE TABLE `user_settings` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `color_theme` enum('white','black','gray') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'white',
  `privacy` enum('invisible','limited','open') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user_settings` VALUES ('1','white','limited'),
('2','white','limited'),
('3','white','invisible'),
('4','black','invisible'),
('5','black','invisible'),
('6','white','invisible'),
('7','gray','limited'),
('8','black','invisible'),
('9','gray','invisible'),
('10','black','open'),
('11','white','limited'),
('12','black','open'),
('13','gray','invisible'),
('14','black','invisible'),
('15','black','open'),
('16','gray','open'),
('17','white','open'),
('18','black','limited'),
('19','gray','open'),
('20','black','limited'); 


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `phone` (`phone`),
  KEY `firstname` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` VALUES ('1','Malika','Blick','jake62@example.com','c67c5a4a07ab24f605909ada5657d9ef668a0eab','1-783-045-06'),
('2','Leonor','Collins','jannie.hackett@example.com','a2c66df23c8152b8659bec4a4bf54ba049bda74c','411-664-5415'),
('3','Alford','Macejkovic','shyanne.wolf@example.com','db45d11c346a10897250eaf90e1fb40d946c803f','1-481-993-95'),
('4','Dameon','Daniel','beryl95@example.com','5c975a08c6134f83fa38162a0dfe6ba81fee129c','08023377500'),
('5','Naomie','Barrows','rcrona@example.com','9476409909a91287cc81743e09b73e48e57d9661','+43(7)612419'),
('6','Jammie','Gusikowski','russel.jammie@example.org','54d92671cd47373eb965ae88e2903f6dfe5d01ca','+19(2)538483'),
('7','Ezequiel','Little','cleveland86@example.com','a900276d18e2a373259443951a3ade8cd8d289f6','(180)065-355'),
('8','Kenya','Mante','delbert.veum@example.org','2336156af1fc1a878f18fedded531e6603bb6d37','1-569-198-45'),
('9','Jalon','Toy','hildegard.runolfsson@example.com','d45faf7f36718ec188ecc2debd6d78f56ac73c91','1-671-806-44'),
('10','Hans','Ryan','danial.langworth@example.com','10d6f954fc8fdd575375c5e87190052603f62229','1-911-347-36'),
('11','Darby','Bartell','rohan.hudson@example.com','3799776f30f0f27ca7ffb800393621d3f1466a57','874-876-7409'),
('12','Brad','Bartoletti','qjacobi@example.com','a77ccbf0f1121e95a7ee74dd24837003f7bf8210','937-010-9255'),
('13','Thea','Kihn','casandra80@example.net','af80157e0704ab41fb5c45e242c8a7db7a089417','686-918-3990'),
('14','Ivah','Tromp','towne.sabryna@example.net','8699486ca50dd35f4e8b8ddb31dcb7850fdbd915','1-735-088-16'),
('15','Judd','Kohler','fadel.cesar@example.com','daadb8fd88eb76f8d0de8dd28c7a42d4678526c7','1-574-356-72'),
('16','Natalia','Tillman','qlemke@example.com','ac988e4ace04c065f45664710944b50a5382d32f','687.098.1954'),
('17','Leon','Emmerich','grayce.von@example.net','05f57f2c683c091ac3127a2496423248a2f683fd','1-427-822-76'),
('18','Marcelle','Block','letha36@example.com','64a5c2c4f057a2ca0573a14ce1f52accda5676e6','+49(1)554232'),
('19','Elijah','Hoppe','moore.dejuan@example.org','0386a3a69fc00fea2fef501960e92222b669265e','206.284.7454'),
('20','Modesto','Mueller','lois76@example.net','1b62ed7647763cb92716ca6732280f090d90f15c','(569)083-819'); 


DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_communities` VALUES ('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','1'),
('12','2'),
('13','3'),
('14','4'),
('15','5'),
('16','6'),
('17','7'),
('18','8'),
('19','9'),
('20','10'); 


DROP TABLE IF EXISTS `video_library`;
CREATE TABLE `video_library` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `video_library_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `video_library` VALUES ('1','aliquam','1'),
('2','voluptates','2'),
('3','consequatur','3'),
('4','delectus','4'),
('5','quaerat','5'),
('6','sit','6'),
('7','perferendis','7'),
('8','sunt','8'),
('9','sit','9'),
('10','exercitationem','10'); 


DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `library_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `library_id` (`library_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`library_id`) REFERENCES `video_library` (`id`),
  CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `videos` VALUES ('1','1','1'),
('2','2','2'),
('3','3','3'),
('4','4','4'),
('5','5','5'),
('6','6','6'),
('7','7','7'),
('8','8','8'),
('9','9','9'),
('10','10','10'),
('11','1','11'),
('12','2','12'),
('13','3','13'),
('14','4','14'),
('15','5','15'),
('16','6','16'),
('17','7','17'),
('18','8','18'),
('19','9','19'),
('20','10','20'),
('21','1','21'),
('22','2','22'),
('23','3','23'),
('24','4','24'),
('25','5','25'),
('26','6','26'),
('27','7','27'),
('28','8','28'),
('29','9','29'),
('30','10','30'),
('31','1','31'),
('32','2','32'),
('33','3','33'),
('34','4','34'),
('35','5','35'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

