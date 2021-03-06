USE [QuanLiGiaoDich]
GO
/****** Object:  Table [dbo].[CoPhieu]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoPhieu](
	[MaCP] [varchar](50) NOT NULL,
	[MaSan] [varchar](50) NOT NULL,
	[TenCT] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[DiaChiWeb] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[SLCoPhieu] [float] NULL,
 CONSTRAINT [PK__CongTy__27258E087B16D581] PRIMARY KEY CLUSTERED 
(
	[MaCP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiaThamChieu]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiaThamChieu](
	[MaCP] [varchar](50) NOT NULL,
	[NgayGD] [date] NOT NULL CONSTRAINT [DF_GiaThamChieu_NgayGD]  DEFAULT (getdate()),
	[GiaTC] [float] NOT NULL,
 CONSTRAINT [PK_CoPhieu] PRIMARY KEY CLUSTERED 
(
	[MaCP] ASC,
	[NgayGD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LenhDat]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LenhDat](
	[MaLenh] [varchar](50) NOT NULL,
	[MaTKNH] [varchar](50) NOT NULL,
	[MaCP] [varchar](50) NOT NULL,
	[LoaiGD] [varchar](4) NULL,
	[SLDat] [int] NULL,
	[NgayGioDat] [datetime] NULL,
	[MaLoaiLenh] [varchar](50) NOT NULL,
	[MaTrangThai] [varchar](50) NOT NULL CONSTRAINT [DF_DatLenh_TrangThai]  DEFAULT ('ChoKhop'),
	[GiaDat] [float] NOT NULL,
 CONSTRAINT [PK_DatLenh_1] PRIMARY KEY CLUSTERED 
(
	[MaLenh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LenhKhop]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LenhKhop](
	[MaLenh] [varchar](50) NOT NULL CONSTRAINT [DF_LenhKhop_MaLenh]  DEFAULT (N'Chưa Chuyển'),
	[NgayGioKhop] [datetime] NOT NULL,
	[GiaKhop] [float] NULL,
	[SoLgKhop] [int] NULL,
	[TrangThai] [nvarchar](50) NULL CONSTRAINT [DF_LenhKhop_TrangThai]  DEFAULT ('ChuaChuy?n'),
 CONSTRAINT [PK_ChiTietKhopLenh] PRIMARY KEY CLUSTERED 
(
	[MaLenh] ASC,
	[NgayGioKhop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LenhUng]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LenhUng](
	[ID] [varchar](50) NOT NULL,
	[MaTKNH] [varchar](50) NOT NULL,
	[NgayYeuCau] [date] NOT NULL,
	[NgayBan] [date] NOT NULL,
	[SoTienUng] [float] NULL,
	[Phi] [float] NULL,
	[MaCP] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UngTienBanCP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiLenh]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiLenh](
	[MaLoaiLenh] [varchar](50) NOT NULL,
	[DienGiai] [ntext] NULL,
	[ThoiGian] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiLenh] PRIMARY KEY CLUSTERED 
(
	[MaLoaiLenh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NganHang]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NganHang](
	[MaNH] [varchar](50) NOT NULL,
	[TenNH] [varchar](50) NULL,
 CONSTRAINT [PK_NganHang_1] PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaDauTu]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaDauTu](
	[MaTK] [varchar](50) NOT NULL,
	[Ho] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[NoiSinh] [nvarchar](50) NULL,
	[Phai] [nvarchar](50) NOT NULL CONSTRAINT [DF_NhaDauTu_Phai]  DEFAULT (N'Nam'),
	[DiaChi] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[SDT] [varchar](50) NOT NULL,
	[CMND] [varchar](50) NOT NULL,
	[NgayCap] [date] NULL CONSTRAINT [DF_NhaDauTu_NgayCap]  DEFAULT (getdate()),
	[NoiCap] [nvarchar](50) NULL,
	[TrNgNc] [nvarchar](50) NOT NULL CONSTRAINT [DF_NhaDauTu_TrNgNc]  DEFAULT (N'Trong Nước'),
	[MMGD] [varchar](50) NOT NULL CONSTRAINT [DF_NhaDauTu_MMGD]  DEFAULT ((123456789)),
	[MKDL] [varchar](50) NOT NULL CONSTRAINT [DF_NhaDauTu_MKDL]  DEFAULT ((123456789)),
 CONSTRAINT [PK_NhaDauTu] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanGiaoDich]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanGiaoDich](
	[MaSan] [varchar](50) NOT NULL,
	[TenSan] [varchar](50) NOT NULL,
	[BienDoGia] [float] NOT NULL,
	[BuocGiaDatLenh] [int] NOT NULL,
	[LoLechToiThieu] [int] NOT NULL,
 CONSTRAINT [PK__SanGiaoD__3188C826AFED4B7F] PRIMARY KEY CLUSTERED 
(
	[MaSan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SoHuu]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SoHuu](
	[MaTK] [varchar](50) NOT NULL,
	[MaCP] [varchar](50) NOT NULL,
	[SoLg] [int] NULL,
 CONSTRAINT [PK_LuuKy_1] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC,
	[MaCP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TKNH]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TKNH](
	[MaTKNH] [varchar](50) NOT NULL,
	[MaTK] [varchar](50) NOT NULL,
	[MaNH] [varchar](50) NULL,
	[SoTien] [float] NOT NULL CONSTRAINT [DF_TKNH_SoTien]  DEFAULT ((0)),
 CONSTRAINT [PK_NganHang] PRIMARY KEY CLUSTERED 
(
	[MaTKNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [varchar](50) NOT NULL,
	[DienGiai] [ntext] NULL,
	[TenTrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'333', N'HNX', N'xxxwww', N'chung cu c3', N'0909999666', N'111444771', N'www.aaaxxx.com', N'dwss@gmail.com', 2000)
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'AAA', N'HSX', N'Công ty Cổ phần Nhựa An Phát Xanh', N'An Đong Industrial Park, Nam Sach Dist, Hai Duong Prov', N'84-220-3.755.997', N'36612134', N'www.anphatplastic.com', N'anphat@anphatbioplastics.com', 200000)
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'AAB', N'HNX', N'AAB', N'HN', N'012345697', N'7896541230', N'www.AAB.com', N'AAB@gmail.com', 20000)
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'AAM', N'HSX', N'Công ty Cổ phần Thủy sản Mekong', N'Khu Công Nghiệp Trà Nóc, Thành Phố Cần Thơ', N'842 027', N' 841 192 - 843 236', N'www.mekongfish.vn', N'mkf@hcm.vnn.vn', 123460)
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'ATT', N'HNX', N'ATT', N'HN', N'0123456123', N'3318-5512', N'www.aat.com', N'aat@gmail.com', 50000)
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'BBC', N'HNX', N'BBC', N'Tây Nguyên', N'45698722345', N'7896541258', N'www.BBC.com', N'bbc@gmail.com', 20000)
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'BNM', N'HNX', N'BNM', N'Đà Nẵng', N'7896542581', N'78965435710', N'www.bnm.com', N'bnm@gmail.com', 50000)
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'PAA', N'HNX', N'PAAAAA', N'Lâm Đồng', N'0123456789', N'12345678947', N'www.PAA.com', N'PAA@gmail.com', 500000)
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'PHN', N'HNX', N'CTCP Pin Hà Nội', N'Số 72 đường Phan Trọng Tuệ, thị trấn Văn Điển, huyện Thanh Trì', N'024.38615365', N'3.8612549', N'www.habaco.com.vn', N' habaco@habaco.com.vn ', 253000)
INSERT [dbo].[CoPhieu] ([MaCP], [MaSan], [TenCT], [DiaChi], [SDT], [Fax], [DiaChiWeb], [Email], [SLCoPhieu]) VALUES (N'PIA', N'HNX', N'CTCP Tin học Viễn thông Petrolimex', N'Số 1 Khâm Thiên, phường Khâm Thiên, quận Đống Đa, Hà Nội', N'0435182072', N'3851-9203', N'www.piacom.petrolimex.com.vn', N' banbientapweb@petrolimex.com.vn', 390000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAA', CAST(N'2019-10-19' AS Date), 8300)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAA', CAST(N'2019-10-20' AS Date), 9200)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAA', CAST(N'2019-10-21' AS Date), 9500)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAA', CAST(N'2019-11-08' AS Date), 12000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAA', CAST(N'2019-11-09' AS Date), 13000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAA', CAST(N'2019-11-11' AS Date), 15000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAA', CAST(N'2019-11-12' AS Date), 17000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAB', CAST(N'2019-11-12' AS Date), 25000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAM', CAST(N'2019-10-10' AS Date), 9200)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAM', CAST(N'2019-10-20' AS Date), 14000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAM', CAST(N'2019-11-07' AS Date), 9700)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAM', CAST(N'2019-11-08' AS Date), 14000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAM', CAST(N'2019-11-09' AS Date), 15000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAM', CAST(N'2019-11-11' AS Date), 14000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'AAM', CAST(N'2019-11-12' AS Date), 20000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'BBC', CAST(N'2019-11-12' AS Date), 25000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'BNM', CAST(N'2019-11-12' AS Date), 40000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PAA', CAST(N'2019-11-11' AS Date), 12000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PAA', CAST(N'2019-11-12' AS Date), 12000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PHN', CAST(N'2019-10-20' AS Date), 10500)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PHN', CAST(N'2019-11-06' AS Date), 12000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PHN', CAST(N'2019-11-07' AS Date), 15000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PHN', CAST(N'2019-11-08' AS Date), 14000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PHN', CAST(N'2019-11-09' AS Date), 17000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PHN', CAST(N'2019-11-11' AS Date), 17000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PHN', CAST(N'2019-11-12' AS Date), 15000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PIA', CAST(N'2019-10-17' AS Date), 11600)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PIA', CAST(N'2019-10-19' AS Date), 16000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PIA', CAST(N'2019-10-20' AS Date), 21000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PIA', CAST(N'2019-11-08' AS Date), 25000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PIA', CAST(N'2019-11-09' AS Date), 20000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PIA', CAST(N'2019-11-11' AS Date), 22000)
INSERT [dbo].[GiaThamChieu] ([MaCP], [NgayGD], [GiaTC]) VALUES (N'PIA', CAST(N'2019-11-12' AS Date), 22000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B200001', N'SCB1', N'AAA', N'Ban', 500, CAST(N'2019-11-08 21:38:00.000' AS DateTime), N'LO', N'KH', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B430129', N'VTB1', N'AAA', N'Ban', 700, CAST(N'2019-11-10 22:43:00.000' AS DateTime), N'LO', N'KH', 14000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B450673', N'VTB1', N'AAM', N'Ban', 700, CAST(N'2019-11-10 22:16:00.000' AS DateTime), N'LO', N'KH', 13300)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B468021', N'VTB1', N'AAA', N'Ban', 1000, CAST(N'2019-11-12 22:15:00.000' AS DateTime), N'LO', N'DH', 13300)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B598369', N'VTB2', N'AAA', N'Ban', 200, CAST(N'2019-11-07 12:00:00.000' AS DateTime), N'LO', N'KH', 11000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B601071', N'VTB1', N'AAA', N'Ban', 100, CAST(N'2019-11-06 18:47:00.000' AS DateTime), N'LO', N'CAK', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B672669', N'VTB1', N'AAA', N'Ban', 1000, CAST(N'2019-11-12 22:37:00.000' AS DateTime), N'LO', N'DH', 15000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B68296', N'VTB1', N'AAA', N'Ban', 1000, CAST(N'2019-11-09 14:56:00.000' AS DateTime), N'LO', N'CAK', 15000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B699548', N'ARB2', N'AAA', N'Ban', 300, CAST(N'2019-11-12 16:14:00.000' AS DateTime), N'LO', N'KH', 14000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B81201', N'SCB1', N'AAA', N'Ban', 4000, CAST(N'2019-11-08 21:37:00.000' AS DateTime), N'LO', N'DH', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B851001', N'SCB1', N'AAM', N'Ban', 500, CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'LO', N'KH', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'B898336', N'SCB1', N'AAA', N'Ban', 1000, CAST(N'2019-11-09 20:36:00.000' AS DateTime), N'LO', N'DH', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M126181', N'SCB1', N'AAA', N'Mua', 1000, CAST(N'2019-11-09 14:54:00.000' AS DateTime), N'LO', N'CAK', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M127409', N'ARB2', N'AAM', N'Mua', 200, CAST(N'2019-11-12 22:12:00.000' AS DateTime), N'LO', N'KH', 13500)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M144959', N'SCB1', N'AAA', N'Mua', 500, CAST(N'2019-11-06 22:48:00.000' AS DateTime), N'LO', N'CAK', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M149164', N'ARB2', N'PAA', N'Mua', 10, CAST(N'2019-11-09 01:18:00.000' AS DateTime), N'LO', N'CAK', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M224621', N'SCB1', N'PIA', N'Mua', 1000, CAST(N'2019-12-05 22:20:00.000' AS DateTime), N'LO', N'DH', 1000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M256534', N'SCB3', N'PIA', N'Mua', 500, CAST(N'2019-11-09 01:12:00.000' AS DateTime), N'LO', N'CAK', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M308823', N'SCB5', N'PAA', N'Mua', 500, CAST(N'2019-11-13 22:14:00.000' AS DateTime), N'LO', N'DH', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M342176', N'SCB5', N'AAM', N'Mua', 50, CAST(N'2019-11-10 00:51:00.000' AS DateTime), N'LO', N'DH', 10000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M413357', N'VTB1', N'AAM', N'Mua', 500, CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'LO', N'KH', 14000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M43177', N'SCB3', N'AAA', N'Mua', 200, CAST(N'2019-11-09 14:59:00.000' AS DateTime), N'LO', N'KH', 15000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M47050', N'VTB1', N'AAA', N'Mua', 500, CAST(N'2019-11-08 21:39:00.000' AS DateTime), N'LO', N'KH', 13000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M533676', N'ARB2', N'AAA', N'Mua', 500, CAST(N'2019-11-12 22:40:00.000' AS DateTime), N'LO', N'KH', 15000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M587812', N'SCB1', N'AAB', N'Mua', 200, CAST(N'2019-11-12 15:47:00.000' AS DateTime), N'LO', N'DH', 14)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M601071', N'123123', N'333', N'Mua', 100, CAST(N'2021-01-07 14:28:00.000' AS DateTime), N'LO', N'CK', 10000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M605731', N'ARB2', N'AAA', N'Mua', 200, CAST(N'2019-11-10 22:45:00.000' AS DateTime), N'LO', N'KH', 14500)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M6785', N'SCB1', N'AAA', N'Mua', 100, CAST(N'2019-11-12 22:10:00.000' AS DateTime), N'LO', N'KH', 14000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M68296', N'SCB5', N'PIA', N'Mua', 100, CAST(N'2019-11-10 00:50:00.000' AS DateTime), N'LO', N'DH', 10000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M757148 ', N'SCB1', N'AAA', N'Mua', 100, CAST(N'2019-05-06 00:00:00.000' AS DateTime), N'LO', N'CAK', 13000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M804405', N'ARB2', N'AAA', N'Mua', 100, CAST(N'2019-11-11 11:06:00.000' AS DateTime), N'LO', N'CAK', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M812445', N'ARB2', N'AAA', N'Mua', 500, CAST(N'2019-11-09 01:08:00.000' AS DateTime), N'LO', N'KH', 15000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M860679', N'SCB1', N'AAA', N'Mua', 500, CAST(N'2019-11-06 22:52:00.000' AS DateTime), N'LO', N'CAK', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M898336', N'ARB1', N'AAA', N'Mua', 500, CAST(N'2019-11-08 22:38:00.000' AS DateTime), N'LO', N'KH', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M900321', N'SCB1', N'AAA', N'Mua', 200, CAST(N'2019-11-12 16:12:00.000' AS DateTime), N'LO', N'KH', 15000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M947251', N'ARB2', N'AAM', N'Mua', 500, CAST(N'2019-11-12 22:38:00.000' AS DateTime), N'LO', N'KH', 14000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M953474', N'ARB2', N'PHN', N'Mua', 100, CAST(N'2019-11-09 01:17:00.000' AS DateTime), N'LO', N'DH', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M960968', N'SCB1', N'AAA', N'Mua', 20, CAST(N'2019-11-12 15:25:00.000' AS DateTime), N'LO', N'DH', 14000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M962382', N'ARB2', N'AAA', N'Mua', 500, CAST(N'2019-11-09 01:05:00.000' AS DateTime), N'LO', N'KH', 15000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M971125', N'SCB1', N'AAA', N'Mua', 200, CAST(N'2019-11-07 00:00:00.000' AS DateTime), N'LO', N'KH', 12000)
INSERT [dbo].[LenhDat] ([MaLenh], [MaTKNH], [MaCP], [LoaiGD], [SLDat], [NgayGioDat], [MaLoaiLenh], [MaTrangThai], [GiaDat]) VALUES (N'M981093', N'VTB1', N'AAM', N'Mua', 500, CAST(N'2019-11-12 22:16:00.000' AS DateTime), N'LO', N'CAK', 13300)
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'B200001', CAST(N'2019-11-08 21:38:00.000' AS DateTime), 12000, 500, N'Ðã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'B430129', CAST(N'2019-11-10 22:44:00.000' AS DateTime), 14000, 500, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'B430129', CAST(N'2019-11-10 22:46:00.000' AS DateTime), 14500, 200, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'B450673', CAST(N'2019-11-10 22:40:27.000' AS DateTime), 14000, 500, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'B450673', CAST(N'2019-11-12 22:18:11.000' AS DateTime), 13300, 200, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'B598369', CAST(N'2019-11-07 12:40:00.000' AS DateTime), 12000, 200, N'Ðã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'B699548', CAST(N'2019-11-10 16:17:00.000' AS DateTime), 14000, 200, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'B699548', CAST(N'2019-11-12 22:11:38.000' AS DateTime), 14000, 100, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'B851001', CAST(N'2019-05-06 00:00:00.000' AS DateTime), 12000, 500, N'Ðã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M127409', CAST(N'2019-11-12 22:18:11.000' AS DateTime), 13300, 200, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M413357', CAST(N'2019-05-06 00:00:00.000' AS DateTime), 12000, 500, N'Ðã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M43177', CAST(N'2019-11-09 15:00:00.000' AS DateTime), 15000, 200, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M47050', CAST(N'2019-11-08 22:19:00.000' AS DateTime), 12000, 500, N'Ðã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M533676', CAST(N'2019-11-12 22:44:00.000' AS DateTime), 14000, 500, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M605731', CAST(N'2019-11-10 22:46:00.000' AS DateTime), 14500, 200, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M6785', CAST(N'2019-11-12 22:11:38.000' AS DateTime), 14000, 100, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M812445', CAST(N'2019-11-09 01:09:00.000' AS DateTime), 12000, 500, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M898336', CAST(N'2019-11-08 22:39:00.000' AS DateTime), 12000, 500, N'Ðã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M900321', CAST(N'2019-11-10 16:17:00.000' AS DateTime), 14000, 200, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M947251', CAST(N'2019-11-12 22:40:27.000' AS DateTime), 14000, 500, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M962382', CAST(N'2019-11-09 01:08:00.000' AS DateTime), 12000, 500, N'Đã Chuyển')
INSERT [dbo].[LenhKhop] ([MaLenh], [NgayGioKhop], [GiaKhop], [SoLgKhop], [TrangThai]) VALUES (N'M971125', CAST(N'2019-11-07 12:40:00.000' AS DateTime), 12000, 200, N'Ðã Chuyển')
INSERT [dbo].[LoaiLenh] ([MaLoaiLenh], [DienGiai], [ThoiGian]) VALUES (N'ATC', N'Là lệnh đặt mua hoặc đặt bán chứng khoán tại mức giá đóng cửa', N'14h30’ đến 14h45’')
INSERT [dbo].[LoaiLenh] ([MaLoaiLenh], [DienGiai], [ThoiGian]) VALUES (N'ATO', N'Là lệnh đặt mua hoặc đặt bán chứng khoán tại mức giá mở cửa', N'9h00’ đến 9h15’')
INSERT [dbo].[LoaiLenh] ([MaLoaiLenh], [DienGiai], [ThoiGian]) VALUES (N'LO', N'Lệnh mua hoặc lệnh bán chứng khoán tại một mức giá xác định hoặc  tốt hơn', N'9h00'' đến 15h00''')
INSERT [dbo].[NganHang] ([MaNH], [TenNH]) VALUES (N'ARB', N'Aribank')
INSERT [dbo].[NganHang] ([MaNH], [TenNH]) VALUES (N'SCB', N'Sacombank')
INSERT [dbo].[NganHang] ([MaNH], [TenNH]) VALUES (N'SGB', N'SaiGonBank')
INSERT [dbo].[NganHang] ([MaNH], [TenNH]) VALUES (N'VTB', N'Vietinbank')
INSERT [dbo].[NhaDauTu] ([MaTK], [Ho], [Ten], [NgaySinh], [NoiSinh], [Phai], [DiaChi], [Email], [SDT], [CMND], [NgayCap], [NoiCap], [TrNgNc], [MMGD], [MKDL]) VALUES (N'123', N'Nguyen Thi', N'A', CAST(N'2000-04-16' AS Date), N'HN', N'Nữ', N'HCN', N'nguyen1@gamil.com', N'0123456785', N'123456897', CAST(N'2015-01-01' AS Date), N'HCM', N'Trong Nước', N'123456', N'123456')
INSERT [dbo].[NhaDauTu] ([MaTK], [Ho], [Ten], [NgaySinh], [NoiSinh], [Phai], [DiaChi], [Email], [SDT], [CMND], [NgayCap], [NoiCap], [TrNgNc], [MMGD], [MKDL]) VALUES (N'124', N'Nguyen Van', N'B', CAST(N'1995-10-07' AS Date), N'HN', N'Nam', N'HN', N'nguyen2@gamil.com', N'0123457789', N'123457654', CAST(N'2008-05-11' AS Date), N'HN', N'Trong Nước', N'123456', N'123456')
INSERT [dbo].[NhaDauTu] ([MaTK], [Ho], [Ten], [NgaySinh], [NoiSinh], [Phai], [DiaChi], [Email], [SDT], [CMND], [NgayCap], [NoiCap], [TrNgNc], [MMGD], [MKDL]) VALUES (N'125', N'Nguyen Van', N'C', CAST(N'1988-09-08' AS Date), N'DN', N'Nam', N'DN', N'nguyen3@gamil.com', N'0123458789', N'123458321', CAST(N'1999-11-12' AS Date), N'DN', N'Trong Nước', N'123456', N'123456')
INSERT [dbo].[NhaDauTu] ([MaTK], [Ho], [Ten], [NgaySinh], [NoiSinh], [Phai], [DiaChi], [Email], [SDT], [CMND], [NgayCap], [NoiCap], [TrNgNc], [MMGD], [MKDL]) VALUES (N'126', N'Nguyen Van', N'D', CAST(N'1989-09-02' AS Date), N'HCM', N'Nữ', N'HCM', N'nguyen4@gmail.com', N'0123459789', N'123789123', CAST(N'2000-12-30' AS Date), N'HCM', N'Trong Nước', N'123456', N'123456')
INSERT [dbo].[NhaDauTu] ([MaTK], [Ho], [Ten], [NgaySinh], [NoiSinh], [Phai], [DiaChi], [Email], [SDT], [CMND], [NgayCap], [NoiCap], [TrNgNc], [MMGD], [MKDL]) VALUES (N'148', N'Nguyễn Văn', N'T', CAST(N'2003-01-01' AS Date), N'Tây Nguyên', N'Nam', N'Tây Nguyên', N'tai@gmail.com', N'0123456789', N'123456789', CAST(N'2018-01-01' AS Date), N'Tây Nguyên', N'Trong Nước', N'123456789', N'123456789')
INSERT [dbo].[NhaDauTu] ([MaTK], [Ho], [Ten], [NgaySinh], [NoiSinh], [Phai], [DiaChi], [Email], [SDT], [CMND], [NgayCap], [NoiCap], [TrNgNc], [MMGD], [MKDL]) VALUES (N'149', N'Nguyễn Thị', N'E', CAST(N'2003-01-01' AS Date), N'HCM', N'Nam', N'HCM', N'nguyen12@gmail.com', N'0123456781', N'123654986', CAST(N'2018-01-01' AS Date), N'HCM', N'Trong Nước', N'123456789', N'123456789')
INSERT [dbo].[NhaDauTu] ([MaTK], [Ho], [Ten], [NgaySinh], [NoiSinh], [Phai], [DiaChi], [Email], [SDT], [CMND], [NgayCap], [NoiCap], [TrNgNc], [MMGD], [MKDL]) VALUES (N'158', N'Nguyễn Thị', N'B', CAST(N'2000-03-10' AS Date), N'HCM', N'Nam', N'HCM', N'thinguyen@gmail.com', N'0123456777', N'125789654', CAST(N'2015-01-01' AS Date), N'HCM', N'Trong Nước', N'123456789', N'123456789')
INSERT [dbo].[NhaDauTu] ([MaTK], [Ho], [Ten], [NgaySinh], [NoiSinh], [Phai], [DiaChi], [Email], [SDT], [CMND], [NgayCap], [NoiCap], [TrNgNc], [MMGD], [MKDL]) VALUES (N'234', N'Nguyen Thanh', N'Tin', CAST(N'1999-01-01' AS Date), N'Quang Ngai', N'Nam', N'97 Man THien', N'tindol1999@gmail.com', N'0123564564', N'121444777', CAST(N'1900-01-01' AS Date), N'Viet Nam', N'Trong Nước', N'123456', N'123456')
INSERT [dbo].[NhaDauTu] ([MaTK], [Ho], [Ten], [NgaySinh], [NoiSinh], [Phai], [DiaChi], [Email], [SDT], [CMND], [NgayCap], [NoiCap], [TrNgNc], [MMGD], [MKDL]) VALUES (N'345', N'NGUYEN TAN', N'VU', CAST(N'1900-01-01' AS Date), N'QUANG NGAI', N'Nam', N'CHUNG CU C3', N'vucanxi@gmail', N'0123412345', N'234567891', CAST(N'1900-01-01' AS Date), N'quang ngai', N'Trong Nước', N'123456', N'123456')
INSERT [dbo].[SanGiaoDich] ([MaSan], [TenSan], [BienDoGia], [BuocGiaDatLenh], [LoLechToiThieu]) VALUES (N'HNX', N'HA NOI STOCK EXCHANGE', 0.1, 1, 1)
INSERT [dbo].[SanGiaoDich] ([MaSan], [TenSan], [BienDoGia], [BuocGiaDatLenh], [LoLechToiThieu]) VALUES (N'HSX', N'HOUSE', 0.07, 1, 1)
INSERT [dbo].[SoHuu] ([MaTK], [MaCP], [SoLg]) VALUES (N'123', N'AAA', 4900)
INSERT [dbo].[SoHuu] ([MaTK], [MaCP], [SoLg]) VALUES (N'123', N'AAM', 6220)
INSERT [dbo].[SoHuu] ([MaTK], [MaCP], [SoLg]) VALUES (N'124', N'AAA', 17300)
INSERT [dbo].[SoHuu] ([MaTK], [MaCP], [SoLg]) VALUES (N'124', N'AAM', 18060)
INSERT [dbo].[SoHuu] ([MaTK], [MaCP], [SoLg]) VALUES (N'125', N'AAA', 19400)
INSERT [dbo].[SoHuu] ([MaTK], [MaCP], [SoLg]) VALUES (N'126', N'AAA', 7000)
INSERT [dbo].[SoHuu] ([MaTK], [MaCP], [SoLg]) VALUES (N'148', N'AAA', 22800)
INSERT [dbo].[SoHuu] ([MaTK], [MaCP], [SoLg]) VALUES (N'148', N'AAM', 1920)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'123123', N'345', N'ARB', 10914847)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'234', N'234', N'ARB', 10533233)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'ARB1', N'126', N'ARB', 711700000)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'ARB2', N'148', N'ARB', 16682000)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'ARB6', N'158', N'ARB', 10851288)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'NTT2', N'123', N'SGB', 10958674)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'SCB1', N'123', N'SCB', 152130000)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'SCB3', N'148', N'SCB', 1010030)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'SCB4', N'126', N'SCB', 10921525)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'SCB5', N'148', N'SCB', 10219073)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'SCB7', N'149', N'SCB', 10761038)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'VTB1', N'124', N'VTB', 137770000)
INSERT [dbo].[TKNH] ([MaTKNH], [MaTK], [MaNH], [SoTien]) VALUES (N'VTB2', N'125', N'VTB', 36259000)
INSERT [dbo].[TrangThai] ([MaTrangThai], [DienGiai], [TenTrangThai]) VALUES (N'CAK', N'Chưa khớp', N'Lệnh không khớp ')
INSERT [dbo].[TrangThai] ([MaTrangThai], [DienGiai], [TenTrangThai]) VALUES (N'CK', N'Chờ Khớp', N'Trạng thái của một lệnh khi chưa khớp')
INSERT [dbo].[TrangThai] ([MaTrangThai], [DienGiai], [TenTrangThai]) VALUES (N'DH', N'Đã hủy', N'Hủy lệnh')
INSERT [dbo].[TrangThai] ([MaTrangThai], [DienGiai], [TenTrangThai]) VALUES (N'K1P', N'Khớp Một Phần', N'Một Phần Số Lượng Đặt Đã Khớp')
INSERT [dbo].[TrangThai] ([MaTrangThai], [DienGiai], [TenTrangThai]) VALUES (N'KH', N'Khớp hết', N'Lệnh được khớp ')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_CMND]    Script Date: 1/7/2021 2:45:19 PM ******/
ALTER TABLE [dbo].[NhaDauTu] ADD  CONSTRAINT [UK_CMND] UNIQUE NONCLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_SDT]    Script Date: 1/7/2021 2:45:19 PM ******/
ALTER TABLE [dbo].[NhaDauTu] ADD  CONSTRAINT [UK_SDT] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoPhieu]  WITH CHECK ADD  CONSTRAINT [FK_CoPhieu_SanGiaoDich] FOREIGN KEY([MaSan])
REFERENCES [dbo].[SanGiaoDich] ([MaSan])
GO
ALTER TABLE [dbo].[CoPhieu] CHECK CONSTRAINT [FK_CoPhieu_SanGiaoDich]
GO
ALTER TABLE [dbo].[GiaThamChieu]  WITH CHECK ADD  CONSTRAINT [FK_GiaThamChieu_CoPhieu] FOREIGN KEY([MaCP])
REFERENCES [dbo].[CoPhieu] ([MaCP])
GO
ALTER TABLE [dbo].[GiaThamChieu] CHECK CONSTRAINT [FK_GiaThamChieu_CoPhieu]
GO
ALTER TABLE [dbo].[LenhDat]  WITH CHECK ADD  CONSTRAINT [FK_LenhDat_CoPhieu] FOREIGN KEY([MaCP])
REFERENCES [dbo].[CoPhieu] ([MaCP])
GO
ALTER TABLE [dbo].[LenhDat] CHECK CONSTRAINT [FK_LenhDat_CoPhieu]
GO
ALTER TABLE [dbo].[LenhDat]  WITH CHECK ADD  CONSTRAINT [FK_LenhDat_LoaiLenh1] FOREIGN KEY([MaLoaiLenh])
REFERENCES [dbo].[LoaiLenh] ([MaLoaiLenh])
GO
ALTER TABLE [dbo].[LenhDat] CHECK CONSTRAINT [FK_LenhDat_LoaiLenh1]
GO
ALTER TABLE [dbo].[LenhDat]  WITH CHECK ADD  CONSTRAINT [FK_LenhDat_TKNH] FOREIGN KEY([MaTKNH])
REFERENCES [dbo].[TKNH] ([MaTKNH])
GO
ALTER TABLE [dbo].[LenhDat] CHECK CONSTRAINT [FK_LenhDat_TKNH]
GO
ALTER TABLE [dbo].[LenhDat]  WITH CHECK ADD  CONSTRAINT [FK_LenhDat_TrangThai1] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
GO
ALTER TABLE [dbo].[LenhDat] CHECK CONSTRAINT [FK_LenhDat_TrangThai1]
GO
ALTER TABLE [dbo].[LenhKhop]  WITH CHECK ADD  CONSTRAINT [FK_LenhKhop_LenhDat1] FOREIGN KEY([MaLenh])
REFERENCES [dbo].[LenhDat] ([MaLenh])
GO
ALTER TABLE [dbo].[LenhKhop] CHECK CONSTRAINT [FK_LenhKhop_LenhDat1]
GO
ALTER TABLE [dbo].[LenhUng]  WITH CHECK ADD  CONSTRAINT [FK_UngTienBanCP_CoPhieu] FOREIGN KEY([MaCP])
REFERENCES [dbo].[CoPhieu] ([MaCP])
GO
ALTER TABLE [dbo].[LenhUng] CHECK CONSTRAINT [FK_UngTienBanCP_CoPhieu]
GO
ALTER TABLE [dbo].[LenhUng]  WITH CHECK ADD  CONSTRAINT [FK_UngTienBanCP_NganHang] FOREIGN KEY([MaTKNH])
REFERENCES [dbo].[TKNH] ([MaTKNH])
GO
ALTER TABLE [dbo].[LenhUng] CHECK CONSTRAINT [FK_UngTienBanCP_NganHang]
GO
ALTER TABLE [dbo].[SoHuu]  WITH CHECK ADD  CONSTRAINT [FK_SoHuu_CoPhieu] FOREIGN KEY([MaCP])
REFERENCES [dbo].[CoPhieu] ([MaCP])
GO
ALTER TABLE [dbo].[SoHuu] CHECK CONSTRAINT [FK_SoHuu_CoPhieu]
GO
ALTER TABLE [dbo].[SoHuu]  WITH CHECK ADD  CONSTRAINT [FK_SoHuu_NhaDauTu] FOREIGN KEY([MaTK])
REFERENCES [dbo].[NhaDauTu] ([MaTK])
GO
ALTER TABLE [dbo].[SoHuu] CHECK CONSTRAINT [FK_SoHuu_NhaDauTu]
GO
ALTER TABLE [dbo].[TKNH]  WITH CHECK ADD  CONSTRAINT [FK_TKNH_NganHang] FOREIGN KEY([MaNH])
REFERENCES [dbo].[NganHang] ([MaNH])
GO
ALTER TABLE [dbo].[TKNH] CHECK CONSTRAINT [FK_TKNH_NganHang]
GO
ALTER TABLE [dbo].[TKNH]  WITH CHECK ADD  CONSTRAINT [FK_TKNH_NhaDauTu] FOREIGN KEY([MaTK])
REFERENCES [dbo].[NhaDauTu] ([MaTK])
GO
ALTER TABLE [dbo].[TKNH] CHECK CONSTRAINT [FK_TKNH_NhaDauTu]
GO
ALTER TABLE [dbo].[NhaDauTu]  WITH CHECK ADD  CONSTRAINT [CHK_Phai] CHECK  (([Phai]=N'Nam' OR [Phai]=N'Nữ'))
GO
ALTER TABLE [dbo].[NhaDauTu] CHECK CONSTRAINT [CHK_Phai]
GO
ALTER TABLE [dbo].[NhaDauTu]  WITH CHECK ADD  CONSTRAINT [CHK_TrNgNc] CHECK  (([TrNgNc]=N'Trong Nước' OR [TrNgNc]=N'Ngoài Nước'))
GO
ALTER TABLE [dbo].[NhaDauTu] CHECK CONSTRAINT [CHK_TrNgNc]
GO
ALTER TABLE [dbo].[TKNH]  WITH CHECK ADD  CONSTRAINT [CK_Tien] CHECK  (([SoTien]>(0)))
GO
ALTER TABLE [dbo].[TKNH] CHECK CONSTRAINT [CK_Tien]
GO
/****** Object:  StoredProcedure [dbo].[spCauA]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCauA]
@X varchar(50)
AS
BEGIN
	SELECT MaCP , NGAYMAX = MAX(NgayGD) 
	INTO #TAM
	FROM (SELECT * FROM GiaThamChieu WHERE NgayGD <= CONVERT(DATE,GETDATE())) AS GTC
	GROUP BY MaCP

	SELECT SoHuu.MaCP, SoLg, DonGia=GiaTC, TriGia=SoLg*GiaTC
	FROM SoHuu, GiaThamChieu , #TAM 
	WHERE GiaThamChieu.MaCP= #TAM.MaCP  AND GiaThamChieu.NgayGD = #TAM.NGAYMAX
	AND SoHuu.MaCP = #TAM.MaCP  AND MaTK = @X
END;

GO
/****** Object:  StoredProcedure [dbo].[spCauB]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCauB]
@tungay datetime,@denngay datetime,@Y varchar(50)
OUT
AS
BEGIN
	SELECT NGAYKHOP = LK.NgayGioKhop, MACP, LoaiLenh=MaLoaiLenh, SoLgKhop, GiaKhop 
	FROM LenhKhop LK,  LenhDat  LD,  TKNH TK
	WHERE MaTK = @Y AND CONVERT(DATE,LK.NgayGioKhop) BETWEEN @tungay AND @denngay  AND LK.MaLenh = LD.MaLenh AND LD.MaTKNH = TK.MaTKNH
	ORDER BY LK.NgayGioKhop	
END;

GO
/****** Object:  StoredProcedure [dbo].[spCauC]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCauC]
@Z varchar(50),@ngay datetime
OUT
AS
BEGIN
	SELECT LD.MACP, MaLoaiLenh ,SLDat , GiaDat, MaTrangThai, SoLgKhop, GiaKhop
	FROM (LenhDat LD LEFT JOIN  LenhKhop LK
	ON LD.MaLenh = LK.MaLenh) INNER JOIN TKNH TK 
	ON LD.MaTKNH = TK.MaTKNH
	WHERE MaTK = @Z AND CONVERT(DATE,LD.NgayGioDat) = @ngay
	ORDER BY LK.NgayGioKhop
END;

GO
/****** Object:  StoredProcedure [dbo].[spLayGiaTC]    Script Date: 1/7/2021 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLayGiaTC]
@X varchar(50)
AS
BEGIN
SELECT GTC.MaCP , NGAYMAX = MAX(NgayGD)
INTO #TAM4
FROM (SELECT * FROM GiaThamChieu WHERE NgayGD = CONVERT(DATE,GETDATE())) AS GTC
INNER JOIN (SELECT * FROM CoPhieu WHERE MaSan= @X) AS CP
ON CP.MaCP=GTC.MaCP
GROUP BY GTC.MaCP

SELECT #TAM4.MaCP, GiaTC ,#TAM4.NGAYMAX
FROM GiaThamChieu , #TAM4 
WHERE GiaThamChieu.MaCP= #TAM4.MaCP  AND GiaThamChieu.NgayGD = #TAM4.NGAYMAX
END;

GO
