/*update adcancement data and insert new row*/
update `online-academy-db`.advancement set description = "New" where id = 4;
insert into `online-academy-db`.advancement(id, description. created_date, updated_date) values(5, "Best Choice", now(),now());
/*update advancement id in course table*/
update `online-academy-db`.course set advancement_id = 1 where id % 3 = 0 and id >= 1;
update `online-academy-db`.course set advancement_id = 2 where id % 4 = 0 and id >= 1;
update `online-academy-db`.course set advancement_id = 3 where id % 5 = 0 and id >= 1;
update `online-academy-db`.course set advancement_id = 4 where id % 7 = 0 and id >= 1;
update `online-academy-db`.course set advancement_id = 5 where id % 8 = 0 and id >= 1;
/*fix course image link*/
update `online-academy-db`.course set image = 'assets/images/products/iOS-11-&-Swift-4-From-Beginner-to-Paid-Professiona.jpg' where id = 57;
/*change name category and subcategory*/
update `online-academy-db`.category set name = "Database Development" where id = 6;
update `online-academy-db`.sub_category set name = "Selenium Testing" where id = 48;
update `online-academy-db`.sub_category set name = "Certified Kubernetes" where id = 55;
update `online-academy-db`.sub_category set name = "Aws Certified Solutions" where id = 64;