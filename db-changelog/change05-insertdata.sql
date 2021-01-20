ALTER TABLE `online-academy-db`.`course_chapter` 
CHANGE COLUMN `title` `title` VARCHAR(255) NULL DEFAULT NULL ;

INSERT INTO `online-academy-db`.`course_chapter` (`id`, `title`, `course_id`) VALUES ('1', 'Beginner', '1');
INSERT INTO `online-academy-db`.`course_chapter` (`id`, `title`, `course_id`) VALUES ('2', 'Intermediate', '1');
INSERT INTO `online-academy-db`.`course_chapter` (`id`, `title`, `course_id`) VALUES ('3', 'Advanced', '1');


ALTER TABLE `online-academy-db`.`course_chapter_section` 
ADD COLUMN `url_video` VARCHAR(255) NULL AFTER `updated_date`;

INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('1', ' Introduction and Resources', '2', '0', '1', 'assets/video/introduction-and-resources.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('2', 'Create and Style the Home Page', '15', '0', '1', 'assets/video/create-and-style-the-home-page.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('3', 'Create and Style the Game Page', '7', '0', '1', 'assets/video/display-hard-coded-questions-and-answers.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('4', 'Display Hard Coded Questions and Answers', '18', '0', '1', 'assets/video/display-hard-coded-questions-and-answers (2).mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('5', 'Display Feedback for Correct/Incorrect', '8', '0', '2', 'assets/video/create-and-style-the-home-page2.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('6', 'Create Heads Up Display (HUD)', '8', '0', '2', 'assets/video/create-head-up -display-(hud).mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('7', 'Create a Progress Bar', '9', '0', '2', 'assets/video/create-a-progress-bar.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('8', 'Create and Style the End Page', '13', '0', '2', 'assets/video/create-and-style-the-end-page.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('9', 'Save High Scores in Local Storage', '11', '0', '3', 'assets/video/save-high-scores-in-local-storage.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('10', 'Load and Display High Scores from Local', '9', '0', '3', 'assets/video/load-and-display-high-scores-from-local-storage.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('11', 'Fetch API to Load Questions from Local', '9', '0', '3', 'assets/video/fetch-api-to-load-questions-from-local-json-file.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('12', 'Fetch API to Load Questions from Open', '6', '0', '3', 'assets/video/fetch-api-to-load-questions-from-open-trivia-db-api.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('13', 'Create a Spinning Loader', '7', '0', '3', 'assets/video/create-a-spinning-loader-.mp4');
INSERT INTO `online-academy-db`.`course_chapter_section` (`id`, `title`, `length`, `can_be_preview`, `chapter_id`, `url_video`) VALUES ('14', 'Closing', '1', '0', '3', 'assets/video/closing.mp4');

INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('1', '11', '1');
INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('2', '12', '1');
INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('3', '13', '1');

UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/introduction-and-resources.mp4' WHERE (`id` = '1');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/create-and-style-the-home-page.mp4' WHERE (`id` = '2');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/display-hard-coded-questions-and-answers.mp4' WHERE (`id` = '3');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/display-hard-coded-questions-and-answers (2).mp4' WHERE (`id` = '4');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/create-and-style-the-home-page2.mp4' WHERE (`id` = '5');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/create-head-up -display-(hud).mp4' WHERE (`id` = '6');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/create-a-progress-bar.mp4' WHERE (`id` = '7');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/create-and-style-the-end-page.mp4' WHERE (`id` = '8');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/save-high-scores-in-local-storage.mp4' WHERE (`id` = '9');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/load-and-display-high-scores-from-local-storage.mp4' WHERE (`id` = '10');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/fetch-api-to-load-questions-from-local-json-file.mp4' WHERE (`id` = '11');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/fetch-api-to-load-questions-from-open-trivia-db-api.mp4' WHERE (`id` = '12');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/create-a-spinning-loader-.mp4' WHERE (`id` = '13');
UPDATE `online-academy-db`.`course_chapter_section` SET `url_video` = 'assets/video/courses/closing.mp4' WHERE (`id` = '14');

ALTER TABLE `online-academy-db`.`requiment` 
CHANGE COLUMN `description` `description` VARCHAR(255) NULL DEFAULT NULL ;

INSERT INTO `online-academy-db`.`requiment` (`id`, `description`, `course_id`) VALUES ('1', 'No coding experience is necessary to take this course! I take you from beginner to expert!', '1');
INSERT INTO `online-academy-db`.`requiment` (`id`, `description`, `course_id`) VALUES ('2', 'Any computer and OS will work — Windows, macOS or Linux. We will set up your text editor the course.', '1');
INSERT INTO `online-academy-db`.`requiment` (`id`, `description`, `course_id`) VALUES ('3', 'A basic understanding of HTML and CSS is a plus, but not a must! The course includes an HTML and CSS crash course.', '1');

INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('4', '11', '2');
INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('5', '12', '3');
INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('6', '13', '4');
INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('7', '11', '5');
INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('8', '12', '6');
INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('9', '13', '7');
INSERT INTO `online-academy-db`.`user_course` (`id`, `user_id`, `course_id`) VALUES ('10', '11', '8');

ALTER TABLE `online-academy-db`.`payment_type` 
CHANGE COLUMN `type` `type` VARCHAR(255) NULL DEFAULT NULL ;

INSERT INTO `online-academy-db`.`payment_type` (`id`, `type`) VALUES ('1', 'Thanh toán bằng thẻ ATM. Internet Banking');
INSERT INTO `online-academy-db`.`payment_type` (`id`, `type`) VALUES ('2', 'Thanh toán bằng thẻ quốc tế');
INSERT INTO `online-academy-db`.`payment_type` (`id`, `type`) VALUES ('3', 'Thanh toán bằng ví điện tử MoMo');
INSERT INTO `online-academy-db`.`payment_type` (`id`, `type`) VALUES ('4', 'Thanh toán bằng cổng ViettelPay');
INSERT INTO `online-academy-db`.`payment_type` (`id`, `type`) VALUES ('5', 'Thanh toán bằng cổng VnPay');
INSERT INTO `online-academy-db`.`payment_type` (`id`, `type`) VALUES ('6', 'Thanh toán bằng cổng AirPay');
INSERT INTO `online-academy-db`.`payment_type` (`id`, `type`) VALUES ('7', 'Chuyển khoản ngân hàng');
INSERT INTO `online-academy-db`.`payment_type` (`id`, `type`) VALUES ('8', 'Chưa xét');


INSERT INTO `online-academy-db`.`invoice_status` (`id`, `status`) VALUES ('1', 'Chưa thanh toán');
INSERT INTO `online-academy-db`.`invoice_status` (`id`, `status`) VALUES ('2', 'Đang thanh toán');
INSERT INTO `online-academy-db`.`invoice_status` (`id`, `status`) VALUES ('3', 'Đã thanh toán');
INSERT INTO `online-academy-db`.`invoice_status` (`id`, `status`) VALUES ('4', 'Yêu cầu hoàn tiền');
INSERT INTO `online-academy-db`.`invoice_status` (`id`, `status`) VALUES ('5', 'Đã hoàn tiền');
INSERT INTO `online-academy-db`.`invoice_status` (`id`, `status`) VALUES ('6', 'Yêu cầu hủy');
INSERT INTO `online-academy-db`.`invoice_status` (`id`, `status`) VALUES ('7', 'Đã hủy');


INSERT INTO `online-academy-db`.`coupon` (`id`, `name`, `percent_discount`, `amount_discount`) VALUES ('1', 'Ưu đãi thanh toán online 10%', '10', '0');
INSERT INTO `online-academy-db`.`coupon` (`id`, `name`, `percent_discount`, `amount_discount`) VALUES ('2', 'Ưu đãi tết nguyên đán 30%', '30', '0');
INSERT INTO `online-academy-db`.`coupon` (`id`, `name`, `percent_discount`, `amount_discount`) VALUES ('3', 'Không có ưu đãi', '0', '0');



INSERT INTO `online-academy-db`.`invoice` (`id`, `total_price`, `invoice_status_id`, `user_id`, `payment_type_id`, `coupon_id`) VALUES ('1', '39.99', '1', '11', '8', '1');
INSERT INTO `online-academy-db`.`invoice` (`id`, `total_price`, `invoice_status_id`, `user_id`, `payment_type_id`, `coupon_id`) VALUES ('2', '29.99', '1', '12', '8', '1');
INSERT INTO `online-academy-db`.`invoice` (`id`, `total_price`, `invoice_status_id`, `user_id`, `payment_type_id`, `coupon_id`) VALUES ('3', '49.99', '1', '13', '8', '1');

INSERT INTO `online-academy-db`.`invoice_course` (`id`, `invoice_id`, `course_id`) VALUES ('1', '1', '11');
INSERT INTO `online-academy-db`.`invoice_course` (`id`, `invoice_id`, `course_id`) VALUES ('2', '1', '12');
INSERT INTO `online-academy-db`.`invoice_course` (`id`, `invoice_id`, `course_id`) VALUES ('3', '1', '13');
INSERT INTO `online-academy-db`.`invoice_course` (`id`, `invoice_id`, `course_id`) VALUES ('4', '2', '14');
INSERT INTO `online-academy-db`.`invoice_course` (`id`, `invoice_id`, `course_id`) VALUES ('5', '2', '15');
INSERT INTO `online-academy-db`.`invoice_course` (`id`, `invoice_id`, `course_id`) VALUES ('6', '2', '16');
INSERT INTO `online-academy-db`.`invoice_course` (`id`, `invoice_id`, `course_id`) VALUES ('7', '3', '17');
INSERT INTO `online-academy-db`.`invoice_course` (`id`, `invoice_id`, `course_id`) VALUES ('8', '3', '18');
INSERT INTO `online-academy-db`.`invoice_course` (`id`, `invoice_id`, `course_id`) VALUES ('9', '3', '19');

ALTER TABLE `online-academy-db`.`coupon` 
ADD COLUMN `code` VARCHAR(45) NULL AFTER `updated_date`;

UPDATE `online-academy-db`.`coupon` SET `code` = 'ONLINE10' WHERE (`id` = '1');
UPDATE `online-academy-db`.`coupon` SET `name` = 'Ưu đãi tết nguyên đán 50k đồng', `percent_discount` = '0', `amount_discount` = '50000', `code` = 'TET30' WHERE (`id` = '2');
UPDATE `online-academy-db`.`coupon` SET `name` = 'Giảm 30k khi mua từ 2 khóa', `amount_discount` = '30000', `code` = '2COURSE30' WHERE (`id` = '3');
INSERT INTO `online-academy-db`.`coupon` (`id`, `name`, `percent_discount`, `amount_discount`, `code`) VALUES ('4', 'Không có ưu đãi', '0', '0', 'NONESALE');

UPDATE `online-academy-db`.`coupon` SET `end_date` = '2021-01-30' WHERE (`id` = '4');
UPDATE `online-academy-db`.`coupon` SET `end_date` = '2021-01-30' WHERE (`id` = '3');
UPDATE `online-academy-db`.`coupon` SET `end_date` = '2021-01-30' WHERE (`id` = '2');
UPDATE `online-academy-db`.`coupon` SET `end_date` = '2021-01-30' WHERE (`id` = '1');

UPDATE `online-academy-db`.`coupon` SET `amount_discount` = '2' WHERE (`id` = '2');
UPDATE `online-academy-db`.`coupon` SET `amount_discount` = '2' WHERE (`id` = '3');

ALTER TABLE `online-academy-db`.`invoice` 
DROP COLUMN `paid_date`;


