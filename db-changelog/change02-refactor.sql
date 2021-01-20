

-- rename table
rename table review to course_review;
alter table course_chapter add num_lecture int null;
-- insert mock data
INSERT INTO `online-academy-db`.course_review (user_id, course_id, content, rating, created_date, updated_date) VALUES (1, 1, 'It''s good. I have learning many thing from this course', 5, '2020-12-11 23:27:40', '2020-12-11 23:27:45');
INSERT INTO `online-academy-db`.course_review (user_id, course_id, content, rating, created_date, updated_date) VALUES (2, 1, 'it''s bad, you guy speak so bad, it''s har to listen', 3, '2020-12-11 23:28:27', '2020-12-11 23:28:32');
INSERT INTO `online-academy-db`.course_review (user_id, course_id, content, rating, created_date, updated_date) VALUES (3, 1, 'pretty good, but you need enhance it a little bit', null, '2020-12-11 23:29:01', '2020-12-11 23:29:04');