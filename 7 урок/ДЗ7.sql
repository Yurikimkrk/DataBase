use shop;


-- Cписок пользователей, сделавших хотя бы 1 заказ orders в нашем магазине
select name from users where id in (select user_id from orders);

-- Список товаров products и разделов catalogs, который соответствует товару
select name, (select name from catalogs where catalog_id = id) as `catalogs`
from products;