USE [master]
GO
/****** Object:  Database [IMPOSTER]    Script Date: 15/12/2020 14:18:12 PM ******/
CREATE DATABASE [IMPOSTER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMPOSTER', FILENAME = N'D:\rdsdbdata\DATA\IMPOSTER.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'IMPOSTER_log', FILENAME = N'D:\rdsdbdata\DATA\IMPOSTER_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IMPOSTER] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMPOSTER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMPOSTER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IMPOSTER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IMPOSTER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IMPOSTER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IMPOSTER] SET ARITHABORT OFF 
GO
ALTER DATABASE [IMPOSTER] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IMPOSTER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IMPOSTER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IMPOSTER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IMPOSTER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IMPOSTER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IMPOSTER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IMPOSTER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IMPOSTER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IMPOSTER] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IMPOSTER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IMPOSTER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IMPOSTER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IMPOSTER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IMPOSTER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IMPOSTER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IMPOSTER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IMPOSTER] SET RECOVERY FULL 
GO
ALTER DATABASE [IMPOSTER] SET  MULTI_USER 
GO
ALTER DATABASE [IMPOSTER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IMPOSTER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IMPOSTER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IMPOSTER] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IMPOSTER] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IMPOSTER] SET QUERY_STORE = OFF
GO
USE [IMPOSTER]
GO
/****** Object:  User [admin]    Script Date: 15/12/2020 14:18:14 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 15/12/2020 14:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](max) NOT NULL,
	[TenTaiKhoan] [nvarchar](max) NOT NULL,
	[MatKhau] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachBanBe]    Script Date: 15/12/2020 14:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachBanBe](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung_Mot] [int] NOT NULL,
	[MaNguoiDung_Hai] [int] NOT NULL,
	[TrangThai] [tinyint] NOT NULL,
	[HoatDong] [int] NOT NULL,
 CONSTRAINT [PK_DanhSachBanBe_1] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 15/12/2020 14:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[SoDienThoai] [varchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[Password] [varchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhom]    Script Date: 15/12/2020 14:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhom](
	[MaNhom] [varchar](50) NOT NULL,
	[TenNhom] [nvarchar](50) NOT NULL,
	[TruongNhom] [int] NOT NULL,
 CONSTRAINT [PK_Nhom] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 15/12/2020 14:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaThanhVien] [nvarchar](50) NOT NULL,
	[MaNhom] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([MaAdmin], [HoTen], [TenTaiKhoan], [MatKhau]) VALUES (3, N'Tran Huynh Cong Loc', N'thcl', N'$2b$10$IHrjHQyPHDJv5OagNwEjZe24upWNwrQe75FcIazHu2gBb6VaKjqWC')
INSERT [dbo].[Admin] ([MaAdmin], [HoTen], [TenTaiKhoan], [MatKhau]) VALUES (5, N'Imposter', N'admin', N'$2b$10$b3pOtskkbNGv1k1E/xK/juh1IX73ZnkNcVz60uCBfLBKp/c5TNP9.')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachBanBe] ON 

INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (5972, 42, 60, 0, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (5974, 42, 63, 0, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (5975, 42, 66, 0, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (5976, 60, 66, 0, 60)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (5977, 1215, 66, 0, 1215)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (5982, 42, 7282, 1, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (5988, 61, 42, 1, 61)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (5997, 7282, 1215, 1, 7282)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6004, 1216, 103, 1, 1216)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6005, 42, 94, 1, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6006, 42, 93, 0, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6012, 42, 92, 0, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6013, 42, 89, 0, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6014, 42, 42, 0, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6016, 42, 99, 1, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6017, 1216, 105, 0, 1216)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6026, 81, 80, 1, 81)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6027, 1215, 81, 1, 1215)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6028, 102, 1216, 1, 102)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6029, 62, 1215, 1, 62)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6031, 62, 61, 1, 62)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6032, 102, 103, 1, 102)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6033, 42, 62, 1, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6043, 1215, 102, 0, 1215)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6048, 42, 1215, 0, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6049, 42, 102, 0, 42)
INSERT [dbo].[DanhSachBanBe] ([STT], [MaNguoiDung_Mot], [MaNguoiDung_Hai], [TrangThai], [HoatDong]) VALUES (6050, 42, 95, 0, 42)
SET IDENTITY_INSERT [dbo].[DanhSachBanBe] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (42, N'Tran Huynh Cong Loc', N'0847857790', CAST(N'1999-12-03' AS Date), 1, N'$2b$10$G9SGmv11Pvo7oT7ap6y0YuJX4u8yv4yZdhyQqRHjn//Uf2zs87gTa', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (60, N'Lam Hoang', N'0877940561', NULL, NULL, N'$2b$10$dL54taTwF1QQBt/jR5bmfenofKK0etTUc/5sqw1kzj6SXBpT.j01q', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (61, N'Vo Van Nghia', N'0877931429', NULL, NULL, N'$2b$10$yuHBz3JFDBBamM9HfCEZReYT2rbbwFvu6G55xbN2wN3B1N0X/KQU.', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (62, N'Chí Thông', N'0877945507', NULL, 1, N'$2b$10$WVuD/4DP7zUdNoZrd7mUi.m7nIGSna7CQCLBEg5APEtH4pq/hJ14W', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (63, N'Tran Nguyen Cam Tien', N'0877931482', NULL, NULL, N'$2b$10$IU9/RaGGnJ5hT/NAiVYlbeTH5Bi41oCqT7VyV51H1KRCb.ZhP6Z4G', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (64, N'Dinh Van Huu', N'0877932334', NULL, NULL, N'$2b$10$uUY5kWEbEjIPMjIJ2wA/d.3GvBDh47/gucWVhIwZD3g7216RHuD8K', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (65, N'Le Phuong', N'0877925613', NULL, NULL, N'$2b$10$eDcOjszqobwX3J95Uxji9eTBS.g6nKcSWB0EJesvL1bvqvDMxV6UK', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (66, N'Thanh Phuc', N'0877923064', NULL, 1, N'$2b$10$JTl/6Q3qWGWiodBpxtWe/u7O5aWrCh5GfqH9ytYvCSznJFPlY8QrG', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (67, N'Kim Ngan', N'0878322229', NULL, NULL, N'$2b$10$Y0/DUXbqGGl238r/V9q8B.8lheVq5at13CDpG/rfRs2g3gW5GdiWS', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (68, N'Duong', N'0878777712', NULL, NULL, N'$2b$10$IYl/XRtL3X7uSd4mAbscQu8IZjemV1g6Hj5SejcEzc5DudVsYoURG', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (69, N'To Hoai', N'0878777812', NULL, NULL, N'$2b$10$Y/Q0VMDK7bO9c.49zxXl.O50qzltcfqMF6eDfuPO/r8T.uiPKt3bm', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (70, N'Bray', N'0879633330', NULL, NULL, N'$2b$10$Y54m/qWgx.YiIiHw94AJ7OPAT7/ne.F0eEn4hSeCTvh7imb/H5w9e', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (71, N'RichChoi', N'0879633334', NULL, NULL, N'$2b$10$sDB/1XEwovcUjaBd6IjMJetyyPC0wszGbX.ONuUPHAsvlatNurodG', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (72, N'Blackka', N'0879644442', NULL, NULL, N'$2b$10$vWJElhYl5J8E5KrjD8dbvOgqr3rLPOCMa6xw0XHEPS6xOEFMdKdA.', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (73, N'Nguyen Minh Hang', N'0878632330', NULL, NULL, N'$2b$10$Ga6726Fs6YBMwei5ICr7.ObkWa9p7JIqt/9vjw7G/FhyP7J4cBYti', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (74, N'Nguyen Duc Thien', N'0879622228', NULL, NULL, N'$2b$10$f4DdFCSOKBzOjBRATW1X2udIzX8caJPEEnIiOekVgbw3wm1UVCHKe', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (75, N'Van Quyet', N'0879755554', NULL, NULL, N'$2b$10$HqK3QYLzMJMmTuVUo7in/O/JhTJ5vPTMUdcws25NXimVVJzAwBxnq', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (77, N'Tran Le Long Ho', N'0879155553', NULL, NULL, N'$2b$10$0utoJx.kRa3FZxqxPSEfku851YcK4YyrnnTDT3H4o2WtQsfruzSTq', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (79, N'Park Cheayoung', N'0879797979', NULL, NULL, N'$2b$10$2MPHCaafoTsRRarP7fHydOu/ueVhsPyDKOoF0vzHBRU6kFXM1kIH.', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (80, N'Nhu Phuong', N'0879777730', NULL, NULL, N'$2b$10$HLLnIfDpxW/2dRdOG3Dvo.I4jb4q8/iszDTOmVO8c/x41PuyRHpZK', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (81, N'Mai Huong', N'0879777829', NULL, NULL, N'$2b$10$T6hL9ganvJXUUY5KQFma/uEz/jlQfqNUiib0GDqn7Go6g1zBMpBd6', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (82, N'Wowy', N'0879767829', NULL, NULL, N'$2b$10$bpXYnrgyINenQYFL8fpxzOzkft5J2Rhld6SMABqGzDWIrTP33PSiy', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (83, N'Nguyen Ngoc Nhi', N'0877677829', NULL, NULL, N'$2b$10$y08RV6Xz.HbmAX9Z7hI/bOCFzt2cBkHy7R4KszDkN40cOM4WrLdaW', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (84, N'Vu Pham Dinh Ngan', N'0879557729', NULL, NULL, N'$2b$10$61N5kJ.NifjbCgsiQDLyIOWDGtU7l4AiUb2BQHhDX9eQjDjGKZx2q', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (85, N'Cam', N'0879658425', NULL, NULL, N'$2b$10$dMsogROPeEewx2Nfqj7pT.t6Y0WTjKf5K3G.dD8kZT4R15Tdr9Egu', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (86, N'Leesin', N'0879666624', NULL, NULL, N'$2b$10$Ex0/mmsIqjZZwrauZvKXmOOyDaoUn62tDsBJ1SJVb3Ar4S4e7r/7S', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (87, N'Yasuo', N'0848485845', NULL, NULL, N'$2b$10$fZNh63u/ZMPLukw6CpwmXObSkWheeXZy590EfNMgHlJBsGLiHwZwG', 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (88, N'DienThoaiDiDong', N'0808909402', NULL, NULL, N'$2b$10$IQxXHtgAVkXz0Sx1aIswGuJhQlO.DYZ6nkyk5mH2mVblbBAq4QKEe', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (89, N'Thanh Luan', N'0878277773', CAST(N'2013-12-05' AS Date), 1, N'$2b$10$d1C79xrMIhvdtHHDXrjL9uShroD0T40obeRrp1aUluRhRrXoNhGIy', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (90, N'Nguyen Duc Nam', N'0878777753', NULL, NULL, N'$2b$10$rmcxkmdiN1zmI91mCFkNHe/8jySgNQ1dDOIizCnchTJJbkFDA.AyS', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (91, N'Teacher Ba', N'0878555537', CAST(N'2000-11-18' AS Date), 1, N'$2b$10$vux/.YtLU7FT3fLHhTCcRurUmDuf7BT/PB2VDNnrs6j5NO77RFMaO', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (92, N'Sena', N'0840521231', NULL, NULL, N'$2b$10$4Jz2jrDqgRk./UaycZl/AOHv9guT4grPFskSYgz4Ui4jNuVJvMiHa', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (93, N'Nguyen Vo Hung Minh', N'0951564258', NULL, NULL, N'$2b$10$JxPqncL4y0MGG4WoapAYOu9oLmi3XiOd6ChLHqsum/54QRUcHdg1K', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (94, N'Nguyen Hoang Cam Tien', N'0875621745', NULL, NULL, N'$2b$10$V4.eEhJfUj1EBoWP0MTNBOdCRD.nro/abar4Xc.JQ.j97WyI/Ti2u', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (95, N'Thanh Thuy', N'0352391920', NULL, NULL, N'$2b$10$lxkRfDzOblq6Y2VyNEekruYYCcRDkEsotPWnL.kVfHMscnVB0LFai', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (100, N'Thanh Quy Demo', N'0877940563', NULL, NULL, N'$2b$10$RuS68jPPihun7QeYbfNrjuIErF86bTu.HvS5m3N0eaLeIhLRPP//G', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (102, N'Nguyen Thong', N'0339310762', NULL, NULL, N'$2b$10$myCfLPlQVj2nfXvTe0/yO.jWuf3mHF4qU2yUTSyfKzV7pvcX3lOrO', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (103, N'Nguyen Van Thong', N'0339310761', NULL, NULL, N'$2b$10$.OF83.8E3BHmV4qPQoJsv.Nptqoeg1jN8PZyq6MoadQaoX.v5waL.', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (104, N'Tran Van Ngan', N'0339310722', NULL, NULL, N'$2b$10$wl6ExdxEFzUn0PfIXM11BurOcvDgs0KvsanwBim8ZXCxN4RD.tBkW', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (105, N'Nguyen Lebron', N'0339685967', NULL, NULL, N'$2b$10$3bXV3rL.7BC.yqvv5mPzye7rkMsQEkuyeJ.Q2Da5FUgrVwE6utkzW', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (106, N'Lee Chong Wei', N'0339310897', NULL, NULL, N'$2b$10$KHgyAO3cuE9cvGfb3CbYsui1Kk3iEFScyERR/kkwsChBz1HJqSExW', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (107, N'Lin Dan Chan', N'0339310742', NULL, NULL, N'$2b$10$NeegFv/6oXiqJd.YquUbg.jRIshtMpOyxTsBjbLTragowenpHiu6e', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (108, N'Stephen Curry', N'0339687896', NULL, NULL, N'$2b$10$LmrMWpkO1xLjwBMi5.WrK.LE79lL0LYU7kAcXijSUTnuu.6KHc6qS', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (1215, N'Đỗ Thành Quý', N'0362676612', CAST(N'1999-04-14' AS Date), 1, N'$2b$10$r0KCkNykTpwFcmrZkW5wOu59lh9fxQ286eV3oGOVkffmoUQyPySMO', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (1216, N'Nguyen Thong Dinh', N'0114115116', NULL, NULL, N'$2b$10$q/1I2jkctUIyNWodsEPosuPdfFSGzEufJk.7iuSrnZxlxHPg3PD36', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (1217, N'Abc', N'0112113114', NULL, NULL, N'$2b$10$yyRWVmQCvVN66uY2fEpqGu8kMY95ROBveOmH40C/Xm.8qLgTf4O5C', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (7275, N'Phu Le', N'0869203485', NULL, NULL, N'$2b$10$CyvWGw6x1qVhEptURs8Heul8IhGvaDd7j2qJ9ZCmgOKqZb4BHXDNK', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (7276, N'Lisa', N'0879333308', NULL, NULL, N'$2b$10$xP.sIvMWb8kBNZj99IrBQeENw8V1KH33pu69cwS3/FnGJ8GH77cNu', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (7277, N'Rose', N'0879333354', NULL, NULL, N'$2b$10$pWmtYH3S.YC3pX270nDhd.hfxTSpdHoPXDYuAgRgjwRtWD8gWe3na', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (7278, N'Jennie', N'0877555526', NULL, NULL, N'$2b$10$aKSq76t5iiPU75zZk2ZGKeQ.YS.X8opd31dNMKa57K5JtM/1qOTpK', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (7279, N'Jisoo', N'0877222245', NULL, NULL, N'$2b$10$ZFLxpAShN7Io62g9SwrKxOPyWbNJiSsesxLsbf4FdbfZSCjPMzlRe', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (7282, N'Dương Thị Thu Hà', N'0362676611', NULL, 0, N'$2b$10$dsorvFQfET5DYtDtUVAD0umgax4yMsNRvy5dSpubewg.Tzl5Ja8NC', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (7283, N'Nguyen Dinh Thonggggg', N'0984161519', NULL, NULL, N'$2b$10$s8DwnrWbL.YsD.7eY/WSluVqYj1jcy251kmsi7jNlE2L2t2ILXgJW', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoDienThoai], [NgaySinh], [GioiTinh], [Password], [Status]) VALUES (7284, N'Nguyen Van Nam', N'0116118110', NULL, NULL, N'$2b$10$MxPOYSJ96nOZtlyWACFugetuPn7uuopkUZOjQxnUioQoSR.9UzX6q', 1)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607787469811', N'Zalo 3', 1215)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607951879185', N'abc', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607952064778', N'Zalo 1', 7282)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607953769533', N'xyz', 1216)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607953788292', N'zalo 2', 42)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607953849250', N'zalo 4', 42)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607954122920', N'abcd', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607954158681', N'abcdgbf', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607954464600', N'zaloooo', 62)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607954650651', N'demommm', 1216)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607954672257', N'zolaa', 61)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607954689113', N'lloo', 62)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607954724236', N'ffgffffffffffffffffffffff', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607954764454', N'hkflfl', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607955182805', N'qwe', 1215)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607955200791', N'tu', 1215)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607955267560', N'demo 1123', 62)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607955357424', N'3344', 1215)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607955447097', N'lllllllll', 62)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607960910534', N'thonggggggggg', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607960919110', N'thongggggggggggggggggggggg', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607961129692', N'tessttttttttttttttttttttttt', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607961357286', N'kkkkkkkkkkkkkkkkkkk', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1607964272713', N'rtuijjjjj', 102)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1608014205879', N'Chat CNM', 1216)
INSERT [dbo].[Nhom] ([MaNhom], [TenNhom], [TruongNhom]) VALUES (N'1608014236869', N'Chat CNM', 1216)
GO
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (67, N'7282', N'1607787469811')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (75, N'42', N'1607787469811')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (76, N'62', N'1607787469811')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (77, N'42', N'1607952064778')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (78, N'1215', N'1607952064778')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (79, N'7282', N'1607953788292')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (80, N'1215', N'1607953788292')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (81, N'1215', N'1607953849250')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (82, N'7282', N'1607953849250')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (83, N'94', N'1607953849250')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (84, N'62', N'1607953849250')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (85, N'103', N'1607954158681')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (86, N'1216', N'1607954158681')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (87, N'42', N'1607954464600')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (88, N'1215', N'1607954464600')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (89, N'103', N'1607954724236')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (90, N'1216', N'1607954724236')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (91, N'103', N'1607954764454')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (92, N'1216', N'1607954764454')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (93, N'62', N'1607955182805')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (94, N'81', N'1607955182805')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (95, N'42', N'1607955200791')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (96, N'62', N'1607955200791')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (97, N'81', N'1607955200791')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (98, N'7282', N'1607955200791')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (99, N'42', N'1607955267560')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (100, N'61', N'1607955267560')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (101, N'1215', N'1607955267560')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (102, N'81', N'1607955357424')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (103, N'7282', N'1607955357424')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (104, N'42', N'1607955447097')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (105, N'61', N'1607955447097')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (106, N'1215', N'1607955447097')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (107, N'103', N'1607960910534')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (108, N'1216', N'1607960910534')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (109, N'103', N'1607960919110')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (110, N'1216', N'1607960919110')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (111, N'103', N'1607961357286')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (112, N'1216', N'1607961357286')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (113, N'103', N'1607964272713')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (114, N'1216', N'1607964272713')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (115, N'102', N'1608014236869')
INSERT [dbo].[ThanhVien] ([STT], [MaThanhVien], [MaNhom]) VALUES (116, N'103', N'1608014236869')
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [df_status]  DEFAULT ('1') FOR [Status]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_Nhom] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[Nhom] ([MaNhom])
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_Nhom]
GO
/****** Object:  StoredProcedure [dbo].[CheckTrungMa]    Script Date: 15/12/2020 14:18:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CheckTrungMa] (@Ma_1 int, @Ma_2 int)
AS
	if (not exists (select * from DanhSachBanBe where ( MaNguoiDung_Mot = @Ma_1 and MaNguoiDung_Hai = @Ma_2 ) OR (MaNguoiDung_Mot = @Ma_2 AND MaNguoiDung_Hai = @Ma_1) ))
		begin
			INSERT INTO DanhSachBanBe(MaNguoiDung_Mot, MaNguoiDung_Hai, TrangThai, HoatDong) Values (@Ma_1, @Ma_2, 0, @Ma_1)
		end
GO
USE [master]
GO
ALTER DATABASE [IMPOSTER] SET  READ_WRITE 
GO
