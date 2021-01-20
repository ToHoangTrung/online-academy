UPDATE `online-academy-db`.`sub_category` SET `name` = 'Nodejs' WHERE (`id` = '6');
ALTER TABLE `online-academy-db`.`category` 
ADD COLUMN `image` VARCHAR(255) NULL AFTER `logo`;

UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/web-development.jpg' WHERE (`id` = '1');
UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/data-science.jpg' WHERE (`id` = '2');
UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/mobile-development.jpg' WHERE (`id` = '3');
UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/game-development-languages.jpg' WHERE (`id` = '4');
UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/programming-languages.jpg' WHERE (`id` = '5');
UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/software-testing.jpg' WHERE (`id` = '7');
UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/software-engineering.jpg' WHERE (`id` = '8');
UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/database-development.jpg' WHERE (`id` = '6');
UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/development-tools.jpg' WHERE (`id` = '9');
UPDATE `online-academy-db`.`category` SET `image` = 'assets/images/categories/no-code-development.jpg' WHERE (`id` = '10');

UPDATE `online-academy-db`.`user` SET `first_name` = 'Master', `last_name` = 'Trần', `image` = 'assets/images/users/Master-Tran.jpg', `job` = 'Founder of Acamotion' WHERE (`id` = '4');
UPDATE `online-academy-db`.`user` SET `first_name` = 'Nguyễn', `last_name` = 'Hiếu', `image` = 'assets/images/users/nguyen-hieu.jpg', `job` = 'VietNam Yoga Ambassdor - CEO Zenlife Yoga' WHERE (`id` = '5');
UPDATE `online-academy-db`.`user` SET `first_name` = 'Mai', `last_name` = 'Xuân Huy', `image` = 'assets/images/users/mai-xuan-huy.jpg', `job` = 'Photoshop Instructor' WHERE (`id` = '6');
UPDATE `online-academy-db`.`user` SET `first_name` = 'Đặng', `last_name` = 'Trọng Khang', `image` = 'assets/images/users/dang-trong-khang.jpg', `job` = 'Causality Investing Speaker' WHERE (`id` = '7');
UPDATE `online-academy-db`.`user` SET `first_name` = 'Nguyễn ', `last_name` = 'Cảnh Tuấn', `image` = 'assets/images/users/nguyen-canh-tuan.jpg', `job` = 'English Instructor' WHERE (`id` = '8');
UPDATE `online-academy-db`.`user` SET `first_name` = 'Hà', `last_name` = 'Kế Tú', `image` = 'assets/images/users/ha-ke-tu.jpg', `job` = 'Guitar Instructor - Famous Youtuber - Vietnamese guitar community' WHERE (`id` = '9');
UPDATE `online-academy-db`.`user` SET `first_name` = 'Hồ', `last_name` = 'Ngọc Cương', `image` = 'assets/images/users/ho-ngoc-cuong.jpg', `job` = 'English Instructor' WHERE (`id` = '10');


