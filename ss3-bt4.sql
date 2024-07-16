use md3_ss02;
create table class(
  classId int auto_increment primary key,
  className varchar(100),
  startDate varchar(255),
  status bit
);

create table student (
  studentId int auto_increment primary key,
  studentName varchar(100),
  address varchar(255),
  phone varchar(11),
  class_id int,
  status bit,
   constraint fk_class foreign key (class_id) references class(classId)
);

create table subjects (
   subjectId int auto_increment primary key,
   subjectName varchar(100),
   credit int,
   status bit
);

create table mark (
   markId int auto_increment primary key,
   student_id int,
   subject_id int,
   mark double,
   examTime datetime,
   constraint fk_student foreign key (student_id) references student(studentId),
   constraint fk_sbjects foreign key (subject_id) references subjects(subjectId)
);

select * from class;
insert into class(className, startDate, status )value ('HN-JV231103','2023-11-03',1),
                                                      ('HN-JV231229','2023-12-29',1),
                                                      ('HN-JV230615','2023-06-15',1);
select classId,className,startDate, 
case status when 1 then 'true' when 0 then 'false' end as status from class;

select * from student;

insert into student(studentName, address, phone, class_id,status) 
value ('ho gia hung','ha noi','09876543',1,1),
	 ('pham vang giang','da nang','0987333',1,1),
     ('duong my huyen','japan','09876599',2,1),
     ('hoang minh hieu','nghe an','0987659966',2,1),
     ('nguyen vinh ','ha tinh','09876599',3,1),
     ('nam cao','ha noi','09876599',3,1);
     
select studentId,studentName,address,phone,class_id,
 case status when 1 then 'true' when 0 then 'false' end as status from student; 
 
delete from student where studentId = 5;
 
 select * from subjects;
 
 insert into subjects(subjectName,credit,status)value('toan',3,1),
                                                     ('van',3,1),
                                                     ('anh',2,1);
 
select subjectId,subjectName,credit,
 case status when 1 then 'true' when 0 then 'false' end as status from subjects; 
 
 select * from mark;
 insert into mark(student_id,subject_id,mark,examTime)
 value(1,1,7,'2024-05-12 07:00:00'),
      (1,1,7,'2024-03-15 07:00:00'),
      (2,2,8,'2024-05-15 08:00:00'),
      (2,3,9,'2024-03-08 09:00:00'),
      (3,3,10,'2024-02-11 10:00:00');
 -- Hiển thị tất cả lớp học được sắp xếp theo tên giảm dần 
 
 select * from class order by className desc;
 
 -- Hiển thị tất cả học sinh có address ở “Hà Nội” 
 
 select * from student where address like '%ha noi';
 
 -- Hiển thị tất cả học sinh thuộc lớp HN-JV231103
 
 select distinct * from student s inner join class c 
 on c.classId = s.class_id where c.className like '%HN-JV231103';
 -- Hiển thị tát cả các môn học có credit trên 2
 
 select * from subjects where credit = 2;
 
 -- Hiển thị tất cả học sinh có phone bắt đầu bằng số 09
 
 select * from student where phone like '09%';