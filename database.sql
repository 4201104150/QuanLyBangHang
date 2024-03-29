USE [master]
GO
/****** Object:  Database [MyeStore]    Script Date: 25/08/2019 14:15:35 ******/
CREATE DATABASE [MyeStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyeStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyeStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyeStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MyeStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyeStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyeStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyeStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyeStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyeStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyeStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyeStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyeStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyeStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyeStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyeStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyeStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyeStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyeStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyeStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyeStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyeStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyeStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyeStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyeStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyeStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyeStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyeStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyeStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyeStore] SET RECOVERY FULL 
GO
ALTER DATABASE [MyeStore] SET  MULTI_USER 
GO
ALTER DATABASE [MyeStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyeStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyeStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyeStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyeStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyeStore', N'ON'
GO
ALTER DATABASE [MyeStore] SET QUERY_STORE = OFF
GO
USE [MyeStore]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Amount]    Script Date: 25/08/2019 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Amount]
(
	@UnitPrice FLOAT,
	@Quantity INT,
	@Discount FLOAT
)
RETURNS FLOAT
AS
BEGIN
	RETURN @UnitPrice*@Quantity*(1-@Discount)

END

GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 25/08/2019 14:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(100001,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaHH] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [int] IDENTITY(1001,1) NOT NULL,
	[TenHH] [nvarchar](100) NOT NULL,
	[TenAlias] [nvarchar](50) NULL,
	[MaLoai] [int] NOT NULL,
	[MoTaDonVi] [nvarchar](50) NULL,
	[DonGia] [float] NULL,
	[Hinh] [nvarchar](50) NULL,
	[NgaySX] [datetime] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNCC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vChiTietHoaDon]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vChiTietHoaDon]
AS 
	SELECT cthd.*, TenHH
	FROM ChiTietHD cthd JOIN HangHoa hh 
		ON hh.MaHH = cthd.MaHH


