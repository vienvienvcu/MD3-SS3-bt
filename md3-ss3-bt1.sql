use md3_ss02;
create table product(
  id int auto_increment primary key,
  name varchar(100) not null,
  created date not null
);

create table color (
   id int auto_increment primary key,
   name varchar(100) not null,
   status bit not null
);

create table size (

  id int auto_increment primary key,
  name varchar(100) not null,
  status bit not null
);

create table product_detail(
  id int auto_increment primary key,
  product_id int not null,
  color_id int not null,
  size_id int not null,
  price double not null,
  stock int not null,
  status bit,
  constraint fk_product foreign key (product_id) references product(id),
  constraint fk_color foreign key (color_id) references color(id),
  constraint fk_size foreign key (size_id) references size(id)
);
select * from color;
insert into color(name,status) value ('red',1);
insert into color(name,status) value ('blue',1),
									 ('green',1);
delete from color where id = 2;
select id,name ,case status when 1 then 'true' when 0 then 'false' end as status from color;

select * from size;

insert into size(name,status) value ('S', 1);
insert into size(name,status) value ('M',1),
									('L',1),
                                    ('XL',1),
                                    ('XXL',1);
select id,name,case status when 1 then 'true' when 0 then 'false' end as status from size;

select * from product;

insert into product(name,created) value ('quan dai', '2024-07-09')	;	
insert into product(name,created) value ('ao dai', '2024-07-07'),
										('mu phot', '2024-07-01');
									
delete from product where id = 1;	

select * from product_detail;
insert into product_detail(product_id,color_id,size_id,price,stock,status) value (2,1,2,200,1,1);
delete from product_detail where id = 1;	
insert into product_detail(product_id,color_id,size_id,price,stock,status) value (3,1,1,400,2,1),

                                                                                 (3,1,2,700,2,0);	
  select id,product_id ,color_id,size_id,price,stock,case status when 1 then 'true' when 0 then 'false' end as status from product_detail;
                                        
                                        
						



