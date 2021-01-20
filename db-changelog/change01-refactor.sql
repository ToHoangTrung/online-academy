-- write change to database here if any
-- for each change create new file with the increment order number
alter table user modify password varchar(255) null;
alter table course change author_id instructor_id int not null;
rename table  section to course_chapter;
rename table item to course_chapter_section;
alter table course_chapter_section change section_id chapter_id int not null;
alter table course_chapter_section modify can_be_preview tinyint null;
alter table course_chapter_section add created_date datetime default now() null;
alter table course_chapter_section add updated_date datetime default now() null;
