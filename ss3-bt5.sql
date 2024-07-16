use md3_ss02;
create table accounts(
  id int auto_increment primary key,
  userName varchar(100),
  password varchar(255),
  address varchar(255),
  status bit
);

create table bill(
   id int auto_increment primary key,
   bill_type bit,
   acc_id int,
   created datetime,
   auth_date datetime,
   constraint fk_accounts foreign key (acc_id) references accounts(id)
);
create table product(
  id int auto_increment primary key,
  name varchar (255),
  created date,
  price double,
  stock int,
  status bit
  
);
create table bill_detail(
   id int auto_increment primary key,
   bill_id int,
   product_id int,
   quantity int,
   price double,
    constraint fk_bill foreign key (bill_id) references bill(id),
    constraint fk_product foreign key (product_id) references product(id)
);

select * from accounts;
insert into accounts(userName,password,address,status) 
value('hung','123456','ha noi',1),
     ('cuong','654321','japan',1),
     ('bach','060696','hai duong',1);
select id,userName,password,address, 
case status when 1 then 'true' when 0 then 'false' 
end as status from accounts;

select * from bill;

insert into bill(bill_type,acc_id,created,auth_date) 
value (0,1,'2024-02-11 07:00:00','2024-03-12 07:00:00'),
      (0,1,'2024-10-5 07:00:00','2024-10-10 08:00:00'),
      (1,2,'2024-05-15 07:00:00','2024-05-20 04:00:00'),
      (1,3,'2024-02-01 07:00:00','2024-02-12 06:00:00');
select id,
  case bill_type 
    when 1 then 'xuat' 
    when 0 then 'nhap' 
  end as bill_type,acc_id,created,auth_date from bill;

select * from product;
insert into product (name, created, price,stock,status) 
value ('quan dai','2024-02-11 07:00:00',1200,5,1),
      ('ao dai','2024-04-13 07:00:00',1500,8,1),
      ('mu coi','2024-05-11 07:00:00',1600,7,1);
      
select id, name, created, price,stock,
case status when 1 then 'true' when 0 then 'false' 
end as status from product;

select * from bill_detail;

insert into bill_detail(bill_id,product_id,quantity,price)
 value(1,1,3,1200),   
      (1,2,4,1500), 
      (3,2,4,1200), 
      (4,3,7,1600);
      
  -- Hiển thị tất cả account và sắp xếp theo user_name theo chiều giảm dần   
select id,userName,password,address, 
case status when 1 then 'true' when 0 then 'false' 
end as status from accounts order by userName desc;
-- Hiển thị tất cả bill từ ngày 11/2/2023 đến 15/5/2023
select * from bill where created between '2024-02-11' and '2024-05-15';
-- Hiển thị tất cả bill_detail theo bill_id
select * from bill_detail bll inner join bill b on b.id = bll.bill_id;

-- Hiển thị tất cả product theo tên và sắp xếp theo chiều giảm dần 
select id, name, created, price,stock,
case status when 1 then 'true' when 0 then 'false' 
end as status from product order by name desc;
-- Hiển thị tất cả product có số lượng lớn hơn 8
select id, name, created, price,stock,
case status when 1 then 'true' when 0 then 'false' 
end as status from product where stock >=8 ;

-- Hiển thị tất cả product còn hoạt động (dựa vào product_status)
select id, name, created, price,stock,
case status when 1 then 'true' when 0 then 'false' 
end as status from product where status = 1;


