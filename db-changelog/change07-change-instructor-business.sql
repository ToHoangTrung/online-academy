alter table course alter column concurrency set default 'USD';
alter table course alter column rating set default 0;
alter table course alter column num_review set default 0;
alter table course alter column num_student_enroll set default 0;
alter table course add status int default 0 null;
alter table course_chapter_section change chapter_id course_chapter_id int not null;
alter table course add description nvarchar(1000) null default '';
alter table course alter column num_lecture set default 0;
alter table course alter column estimate_content_length set default 0;
alter table course add description nvarchar(1000) default '' null;

