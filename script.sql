USE [master]
GO
/****** Object:  Database [BookShop]    Script Date: 30.11.2021 19:51:26 ******/
CREATE DATABASE [BookShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookShop', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookShop_log', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookShop] SET  MULTI_USER 
GO
ALTER DATABASE [BookShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookShop] SET QUERY_STORE = OFF
GO
USE [BookShop]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 30.11.2021 19:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 30.11.2021 19:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Pages] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[PublishDate] [date] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[ThemeId] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 30.11.2021 19:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 30.11.2021 19:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[BookId] [int] NOT NULL,
	[ShopId] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 30.11.2021 19:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Shops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Themes]    Script Date: 30.11.2021 19:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Themes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Themes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [Name], [Surname], [CountryId]) VALUES (1, N'Stiven', N'King', 3)
INSERT [dbo].[Authors] ([Id], [Name], [Surname], [CountryId]) VALUES (2, N'Madaline', N'Ru', 3)
INSERT [dbo].[Authors] ([Id], [Name], [Surname], [CountryId]) VALUES (4, N'Max', N'Kidruk', 2)
INSERT [dbo].[Authors] ([Id], [Name], [Surname], [CountryId]) VALUES (5, N'Raymond', N'Merphy', 4)
INSERT [dbo].[Authors] ([Id], [Name], [Surname], [CountryId]) VALUES (6, N'Jules', N'Verne', 1)
INSERT [dbo].[Authors] ([Id], [Name], [Surname], [CountryId]) VALUES (7, N'Tim', N'Hurford', 1)
INSERT [dbo].[Authors] ([Id], [Name], [Surname], [CountryId]) VALUES (11, N'Tim', N'Koock', 3)
INSERT [dbo].[Authors] ([Id], [Name], [Surname], [CountryId]) VALUES (12, N'Robert', N'Martin', 4)
INSERT [dbo].[Authors] ([Id], [Name], [Surname], [CountryId]) VALUES (13, N'Herbert', N'Schildt', 3)
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (1, N'Economic history', 740, 300.0000, CAST(N'2018-04-02' AS Date), 7, 5)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (2, N'It', 387, 460.0000, CAST(N'2007-06-16' AS Date), 1, 4)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (4, N'Shine', 678, 289.0000, CAST(N'1997-05-03' AS Date), 1, 4)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (5, N'Shelter', 680, 418.0000, CAST(N'2008-07-18' AS Date), 2, 3)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (6, N'Cursed rubines', 456, 389.0000, CAST(N'2007-07-07' AS Date), 2, 3)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (8, N'Cruel sky', 648, 180.0000, CAST(N'1900-10-30' AS Date), 4, 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (9, N'Mysterious island', 1000, 700.0000, CAST(N'1875-08-06' AS Date), 6, 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (11, N'Around World', 899, 600.0000, CAST(N'1872-06-08' AS Date), 6, 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (12, N'English Eduvcation(Blue)', 455, 211.0000, CAST(N'2006-06-05' AS Date), 5, 3)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (13, N'English Eduvcation(Red)', 345, 123.0000, CAST(N'2004-05-06' AS Date), 5, 3)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (15, N'Microsoft settings', 345, 345.0000, CAST(N'2016-03-04' AS Date), 11, 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (16, N'Clear Architector', 546, 485.0000, CAST(N'2014-07-08' AS Date), 12, 7)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (17, N'C++', 343, 456.0000, CAST(N'2012-08-06' AS Date), 13, 7)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [Price], [PublishDate], [AuthorId], [ThemeId]) VALUES (18, N'Dark Arts', 456, 234.0000, CAST(N'2021-08-08' AS Date), 13, 6)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name]) VALUES (4, N'Englend')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (1, N'Russia')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (2, N'Ukraine')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (3, N'USA')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (1, 345.0000, 40, CAST(N'2014-04-23' AS Date), 1, 1)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (3, 346.0000, 30, CAST(N'2008-05-27' AS Date), 2, 2)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (4, 342.0000, 120, CAST(N'2018-07-04' AS Date), 4, 1)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (9, 543.0000, 54, CAST(N'2017-09-17' AS Date), 5, 2)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (10, 987.0000, 56, CAST(N'2018-08-15' AS Date), 6, 1)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (11, 786.0000, 59, CAST(N'2018-04-09' AS Date), 8, 2)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (12, 567.0000, 43, CAST(N'2019-09-08' AS Date), 9, 1)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (13, 345.0000, 56, CAST(N'2018-08-09' AS Date), 11, 2)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (15, 876.0000, 76, CAST(N'2018-09-08' AS Date), 12, 1)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (16, 876.0000, 34, CAST(N'2019-03-08' AS Date), 13, 2)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (17, 123.0000, 12, CAST(N'2018-01-03' AS Date), 15, 1)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (19, 321.0000, 32, CAST(N'2019-02-07' AS Date), 16, 2)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (20, 789.0000, 9, CAST(N'2018-08-07' AS Date), 17, 1)
INSERT [dbo].[Sales] ([Id], [Price], [Quantity], [SaleDate], [BookId], [ShopId]) VALUES (21, 456.0000, 48, CAST(N'2021-07-08' AS Date), 18, 2)
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
SET IDENTITY_INSERT [dbo].[Shops] ON 

INSERT [dbo].[Shops] ([Id], [Name], [CountryId]) VALUES (1, N'Yakaboo', 3)
INSERT [dbo].[Shops] ([Id], [Name], [CountryId]) VALUES (2, N'Book24', 1)
SET IDENTITY_INSERT [dbo].[Shops] OFF
GO
SET IDENTITY_INSERT [dbo].[Themes] ON 

INSERT [dbo].[Themes] ([Id], [Name]) VALUES (1, N'Adventures')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (6, N'Detective')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (5, N'Education')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (3, N'Fantastic')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (4, N'Horror')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (7, N'Programming')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (2, N'Science')
SET IDENTITY_INSERT [dbo].[Themes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Countries]    Script Date: 30.11.2021 19:51:26 ******/
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [IX_Countries] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Themes]    Script Date: 30.11.2021 19:51:26 ******/
ALTER TABLE [dbo].[Themes] ADD  CONSTRAINT [IX_Themes] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Authors]  WITH CHECK ADD  CONSTRAINT [FK_Authors_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Authors] CHECK CONSTRAINT [FK_Authors_Countries]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Themes] FOREIGN KEY([ThemeId])
REFERENCES [dbo].[Themes] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Themes]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Books]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Shops] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shops] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Shops]
GO
ALTER TABLE [dbo].[Shops]  WITH CHECK ADD  CONSTRAINT [FK_Shops_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Shops] CHECK CONSTRAINT [FK_Shops_Countries]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK_Books] CHECK  (([Pages]>=(0)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [CK_Books_1] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [CK_Books_1]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [CK_Sales] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [CK_Sales]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [CK_Sales_1] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [CK_Sales_1]
GO
USE [master]
GO
ALTER DATABASE [BookShop] SET  READ_WRITE 
GO