GO
/****** Object:  Table [dbo].[BanBe]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanBe](
	[MaBB] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NULL,
	[MaHH] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NgayGui] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[MaBB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GopY]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[MaGY] [nvarchar](50) NOT NULL,
	[MaCD] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGY] [date] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[CanTraLoi] [bit] NOT NULL,
	[TraLoi] [nvarchar](50) NULL,
	[NgayTL] [date] NULL,
 CONSTRAINT [PK_GopY] PRIMARY KEY CLUSTERED 
(
	[MaGY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(10742,1) NOT NULL,
	[MaKH] [nvarchar](20) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayCan] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](60) NOT NULL,
	[CachThanhToan] [nvarchar](50) NOT NULL,
	[CachVanChuyen] [nvarchar](50) NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[MaTrangThai] [int] NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[MaHD] [int] NOT NULL,
	[CauHoi] [nvarchar](50) NOT NULL,
	[TraLoi] [nvarchar](50) NOT NULL,
	[NgayDua] [date] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[DienThoai] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[HieuLuc] [bit] NOT NULL,
	[VaiTro] [int] NOT NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1000,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TenLoaiAlias] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
	[NguoiLienLac] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaPB] [varchar](7) NOT NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(16,1) NOT NULL,
	[MaPB] [varchar](7) NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Xem] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 25/08/2019 14:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](7) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 25/08/2019 14:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 25/08/2019 14:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 25/08/2019 14:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaYT] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NULL,
	[MaKH] [nvarchar](20) NULL,
	[NgayChon] [datetime] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[MaYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHD] ON 

INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100001, 10248, 1011, 14, 12, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (100002, 10248, 1042, 9.8, 10, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102238, 11114, 1002, 19, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102239, 11114, 1053, 32.8, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102240, 11115, 1001, 190, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102241, 11115, 1034, 14, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102242, 11116, 1020, 81, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (102243, 11116, 1021, 10, 1, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHD] OFF
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1001, N'Sách giáo khoa lớp 1', N'1001-aniseed-syrup-123', 1009, N'Còn gì phải nói', 20000, N'lop1.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1007, N'Bài tập tin học – Dành cho trung học cơ sở - Quyển 1 (Lớp 6)', N'', 1006, N'Còn gì phải nói', 17000, N'sachbt2.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1009, N'Sách giáo khoa lớp 3', N'1001-aniseed-syrup-123', 1005, N'Còn gì phải nói', 112000, N'lop3.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1014, N'Bộ sách bài tập lớp 5', N'1001-aniseed-syrup-123', 1006, N'Còn gì phải nói', 90000, N'sachbt1.jpeg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1017, N'Sách giáo khoa lớp 4', N'1001-aniseed-syrup-123', 1005, N'Còn gì phải nói', 112000, N'lop4.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1018, N'Sách giáo khoa lớp 2', N'1001-aniseed-syrup-123', 1009, N'Còn gì phải nói', 100000, N'lop2.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1023, N'Doraemon', N'', 1007, N'Còn gì phải nói', 24000, N'truyen_1.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Doraemon ドラえもん? hay Đôrêmon, tên gọi cũ trước khi được đổi theo công ước Bern về bản quyền, là bộ truyện tranh Nhật Bản của tác giả Fujiko Fujio được sáng tác từ năm 1969 với mục đích ban đầu dành cho lứa tuổi thiếu nhi. Tác phẩm sau đó đã được chuyển thể thành các tập phim hoạt hình ngắn, dài cùng các thể loại khác như kịch, trò chơi điện tử.Bộ truyện kể về một chú mèo máy tên là Doraemon đến từ thế kỉ 22 để giúp một cậu bé lớp 5-3 hậu đậu tên là Nobi Nobita. Các câu chuyện của Doraemon thường ngắn gọn, dễ hiểu, dí dỏm và mang cái nhìn lạc quan về cuộc sống tương lai cũng như sự phát triển của khoa học - kĩ thuật. Doraemon đã giành được nhiều giải thưởng truyện tranh ở Nhật Bản và được tạp chí TIME Asia bình chọn là một trong 22 nhân vật nổi bật của châu Á[2]. Kể từ khi ra đời đến nay, Doraemon không chỉ được coi là nhân vật và bộ truyện tranh được yêu thích hàng đầu ở Nhật Bản, nó còn trở thành một biểu tượng văn hóa của đất nước này và được trẻ em nhiều nước trên thế giới yêu thích.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1024, N' Thám tử lừng dang conan tập 86', N'', 1007, N'Còn gì phải nói', 18000, N'truyen_2.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Thám tử lừng danh conan, còn được biết đến dưới tên tiếng Nhật Meitantei Konan hay Detective conan là bộ truyện tranh trinh thám Nhật Bản của tác giả Aoyama Gōshō.\r\n\r\nMở đầu câu truyện là học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên với Ran Mori,cậu tình cờ chứng kiến vụ một án giết người, Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc đồ đen. Chúng phát hiện ra cậu và đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX 4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo mà chỉ khiến cậu bị teo nhỏ.\r\n\r\nKhi Ran hỏi tên cậu, Shinichi đã ghép \"Conan\" trong tên của Sir Arthur Conan Doyle và \"Edogawa\" trong tên của Edogawa Rampo, buột miệng nói ra tên mình là \"Conan Edogawa\". Tiến sĩ Agasa đã nhờ Ran trông nom Conan giúp mình. Ran nhận lời và từ đó Conan sống tại nhà của Ran tức văn phòng thám tử Mori, vừa che giấu thân phận vừa điều tra tung tích của Tổ chức Áo đen và tìm kiếm thuốc giải độc.
', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1025, N'shin-cậu bé bút chì tập 45', N'', 1007, N'Còn gì phải nói', 16000, N'truyen_3.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Shin-cậu bé bút chì (クレヨンしんちゃん Kureyon Shin-chan?) (tựa đề tiếng Anh:Crayon Shin-chan) là một bộ truyện tranh của tác giả Usui Yoshito, bộ truyện kể về chú nhóc Shin 5 tuổi,với những câu chuyện phiêu lưu cùng với bố mẹ, em gái, chú cún Bạch Tuyết, bạn bè và những nhân vật khác. Câu truyện có nét vẽ đơn giản, qua đó tác giả đã tạo được vẻ đáng yêu của cậu bé.\r\n\r\nCó thể nói rằng,những câu chuyện của cu Shin là việc xảy ra hằng ngày. Shin là một đứa trẻ khác thường so với các bạn khác. Cậu bé có tính năng động, nghịch ngợm,rất thích những cô gái trẻ đẹp, siêu nhân, lợn Buri Buri và chị Nanako. Câu chuyện dựa trên 1 câu chuyện có thật. Shin mất lúc 5 tuổi vì cố gắng cứu em gái. Sau đó, vì quá sốc nên mẹ Shin luôn lấy giấy ra vẽ mặt Shin và em gái. Yoshito Usui vì thương nên quyết định tạo ra bộ truyện này. Nhưng do trong khi viết bản thảo, ông qua đời trong cuộc đi bộ đường dài trên núi, chưa kịp hoàn thành bộ truyện Shin này.
', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1026, N' Harry Potter', N'', 1007, N'Còn gì phải nói', 200000, N'truyen_4.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Harry Potter là tên của bộ truyện (gồm bảy phần) của nữ nhà văn nước Anh J. K. Rowling. Bộ truyện viết về những cuộc phiêu lưu phù thủy của cậu bé Harry Potter và những người bạn Ronald Weasley, Hermione Granger, lấy bối cảnh tại Trường Phù thủy và Pháp sư Hogwarts nước Anh. Những cuộc phiêu lưu tập trung vào cuộc chiến của Harry Potter trong việc chống lại tên Chúa tể hắc ám Voldemort - người có tham vọng muốn trở nên bất tử, thống trị thế giới phù thủy, nô dịch hóa những người phi pháp thuật và tiêu diệt những ai cản đường hắn đặc biệt là Harry Potter.\r\n\r\nBộ truyện kết hợp nhiều thể loại, bao gồm cả giả tưởng và giai đoạn tuổi mới lớn (với các yếu tố huyền bí, kinh dị, phiêu lưu và lãng mạn), nhiều ý nghĩa về văn hóa và tư liệu tham khảo.Cũng theo tác giả J. K. Rowling, chủ đề chính xuyên suốt là cái chết.', N'T')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1027, N'Bảy viên ngọc rồng', N'', 1007, N'Còn gì phải nói', 190000, N'truyen_5.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Câu chuyện bắt đầu từ cuộc gặp gỡ giữa một cậu bé sống trong rừng rậm tên là Son Goku và Bulma, một người đang trên đường đi tìm Bảy viên ngọc rồng. Truyền thuyết kể rằng ai tìm đủ Bảy viên ngọc rồng thì rồng thần sẽ xuất hiện và thực hiện 1 điều ước của người đó. Trên đường đi tìm Bảy viên ngọc rồng, Goku đã gặp Yamucha, Puarru, Ulong và họ trở thành bạn. Cậu bé còn được gặp Quy lão tiên sinh và ông ấy tặng cho Cân đẩu vân. Sau này cậu được ông ấy nhận làm đệ tử với người bạn đồng môn tốt bụng Krillin. Sau 1 năm học với Quy Lão, Goku đã tham gia Đại hội võ thuật và đạt danh hiệu Á quân. Sau khi đánh bại đại ma vương Picollo, Picollo con tới đại hội võ thuật thách đấu Goku. Trong trận đấu đó Goku đã chiến thắng và giành giải quán quân. Và sau đó Goku cưới Chichi làm vợ và sinh một đứa con và đặt tên đứa con đó là Gohan.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1028, N'Túi dụng cụ học tập cho bé', N'', 1013, N'Còn gì phải nói', 21000, N'dungcu_1.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Để tạo hứng thú cho bé trong học tập, mẹ hãy dành cho bé bộ túi dụng cụ học tập nhỏ gọn mà lại rất tiện lợi. Sản phẩm thiết kế theo hình ảnh của các nhân vật hoạt hình được rất nhiều em nhỏ yêu thích, gồm những món đồ phục vụ hữu ích cho quá trình học tập của bé: bút mực, kéo, bút chì, đồ gọt bút chì.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1029, N'Bộ bút màu đáng yêu cho bé', N'', 1013, N'Còn gì phải nói', 110000, N'dungcu_2.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Bộ bút màu bao gồm 82 món dụng cụ và các loại màu vẽ đa dạng, giúp các bé sẽ thỏa sức sáng tạo thế giới xung quanh qua đôi mắt trẻ thơ của mình.Từ chất tạo màu đến bút đều được làm từ chất liệu cao cấp, an toàn cho bé và thân thiện với môi trường.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1030, N'Bộ Comba thước kẻ 2 ngăn', N'', 1013, N'Còn gì phải nói', 195000, N'dungcu_3.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Bộ sản phẩm bao gồm: Hộp đựng + 1 compa + 1 bút + 1 gọt bút chì + 4 thước ( thước thẳng 15cm + 2 thước eke và thước đo độ).Bộ dụng cụ này sẽ phục vụ tốt hơn việc học toán của các em học sinh. Thước được làm từ chất liệu nhựa cứng cáp, có độ bền lâu dài theo thời gian. Các dụng cụ được sắp xếp gọn gàng và khoa học trong hộp đựng có ngăn chia, giúp các em dễ dàng mang theo trong cặp. ', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1031, N'Hộp đựng bút Totoro đáng yêu', N'', 1013, N'Còn gì phải nói', 36000, N'dungcu_4.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Hộp bút rộng rãi, đựng được nhiều bút.Thiết kế ngăn độc đáo, chống thấm tốt. Hộp bút 2 tầng đựng bút tha hồ như trong hình. Có 4 màu để lựa chọn,Kích thước: 20 x 8.5 x 4 (cm). ', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1032, N'Balo vải đi học', N'', 1013, N'Còn gì phải nói', 90000, N'dungcu_5.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Thiết kế mang hơi hướng hiện đại, vừa đơn giản, vừa trẻ trung. Sản phẩm chắc chắn sẽ khiến bạn trở nên đáng yêu và thật phong cách khi đi học hay đi du lịch, dạo phố cùng bạn bè. ', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1033, N'Mô hình DYD- quả cầu thủy tinh đôraemon', N'', 1014, N'Còn gì phải nói', 645000, N'luuniem_1.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Mô hình DIY-Quả cầu thủy tinh Đô Rê Mon bao gồm một quả cầu trong suốt bằng chất liệu thủy tinh cao cấp có móc treo đi kèm các loại phụ kiện trang trí. Bạn cần hoàn thiện các công đoạn ráp nối và cố định chúng lại với nhau bằng keo chuyên dụng theo chỉ dẫn từ tài liệu hướng dẫn', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1034, N'Ngôi nhà làm bằng gỗ', N'', 1014, N'Còn gì phải nói', 120000, N'luuniem_2.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Ngôi nhà được làm bằng gỗ xinh xắn , dùng để làm quà tặng hay trang trí trưng bày', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1035, N'Chuông gió nhật bản mèo may mắn', N'', 1014, N'Còn gì phải nói', 95000, N'luuniem_3.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Sản phẩm là một chiếc chuông gió bằng sứ khá đơn giản, hình bầu cho nên sẽ phát ra âm thanh rất "thanh", nghe rất êm tai như một điệu nhạc, tạo ra cảm giác thanh thản cho người nghe. Và đặc biệt hơn nữa nó cũng là một "công cụ" để "nhắc nhở" người nhận món quà này luôn nhớ đến "người tặng". Vừa ý nghĩa, vừa lý tưởng. Đó cũng là nguyên nhân mình luôn chọn chiếc chuông gió này để tặng bạn bè, người thân và "người ấy" nữa đấy.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1036, N'Đồng hồ cát thủy tinh đế trái tim', N'', 1014, N'Còn gì phải nói', 329000, N'luuniem_4.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Cũng giống như đồng hồ cát thủy tinh cao cấp, chiếc đồng hồ cát này cũng có cấu tạo, chất liệu và kích thước giống nhau. Tuy nhiên sự khác nhau nằm ở phần chân đế. Chiếc đồng hồ cát này có đế hình trái tim.
Thời gian cát chảy là 30 phút. Có nhiều màu sắc khác nhau để cho bạn lựa chọn theo sở thích.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1037, N'Thiệp handmade', N'', 1014, N'Còn gì phải nói', 39000, N'luuniem_5.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Thiệp handmade ấn tượng, độc đáo, xinh xắn dùng để tặng bạn bè người thân ', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1038, N'Bộ đồ chơi rút gỗ', N'', 1015, N'Còn gì phải nói', 45000, N'dochoi_1.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Bộ đồ chơi rút gỗ chất liệu 100% bằng gỗ được gia công mịn màng từng miếng rất chi tiết. Sản phẩm được làm từ gỗ và sơn an toàn đảm bảo không làm tổn hại cho các bé trong khi chơi.Giúp trẻ rèn luyện tính cẩn thận và khéo léo.Với trò chơi này, các bé có thể chơi cùng nhau, tinh thần chiến thắng đồng đội sẽ được các bé thể hiện và phát huy.Trò chơi này cũng đang được rất nhiều bạn trẻ ưa chuộng, như một cách thư giãn với bạn bè sau những giờ làm việc căng thẳng. ', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1039, N'Bộ bài ma sói', N'', 1015, N'Còn gì phải nói', 119000, N'dochoi_2.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Trong một ngôi làng nhỏ, một ngày nọ bị tấn công bởi Ma Sói, loài sinh vật xảo quyệt chuyên đi hại người vào ban đêm và ngụy trang thành dân thường vào ban ngày. Trước tình hình đó, dân làng cùng hợp sức lại, thảo luận để tìm ra ai là Ma Sói đang trộn lẫn trước khi để thảm họa đi xa hơn vào những đêm về sau.
Ma Sói phiên bản đặc biệt Characters bao gồm 24 lá cơ bản và 16 nhân vật hoàn toàn mới cộng thêm các lá bài sự kiện! Các nhân vật như thiên sứ, chị em sinh đôi, kịch sĩ, sói trắng, sói trùm, ... hứa hẹn sẽ đem đến cho bạn một kinh nghiệm mới mẻ trong một game tưởng chừng như đã quen thuộc. Nào cùng khám phá Characters!', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1040, N'Bộ đồ chơi lego lắp ráp sáng tạo', N'', 1015, N'Còn gì phải nói', 169000, N'dochoi_3.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Bộ đồ chơi Lego lắp ráp sáng tạo (1000 chi tiết) cho bé thỏa sức lắp ráp bất cứ điều gì bé thích. Qua đó, khả năng sáng tạo và trí tưởng tượng của bé sẽ trở nên nhạy bén hơn. Mô hình Lego sẽ mang lại cho trẻ những phút giây vui chơi thú vị khi được tự mình tưởng tượng và mày mò lắp ghép, rèn luyện tính tỉ mỉ cũng như khơi gợi khả năng tư duy và sáng tạo ở từng trẻ.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1041, N'Xe robot điều khiển từ xa', N'', 1015, N'Còn gì phải nói', 119000, N'dochoi_4.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Làm quà tặng cho cả người lớn và trẻ nhỏ đều thích hợp Tốc độ cực nhanh, xoay 360, biến hình thành robot và ngược lại
Phuột nhún 4 bánh có sự đàn hồi cực cao, chống lật cho xe,4 bánh được làm từ cao su đặc không bao giờ bị xì, thủng,Pin lithium dung lượng lên đến 2000mAh, sử dụng cực lâu, Hết pin có thể sạc lại để chơi tiếp,Tới lui ( nhấn đồng thời 2 cần) , trái phải ( nhấn 1 cần)', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1042, N'Bộ đồ chơi búp bê Barbie', N'', 1015, N'Còn gì phải nói', 220000, N'dochoi_5.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Cô nàng Barbie xinh đẹp có 3 chú cún và 2 cô mèo xinh xắn làm bạn. Ngoài ra, còn có xe đẩy, túi xách để mang các bạn thú cưng đi dạo, chén ăn, và các đồ chơi cho thú cưng. Cửa Hàng Thú Cưng Barbie - BCF82 sẽ là món đồ chơi yêu thích của các bé gái. Mái tóc vàng bồng bềnh, nụ cười thân thiện Barbie duyên dáng sẽ càng xinh hơn khi được kết hợp với những chú cún, chú mèo con dễ thương.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1043, N'Móc treo đồ trang trí tạo chữ Home , Love', N'', 1016, N'Còn gì phải nói', 250000, N'thamkhao_1.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Móc treo trang trí chữ HOME, LOVE cho căn phòng thêm xinh. Chất liệu gỗ tự nhiên, mỗi chữ cái có 1-2 móc treo đồ (móc khóa, nón, phụ kiện…)', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1044, N'Gối đi xe có đỡ cổ cao cấp', N'', 1016, N'Còn gì phải nói', 80000, N'thamkhao_2.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Mang ấn tượng đẹp mắt với vẻ ngoài sinh động cùng họa tiết nổi bật và màu sắc, sản phẩm là chiếc gối chữ u để đi du lịch được ưa chuộng nhất hiện nay với chất liệu vải may mềm mịn, không gây bí nóng có thể yên tâm sử dụng trong 4 mùa. Phần ruột bên trong được là bằng bông tơ xốp nhẹ. Thiết kế thông minh với phần nhô cao hơn ở chính giữa giúp tăng khả năng tiếp xúc giữa phần cổ và gáy, điểm này khá giống với gối đi máy bay Naturehike. Cấu tạo nhỏ gọn và vừa vặn, có thể sử dụng cho trẻ em từ 10 tuổi trở lên.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1045, N'Bộ đồ thú Doraemon', N'', 1016, N'Còn gì phải nói', 220000, N'thamkhao_3.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Bồ đồ xinh xắn dễ thương ', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1046, N'Set 12 dây cột tóc kèm hộp ', N'', 1016, N'Còn gì phải nói', 60000, N'thamkhao_4.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Set gồm 12 chi tiết dây buộc tóc mềm co dãn Hàn Quốc kèm hộp vô cùng tiện lợi, giúp nàng điệu đà và thay đổi nha.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1047, N'Gấu Bông We are Bear', N'', 1016, N'Còn gì phải nói', 220000, N'thamkhao_5.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' We Bare Bears là bộ ba những chú gấu bông tinh nghịnh. Những chú gấu bông này đã nhập vào thế giới loài người để biết mình cần gì muốn gì và làm gì. Ngoài phiên bản We Bare Bears bông Nằm hiện tại ở shop còn có một mẫu mã mới đó là những chứ We Bare Bears với tư thế đứng rất đáng yêu và sinh động.', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1048, N'Luyện trí nhớ từ vựng tiếng anh cho học sinh THPT quốc gia', N'', 1008, N'Còn gì phải nói', 140000, N'sachtk_1.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Sách giúp luyện từ vựng cho các em học sinh sắp thi TPHP quốc gia ', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1049, N'Đột phát bằng CASIO FX570VN Plus môn Toán', N'', 1008, N'Còn gì phải nói', 56000, N'sachtk_2.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Sách giúp các em học sinh THPT học giỏi toán và cách ấn máy tính cho các bài toán ', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1050, N'Mega XOY Học nhanh 23 phương pháp giải hóa học hiện đại', N'', 1008, N'Còn gì phải nói', 40000, N'sachtk_3.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Giúp các em học sinh trong nắm vững kiến thức môn hóa học', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1051, N'Các chuyên đề bám sát đề thi THPT quốc gia môn Sinh Học', N'', 1008, N'Còn gì phải nói', 100000, N'sachtk_4.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N' Giúp các em nắm rõ các chuyên đề môn  sinh học trong kì thi THPT quốc gia', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1052, N'Combo bứt phá điểm thi môn vật lí', N'', 1008, N'Còn gì phải nói', 220000, N'sachtk_5.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Giúp các em nắm rõ và hiểu các dạng bài tập trong đề thi lý THPT quốc gia ', N'KD')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1053, N'Sách giáo khoa lớp 6', N'1001-aniseed-syrup-123', 1010, N'Còn gì phải nói', 102000, N'lop6.jpeg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1054, N'Sách giáo khoa lớp 7', N'1001-aniseed-syrup-123', 1010, N'Còn gì phải nói', 120000, N'lop7.jpeg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1055, N'Sách giáo khoa lớp 8', N'1001-aniseed-syrup-123', 1010, N'Còn gì phải nói', 134000, N'lop8.jpeg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1056, N'Sách giáo khoa lớp 9', N'1001-aniseed-syrup-123', 1010, N'Còn gì phải nói', 122000, N'lop9.jpeg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1057, N'Sách giáo khoa lớp 10', N'1001-aniseed-syrup-123', 1011, N'Còn gì phải nói', 147000, N'lop10.jpeg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1058, N'Sách giáo khoa lớp 11', N'1001-aniseed-syrup-123', 1011, N'Còn gì phải nói', 152000, N'lop11.png', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1059, N'Sách giáo khoa lớp 12', N'1001-aniseed-syrup-123', 1011, N'Còn gì phải nói', 102000, N'lop12.jpeg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1060, N'Giáo dục nhân bản: Văn hóa – nguồn sống', N'1001-aniseed-syrup-123', 1012, N'Còn gì phải nói', 504000, N'dh-cd1.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1061, N'Giáo trình Sketchup Pro 2013', N'1001-aniseed-syrup-123', 1012, N'Còn gì phải nói', 440000, N'dh-cd2.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1062, N'Trắc địa đại cương', N'1001-aniseed-syrup-123', 1012, N'Còn gì phải nói', 77000, N'dh-cd3.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1063, N'Tri thức bản địa của các tộc người thiểu số tại chỗ ở Đắk Nông', N'1001-aniseed-syrup-123', 1012, N'Còn gì phải nói', 140000, N'dh-cd4.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1064, N'Xuân Mậu Thân 1968 – Tầm vóc một cuộc Tổng tiến công và nổi dậy', N'1001-aniseed-syrup-123', 1012, N'Còn gì phải nói', 144000, N'dh-cd5.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1065, N'Bộ sách bài tập lớp 12', N'1001-aniseed-syrup-123', 1006, N'Còn gì phải nói', 119000, N'sachbt3.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1066, N'Bộ sách bài tập lớp 11', N'1001-aniseed-syrup-123', 1006, N'Còn gì phải nói', 111000, N'sachbt4.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1067, N'Bộ sách bài tập lớp 9', N'1001-aniseed-syrup-123', 1006, N'Còn gì phải nói', 80000, N'sachbt5.jpeg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1068, N'Sách giáo khoa lớp 5', N'1001-aniseed-syrup-123', 1009, N'Còn gì phải nói', 78000, N'lop5.jpg', CAST(N'2009-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hết nước hết cái cần gì nói nữa. Quất', N'AP')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10742, N'BOTTM', CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'1997-12-12T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime), NULL, N'23 Tsawassen Blvd.', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10743, N'AROUT', CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime), NULL, N'Brook Farm Stratford St. Mary', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10744, N'VAFFE', CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1997-11-24T00:00:00.000' AS DateTime), NULL, N'Smagsloget 45', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10745, N'QUICK', CAST(N'1997-11-18T00:00:00.000' AS DateTime), CAST(N'1997-12-16T00:00:00.000' AS DateTime), CAST(N'1997-11-27T00:00:00.000' AS DateTime), NULL, N'Taucherstraße 10', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (10746, N'CHOPS', CAST(N'1997-11-19T00:00:00.000' AS DateTime), CAST(N'1997-12-17T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime), NULL, N'Hauptstr. 31', N'Cash', N'Airline', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11112, N'ANTON', CAST(N'2017-12-09T15:15:58.843' AS DateTime), NULL, NULL, N'Antonio Moreno', N'', N'Tiền mặt', N'', 0, 0, NULL, N'')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11113, N'ANTON', CAST(N'2017-12-09T15:16:39.150' AS DateTime), NULL, NULL, N'Antonio Moreno', N'', N'Tiền mặt', N'', 0, 0, NULL, N'')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11114, N'ANTON', CAST(N'2017-12-09T15:18:14.817' AS DateTime), NULL, NULL, N'Antonio Moreno', N'', N'Tiền mặt', N'', 0, 0, NULL, N'')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11115, N'111', CAST(N'2017-12-09T16:34:16.363' AS DateTime), NULL, NULL, N'Anh Hùng', N'105 Bà Huyện Thanh Quan', N'Tiền mặt', N'', 0, 0, NULL, N'Giao sớm')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (11116, N'111', CAST(N'2017-12-09T16:37:02.070' AS DateTime), NULL, NULL, N'111', N'', N'Tiền mặt', N'', 0, 0, NULL, N'')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'admin', N'aaaaa', N'Nguyễn Tèo', 1, CAST(N'2011-01-19T07:00:00.000' AS DateTime), N'280', N'280', N'tuannv@hcmue.edu.vn', N'69.jpg', 1, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'lam', N'dddd', N'Sơn Lâm', 1, CAST(N'2002-01-10T00:00:00.000' AS DateTime), N'213', N'213', N'lam@124', N'lop3.jpg', 1, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'quynh', N'bbbb', N'Nguyễn quỳnh', 0, CAST(N'2011-02-09T07:00:00.000' AS DateTime), N'290', N'290', N'nguyennhuquynh1698@gmail.com', N'lop1.jpg', 1, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'thi', N'cccc', N'Đỗ Thi', 0, CAST(N'2019-09-09T00:00:00.000' AS DateTime), N'291', N'218', N'dothithanhthi1209@gmail.com', N'lop2.jpg', 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1000, N'Sách', N'sach-hoc-tap', N'Tập hợp tất cả các loại sách', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1001, N'Dụng cụ học tập', N'dung-cu-hoc-tap', N'Tập hợp tất cả các dụng cụ chuyên dùng trong học tập, giảng dạy...', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1002, N'Lưu niệm', N'luu-niem', N'Tập hợp các món quà lưu niệm đó đây trên khắm mọi vùng', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1003, N'Đồ chơi', N'do-choi', N'Tập hợp các đồ chơi dành cho mọi lứa tuổi, từ đồ chơi trẻ em cho đến người lớn', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1004, N'Tham khảo', N'tham-khao', N'Những chuyên mục khác', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1005, N'Sách giáo khoa', N'sach-giao-khoa', N'Sách giáo khoa từ mầm non đến đại học, và cả sau đại học nữa', N'1000')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1006, N'Sách bài tập', N'sach-bai-tap', N'Sách bài tập từ mầm non đến đại học và sau đại học nữa', N'1000')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1007, N'Truyện', N'truyen', N'Tổng hợp các thể loại truyện tranh, truyện màu, truyện ký, truyện kinh dị,...', N'1000')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1008, N'Sách tham khảo', N'sach-tham-khao', N'Tham khảo mọi thứ với bách khoa toàn thư vô cùng rộng lớn', N'1000')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1009, N'Sách tiểu học', N'sach-tieu-hoc', N'Sách giáo khoa từ lớp 1-5', N'1005')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1010, N'Sách trung học cơ sở', N'sach-trung-hoc-co-so', N'Sách giáo khoa từ lớp 6-9', N'1005')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1011, N'Sách trung học phổ thông', N'sach-trung-hoc-pho-thong', N'Sách giáo khoa từ lớp 10-12', N'1005')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1012, N'Sách cao đẳng-đại học', N'sach-dai-hoc-cao-dang', N'Sách dành cho các bậc cao đẳng-đại học', N'1005')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1013, N'Đồ dùng học tập', N'do-dung-hoc-tap', N'Đồ dùng trong học tập', N'1001')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1014, N'Đồ lưu niệm', N'do-luu-niem', N'Đồ lưu niệm', N'1002')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1015, N'Đồ chơi', N'do-choi', N'Đồ chơi', N'1003')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1016, N'Những loại khác', N'loai-khac', N'Những loại khác', N'1004')
SET IDENTITY_INSERT [dbo].[Loai] OFF
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'AP', N'Apple', N'apple.gif', N'Petter Pike', N'pike@yahoo.com', N'0987345876', N'765 Hello, Califonia, United States', N'Moble Device')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'KD', N'NXB Kim Đồng', N'logo_1.jpg', N'Petter Pike', N'pike@yahoo.com', N'(028)9316 211', N'161B Lý Chính Th?ng, Phu?ng 7, Qu?n 3 , TP. H? Chí Minh', N'Cung cấp truyện')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'MO', N'Motorola', N'motorola.gif', N'John David', N'john@gmail.com', N'0918456987', N'22 Rose, Messachuset, United States', N'Communication Company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'NK', N'Nokia', N'Nokia.gif', N'Okawa', N'okawa@gmail.com', N'0913745789', N'123 Revenue, Tokyo, Japan', N'Famous company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'SM', N'Seamen', N'semen.gif', N'David Brown', N'brown@gmail.com', N'0987456876', N'23 New World, Texas, United Kindom', N'Digital device company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'SS', N'Samsung', N'samsung.gif', N'LeeSongChai', N'lee@yahoo.com', N'0913745789', N'456 Romario, Seaul, Korea', N'The best company')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'T', N'NXB Trẻ', N'logo_2.jpg', N'Petter Pike', N'pike@yahoo.com', N'(028)9316 211', N'161B Lý Chính Th?ng, Phu?ng 7, Qu?n 3 , TP. H? Chí Minh', N'Cung cấp truyện')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'lvc', N'Lê Văn C', N'lvc@gmail.com', N'123')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nva', N'Trần Văn A', N'tva@gmail.com', N'123')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nvb', N'Nguyễn Văn B', N'nvb@gmail.com', N'123')
SET IDENTITY_INSERT [dbo].[PhanCong] ON 

INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (1, N'lvc', N'BGD', CAST(N'2017-12-17T10:10:06.877' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (2, N'nva', N'BGD', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (3, N'lvc', N'BGD', CAST(N'2017-12-17T10:15:51.303' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (4, N'nva', N'BGD', CAST(N'2017-12-17T10:15:51.333' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (5, N'nva', N'PKT', CAST(N'2017-12-17T10:16:19.203' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (6, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:19.213' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (7, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:39.180' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PhanCong] OFF
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (16, N'BGD', 1, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (17, N'BGD', 2, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (18, N'BGD', 3, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'BGD', N'Ban Giám Đốc', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKD', N'Phòng kinh doanh', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKT', N'Phòng Kỹ thuật', NULL)
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKTo', N'Phòng Kế toán', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (0, N'Mới đặt hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Đã giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Khách hàng hủy đơn hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (3, N'Đã thanh toán Online', NULL)
SET IDENTITY_INSERT [dbo].[TrangWeb] ON 

INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (1, N'Trang chủ Admin', N'Default.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (2, N'Quản lý Đơn hàng', N'QLDonHang.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (3, N'Quản lý Hàng hóa', N'QLHangHoa.aspx')
SET IDENTITY_INSERT [dbo].[TrangWeb] OFF
SET IDENTITY_INSERT [dbo].[YeuThich] ON 

INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (1, 1001, N'nnghiem', CAST(N'2011-03-30T10:44:51.640' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (2, 1035, N'nnghiem', CAST(N'2011-03-30T10:45:02.537' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (3, 1055, N'nnghiem', CAST(N'2011-03-30T10:45:12.980' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (4, 1012, N'nnghiem', CAST(N'2011-03-30T10:45:29.777' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (5, 1003, N'nnghiem', CAST(N'2011-03-30T10:49:46.850' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (6, 1016, N'nnghiem', CAST(N'2011-03-30T13:25:31.610' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (7, 1062, N'nnghiem', CAST(N'2011-03-30T13:26:01.463' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (8, 1023, N'nnghiem', CAST(N'2011-03-30T13:27:39.413' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (9, 1042, N'nnghiem', CAST(N'2011-03-30T13:27:46.350' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (10, 1031, N'nnghiem', CAST(N'2011-03-30T16:03:32.667' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaHH], [MaKH], [NgayChon], [MoTa]) VALUES (11, 1003, N'nnghiem', CAST(N'2011-03-30T20:47:36.860' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[YeuThich] OFF
ALTER TABLE [dbo].[BanBe] ADD  CONSTRAINT [DF_Promotions_Sent]  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_NgayGY]  DEFAULT (getdate()) FOR [NgayGY]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_CanTraLoi]  DEFAULT ((0)) FOR [CanTraLoi]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [NgaySX]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Votes]  DEFAULT ((0)) FOR [SoLanXem]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_RequireDate]  DEFAULT (getdate()) FOR [NgayCan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippedDate]  DEFAULT (((1)/(1))/(1900)) FOR [NgayGiao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_PaymentMethod]  DEFAULT (N'Cash') FOR [CachThanhToan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippingMethod]  DEFAULT (N'Airline') FOR [CachVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [PhiVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [MaTrangThai]
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_NgayDua]  DEFAULT (getdate()) FOR [NgayDua]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Gender]  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Birthday]  DEFAULT (getdate()) FOR [NgaySinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Hinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)) FOR [HieuLuc]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_UserLevel]  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Them]  DEFAULT ((0)) FOR [Them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Sua]  DEFAULT ((0)) FOR [Sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xoa]  DEFAULT ((0)) FOR [Xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xem]  DEFAULT ((0)) FOR [Xem]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_KhachHang]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_QuangBa_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_QuangBa_HangHoa]
GO
ALTER TABLE [dbo].[ChuDe]  WITH CHECK ADD  CONSTRAINT [FK_ChuDe_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuDe] CHECK CONSTRAINT [FK_ChuDe_NhanVien]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_ChuDe]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
USE [master]
GO
ALTER DATABASE [MyeStore] SET  READ_WRITE 
GO
