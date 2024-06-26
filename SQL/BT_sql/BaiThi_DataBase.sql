USE [BaiThi_23t1080051]
--Câu 1
GO
/****** Object:  Table [dbo].[ChiTietPhieuXuatVatTu]    Script Date: 5/14/2024 9:37:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuXuatVatTu](
	[SoPhieu] [nvarchar](50) NOT NULL,
	[MaVatTu] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietPhieuXuatVatTu] PRIMARY KEY CLUSTERED 
(
	[SoPhieu] ASC,
	[MaVatTu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuXuatVatTu]    Script Date: 5/14/2024 9:37:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuatVatTu](
	[SoPhieu] [nvarchar](50) NOT NULL,
	[NgayLapPhieu] [date] NOT NULL,
	[NguoiLapPhieu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhieuXuatVatTu] PRIMARY KEY CLUSTERED 
(
	[SoPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VatTu]    Script Date: 5/14/2024 9:37:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VatTu](
	[MaVatTu] [nvarchar](50) NOT NULL,
	[TenVatTu] [nvarchar](255) NOT NULL,
	[NuocSuanXuat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VatTu] PRIMARY KEY CLUSTERED 
(
	[MaVatTu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--Câu 2:
GO
INSERT [dbo].[ChiTietPhieuXuatVatTu] ([SoPhieu], [MaVatTu], [SoLuong]) VALUES (N'P001', N'VT001', 10)
GO
INSERT [dbo].[ChiTietPhieuXuatVatTu] ([SoPhieu], [MaVatTu], [SoLuong]) VALUES (N'P001', N'VT002', 20)
GO
INSERT [dbo].[ChiTietPhieuXuatVatTu] ([SoPhieu], [MaVatTu], [SoLuong]) VALUES (N'P002', N'VT003', 15)
GO
INSERT [dbo].[ChiTietPhieuXuatVatTu] ([SoPhieu], [MaVatTu], [SoLuong]) VALUES (N'P003', N'VT002', 30)
GO
INSERT [dbo].[ChiTietPhieuXuatVatTu] ([SoPhieu], [MaVatTu], [SoLuong]) VALUES (N'P003', N'VT003', 20)
GO
INSERT [dbo].[ChiTietPhieuXuatVatTu] ([SoPhieu], [MaVatTu], [SoLuong]) VALUES (N'P003', N'VT004', 20)
GO
INSERT [dbo].[ChiTietPhieuXuatVatTu] ([SoPhieu], [MaVatTu], [SoLuong]) VALUES (N'P004', N'VT001', 15)
GO
INSERT [dbo].[ChiTietPhieuXuatVatTu] ([SoPhieu], [MaVatTu], [SoLuong]) VALUES (N'P005', N'VT003', 20)
GO
INSERT [dbo].[ChiTietPhieuXuatVatTu] ([SoPhieu], [MaVatTu], [SoLuong]) VALUES (N'P005', N'VT004', 10)
GO
INSERT [dbo].[PhieuXuatVatTu] ([SoPhieu], [NgayLapPhieu], [NguoiLapPhieu]) VALUES (N'P001', CAST(N'2023-05-01' AS Date), N'Trần Thanh Hải')
GO
INSERT [dbo].[PhieuXuatVatTu] ([SoPhieu], [NgayLapPhieu], [NguoiLapPhieu]) VALUES (N'P002', CAST(N'2023-05-12' AS Date), N'Nguyễn Tuấn Anh')
GO
INSERT [dbo].[PhieuXuatVatTu] ([SoPhieu], [NgayLapPhieu], [NguoiLapPhieu]) VALUES (N'P003', CAST(N'2023-05-15' AS Date), N'Trần Thanh Hải')
GO
INSERT [dbo].[PhieuXuatVatTu] ([SoPhieu], [NgayLapPhieu], [NguoiLapPhieu]) VALUES (N'P004', CAST(N'2023-05-16' AS Date), N'Trần Thanh Hải')
GO
INSERT [dbo].[PhieuXuatVatTu] ([SoPhieu], [NgayLapPhieu], [NguoiLapPhieu]) VALUES (N'P005', CAST(N'2023-05-16' AS Date), N'Nguyễn Tuấn Anh')
GO
INSERT [dbo].[VatTu] ([MaVatTu], [TenVatTu], [NuocSuanXuat]) VALUES (N'VT001', N'Dây cáp đồng', N'Việt Nam')
GO
INSERT [dbo].[VatTu] ([MaVatTu], [TenVatTu], [NuocSuanXuat]) VALUES (N'VT002', N'Ổ cắm điện', N'Nhật')
GO
INSERT [dbo].[VatTu] ([MaVatTu], [TenVatTu], [NuocSuanXuat]) VALUES (N'VT003', N'Bóng đèn Led 50W', N'Việt Nam')
GO
INSERT [dbo].[VatTu] ([MaVatTu], [TenVatTu], [NuocSuanXuat]) VALUES (N'VT004', N'Bóng đèn 1m2', N'Việt Nam')
GO
INSERT [dbo].[VatTu] ([MaVatTu], [TenVatTu], [NuocSuanXuat]) VALUES (N'VT005', N'Công tắc điện', N'Nhật')
GO
ALTER TABLE [dbo].[ChiTietPhieuXuatVatTu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuXuatVatTu_PhieuXuatVatTu] FOREIGN KEY([SoPhieu])
REFERENCES [dbo].[PhieuXuatVatTu] ([SoPhieu])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuatVatTu] CHECK CONSTRAINT [FK_ChiTietPhieuXuatVatTu_PhieuXuatVatTu]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuatVatTu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuXuatVatTu_VatTu] FOREIGN KEY([MaVatTu])
REFERENCES [dbo].[VatTu] ([MaVatTu])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuatVatTu] CHECK CONSTRAINT [FK_ChiTietPhieuXuatVatTu_VatTu]
GO
