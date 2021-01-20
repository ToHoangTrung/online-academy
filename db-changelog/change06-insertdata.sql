ALTER TABLE `online-academy-db`.`category` 
ADD COLUMN `status` INT NULL DEFAULT 1 AFTER `image`;

ALTER TABLE `online-academy-db`.`sub_category` 
ADD COLUMN `status` INT NULL DEFAULT 1 AFTER `updated_date`;

ALTER TABLE `online-academy-db`.`category_link` 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `online-academy-db`.`course` 
ADD INDEX `FK_category_link_idx` (`category_link_id` ASC) VISIBLE;
;
ALTER TABLE `online-academy-db`.`course` 
ADD CONSTRAINT `FK_category_link`
  FOREIGN KEY (`category_link_id`)
  REFERENCES `online-academy-db`.`category_link` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `online-academy-db`.`category_link` 
DROP FOREIGN KEY `FK_sub_category`;
ALTER TABLE `online-academy-db`.`category_link` 
DROP INDEX `FK_sub_category_idx` ;
;

ALTER TABLE `online-academy-db`.`sub_category` 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `online-academy-db`.`category_link` 
ADD INDEX `Fk_sub_category_idx` (`sub_category_id` ASC) VISIBLE;
;
ALTER TABLE `online-academy-db`.`category_link` 
ADD CONSTRAINT `Fk_sub_category`
  FOREIGN KEY (`sub_category_id`)
  REFERENCES `online-academy-db`.`sub_category` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  UPDATE `online-academy-db`.`user` SET `password` = '$2b$10$/JfF8kFpolRGZRlCtOxqnubIc4Do7Uoz8fksNmXGDdL8nkpb07fuy' WHERE (`id` = '1');
UPDATE `online-academy-db`.`user` SET `password` = '$2b$10$/JfF8kFpolRGZRlCtOxqnubIc4Do7Uoz8fksNmXGDdL8nkpb07fuy' WHERE (`id` = '2');
UPDATE `online-academy-db`.`user` SET `password` = '$2b$10$/JfF8kFpolRGZRlCtOxqnubIc4Do7Uoz8fksNmXGDdL8nkpb07fuy' WHERE (`id` = '3');

ALTER TABLE `online-academy-db`.`invoice` 
DROP FOREIGN KEY `FK_invoice_coupon`,
DROP FOREIGN KEY `FK_invoice_invoice_status`,
DROP FOREIGN KEY `FK_invoice_payment_type`;
ALTER TABLE `online-academy-db`.`invoice` 
CHANGE COLUMN `invoice_status_id` `invoice_status_id` INT NOT NULL DEFAULT 1 ,
CHANGE COLUMN `payment_type_id` `payment_type_id` INT NOT NULL DEFAULT 8 ,
CHANGE COLUMN `coupon_id` `coupon_id` INT NOT NULL DEFAULT 1 ;
ALTER TABLE `online-academy-db`.`invoice` 
ADD CONSTRAINT `FK_invoice_coupon`
  FOREIGN KEY (`coupon_id`)
  REFERENCES `online-academy-db`.`coupon` (`id`),
ADD CONSTRAINT `FK_invoice_invoice_status`
  FOREIGN KEY (`invoice_status_id`)
  REFERENCES `online-academy-db`.`invoice_status` (`id`),
ADD CONSTRAINT `FK_invoice_payment_type`
  FOREIGN KEY (`payment_type_id`)
  REFERENCES `online-academy-db`.`payment_type` (`id`);

ALTER TABLE `online-academy-db`.`course` 
CHANGE COLUMN `status` `status` INT NULL DEFAULT 1 ;

update `online-academy-db`.course set status = 1 where id >= 1

UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '1');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '2');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '3');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '4');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '5');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '6');
UPDATE `online-academy-db`.`user_course` SET `type` = '2' WHERE (`id` = '7');
UPDATE `online-academy-db`.`user_course` SET `type` = '2' WHERE (`id` = '8');
UPDATE `online-academy-db`.`user_course` SET `type` = '2' WHERE (`id` = '9');
UPDATE `online-academy-db`.`user_course` SET `type` = '2' WHERE (`id` = '10');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '11');
UPDATE `online-academy-db`.`user_course` SET `type` = '2' WHERE (`id` = '12');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '13');
UPDATE `online-academy-db`.`user_course` SET `type` = '2' WHERE (`id` = '21');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '22');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '23');
UPDATE `online-academy-db`.`user_course` SET `type` = '2' WHERE (`id` = '24');
UPDATE `online-academy-db`.`user_course` SET `type` = '1' WHERE (`id` = '25');
UPDATE `online-academy-db`.`user_course` SET `type` = '2' WHERE (`id` = '26');


ALTER TABLE `online-academy-db`.`user_course` 
ADD COLUMN `type` INT NULL AFTER `updated_date`;

ALTER TABLE `online-academy-db`.`user` 
ADD COLUMN `status` INT NULL AFTER `updated_date`;

UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '1');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '2');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '3');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '4');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '5');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '6');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '7');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '8');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '9');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '10');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '11');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '12');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '13');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '14');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '15');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '16');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '17');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '18');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '19');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '20');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '22');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '23');
UPDATE `online-academy-db`.`user` SET `status` = '1' WHERE (`id` = '24');





