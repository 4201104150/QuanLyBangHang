create database QLBH_Sach
go
use QLBH_Sach
go
create table LoaiSach
(
	idLoaiSach varchar(10) primary key,
	tenLoai nvarchar(10) not null
)
go
create table NXB
(
	idNXB varchar(10) constraint NXB_PK primary key,
	tenNXB nvarchar(50) not null,
	diaChi nvarchar(150),
	SDT varchar(100) unique
)
go
create table Sach
(
	idSach varchar(10) constraint Sach_PK primary key,
	maSach nvarchar(10),
	tenSach nvarchar(100) not null,
	hinh nvarchar(100),
	idLoaiSach varchar(10) constraint SACH_LoaiSach_FK foreign key (idLoaiSach) references LoaiSach(idLoaiSach), 
	idNXB varchar(10) constraint SACH_NXB_FK foreign key (idNXB) references NXB(idNXB), 
	donGia varchar(10),
	mota nvarchar(100),
	soLuong int
)
go
create table phieuXuat
(
	idPhieuXuat int identity constraint PhieuXuat_PK primary key,
	idSach varchar(10) constraint phieuXuat_Sach_fk foreign key(idSach) references Sach(idSach),
	ngayXuat datetime,
	giaTien varchar(10)
)
go
create table phieuNhap
(
	idPhieuNhap int identity(1,1) constraint phieuNhap_PK primary key,
	idLoaiSach varchar(10) constraint phieuNhap_FK foreign key(idLoaiSach) references LoaiSach(idLoaiSach),
	ngayNhap datetime,
	soLuong int,
	donGia varchar(10)
)
create table Account
(
	username varchar(20) constraint Account_PK primary key,
	passwords varbinary(255),
	stype int
)
go
create table nhanVien
(
	idNhanVien int identity(1,1) primary key,
	userName varchar(20) constraint Nhanvien_Account_FK foreign key(username) references Account(username),
	hinh nvarchar(100),
	hoTen nvarchar(100),
	ngaySinh datetime,
	diaChi nvarchar(100),
	gioiTinh nvarchar(5),
	SDT varchar(12),
	CMND varchar(20),
	ngayVaoLam date,
	heSoLuong varchar(10),
	luong varchar,
	stype int
)
go
create table Khach
(
	idKhach int identity(1,1),
	userName varchar(20) constraint Khach_Account_FK foreign key(username) references Account(username),
	hinh nvarchar(100),
	hoTen nvarchar(100),
	ngaySinh datetime,
	diaChi nvarchar(100),
	gioiTinh nvarchar(5),
	CMND varchar(20),
	SDT varchar(12),
	stype int
)