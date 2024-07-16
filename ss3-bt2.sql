use md3_ss02;
create table customer(
   cId int auto_increment primary key,
   cName varchar(100),
   cAge int
);
create table orders (
   o_id int auto_increment primary key,
   c_id int,
   o_date datetime,
   o_totalprice double,
   constraint fk_customer foreign key (c_id)references customer(cId)
);

create table product (
   p_id int auto_increment primary key,
   p_name varchar(255),
   p_price double
);

create table order_detail(
  oid int,
  pid int,
  odquantty int,
  primary key (oid,pid),
  constraint fk_orders foreign key(oid)references orders(o_id),
  constraint fk_product foreign key(pid)references product(p_id)
);
select * from customer ;
insert into customer(cName,cAge) value ('minh quan',10);
insert into customer(cName,cAge) value ('ngoc anh',20),
                                       ('hai ha',50);

delete from customer where cId = 9;
select * from product;
insert into product(p_name,p_price) value ('may giat',300);
insert into product(p_name,p_price) value ('tu lanh',500),
                                          ('dieu hoa',700),
                                          ('quat',100),
                                          ('bep dien',200),
                                          ('may hut mui',500);
                                          
 delete from product where p_id = 5;   
 

insert into orders(c_id, o_date, o_totalprice) value (6,'2024-09-07',0);
insert into orders(c_id, o_date, o_totalprice) value (7,'2024-09-08',0),
                                                     (8,'2024-09-06',0);
delete from orders where o_id = 7;													
insert into order_detail(oid, pid, odquantty) value (3,1,3);
insert into order_detail(oid, pid, odquantty) value (3,2,1),
                                                    (3,3,2),
                                                    (4,8,5),
                                                    (5,7,3);
update orders o
set o.o_totalprice = 
(select ifnull(sum(p.p_price * od.odquantty),0)
from order_detail od 
join product p on od.pid = p.p_id where od.oid = o.o_id
)
where o.o_totalprice is null or o.o_totalprice = 0;

select * from orders;

select * from order_detail;
 
 

 
