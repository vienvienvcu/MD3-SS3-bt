use md3_ss02;
create table phieuXuat(
   sopx int auto_increment primary key,
   ngayxuat datetime
);

create table phieuXuatChiTiet(
  sopx int,
  maVt int,
  donGiaXuat double,
  soLuongXuat int,
  primary key(sopx, maVt),
  constraint fk_phieuxuat foreign key (sopx) references phieuXuat(sopx),
  constraint fk_vattu_xuat foreign key (maVt) references vatTu(maVT)
);

create table vatTu(
  maVT  int auto_increment primary key,
  tenVT varchar(255)
  
);

create table ngayCungCap(
   maNCC int auto_increment primary key,
   tenNCC varchar(255),
   diachi varchar(255),
   sodienthoai varchar(11)
);

create table donDatHang(
  soDH int auto_increment primary key,
  maNCC int,
  ngayDH dateTime,
  constraint fk_ngaycungcap foreign key (maNCC) references ngayCungCap (maNCC)
);


create table chiTietDonHang(
  maVT int,
  soDH int,
  primary key(maVT,soDH),
  constraint fk_vattu_don foreign key (maVT) references vatTu (maVT),
  constraint fk_donhang foreign key (soDH) references donDatHang(soDH)
  
);

create table phieuNhap(
  soPN int auto_increment primary key,
  ngayNhap datetime
);

create table phieuNhapChiTiet(
   soPN int,
   maVT int,
   donGiaNhap double,
   soLuongNhap int,
   primary key(soPN,maVT),
   constraint fk_phieuphap foreign key (soPN) references phieuNhap(soPN),
   constraint fk_vattu_chitiet foreign key (maVT) references vatTu(maVT)
);

select * from phieuXuat;

insert into phieuXuat(ngayxuat) value (str_to_date('12/05/2024' , '%d/%m/%Y')),
									  (str_to_date('12/06/2024' , '%d/%m/%Y')),
                                      (str_to_date('12/07/2024' , '%d/%m/%Y')),
                                      (str_to_date('12/08/2024' , '%d/%m/%Y')),
                                      (str_to_date('12/04/2024' , '%d/%m/%Y'));
                                      
select * from vatTu;

insert into vatTu(tenVT) value ('may giat'),
                                ('tu lanh'),
                                ('dieu hoa'),
                                ('quat'),
                                ('may hut bui');
select * from phieuXuatChiTiet;							
insert into phieuXuatChiTiet(sopx,maVt,donGiaXuat,soLuongXuat) value(1,1,0,3),
                                                                    (2,2,0,4),
                                                                    (3,3,0,6),
                                                                    (4,4,0,3),
                                                                    (5,1,0,5),
                                                                    (5,5,0,5);
                                                              																
select * from ngayCungCap;
insert into ngayCungCap(tenNCC,diachi,sodienthoai) value ('nga','ha dong-ha noi','0987654321'),
                                                         ('viet','hai duong-ha noi','0987674329'),
                                                         ('nam','japan','098765555'),
                                                         ('hoai','longbien-ha noi','0987653328'),
                                                         ('duc','america','098768888');
select * from donDatHang;
insert into donDatHang(maNCC,ngayDH) value (1,str_to_date('12/05/2024' , '%d/%m/%Y')),
                                           (2,str_to_date('12/06/2024' , '%d/%m/%Y')),
                                           (3,str_to_date('12/03/2024' , '%d/%m/%Y')),
                                           (4,str_to_date('12/02/2024' , '%d/%m/%Y')),
                                           (5,str_to_date('12/01/2024' , '%d/%m/%Y'));
select * from chiTietDonHang;
insert into chiTietDonHang (maVT,soDH) value (1,1),
											 (2,2),
											 (3,3),
											 (4,4),
											 (5,5);
								
select * from phieuNhap;

insert into phieuNhap(ngayNhap) value (str_to_date('07/07/2024' , '%d/%m/%Y')),
                                      (str_to_date('06/05/2024' , '%d/%m/%Y')),
                                      (str_to_date('05/04/2024' , '%d/%m/%Y')),
                                      (str_to_date('01/03/2024' , '%d/%m/%Y')),
                                      (str_to_date('12/12/2024' , '%d/%m/%Y'));
select * from phieuNhapChiTiet;

insert into phieuNhapChiTiet(soPN,maVT,donGiaNhap,SoLuongNhap) value (1,1,400,4),
                                                                     (2,2,500,2),
                                                                     (3,3,600,5),
                                                                     (4,4,400,7),
                                                                     (5,5,700,8);
--  Tìm danh sách vật tư bán chạy nhất
select * from phieuXuatChiTiet where soLuongXuat = (select max(soLuongXuat)from phieuXuatChiTiet);  
-- Tìm danh sách vật tư có trong kho nhiều nhất
select * from phieuNhapChiTiet where soLuongNhap = (select max(soLuongNhap) from phieuNhapChiTiet);
-- Tìm ra danh sách nhà cung cấp có đơn hàng từ ngày 12/2/2024 đến 22/2/2024
select * from ngayCungCap ncc inner join donDatHang d on d.maNCC = ncc.maNCC where d.ngayDH between '2024/01/12' and '2024/03/12';
-- Tìm ra danh sách vật tư đươc mua ở nhà cung cấp từ ngày 11/1/2024 đến 22/2/2024 
select * from vatTu v inner join chiTietDonHang ct on ct.maVT = v.maVT 
                      inner join donDatHang d on d.soDH = ct.soDH 
                      where d.ngayDH between '2024/01/12' and '2024/03/12';
									