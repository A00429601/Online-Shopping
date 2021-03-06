USE [master]
GO
/****** Object:  Database [Db]    Script Date: 2018-12-07 7:15:04 PM ******/
CREATE DATABASE [Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CmsShoppingCart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CmsShoppingCart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CmsShoppingCart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CmsShoppingCart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Db] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Db] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Db] SET  MULTI_USER 
GO
ALTER DATABASE [Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Db', N'ON'
GO
ALTER DATABASE [Db] SET QUERY_STORE = OFF
GO
USE [Db]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 2018-12-07 7:15:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Slug] [varchar](50) NULL,
	[Sorting] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 2018-12-07 7:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[UserId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 2018-12-07 7:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CreatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPages]    Script Date: 2018-12-07 7:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Slug] [varchar](50) NULL,
	[Body] [varchar](max) NULL,
	[Sorting] [int] NULL,
	[HasSidebar] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 2018-12-07 7:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Slug] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Price] [numeric](18, 2) NULL,
	[CategoryName] [varchar](50) NULL,
	[CategoryId] [int] NULL,
	[ImageName ] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 2018-12-07 7:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSidebar]    Script Date: 2018-12-07 7:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSidebar](
	[Id] [int] NOT NULL,
	[Body] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTransaction]    Script Date: 2018-12-07 7:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransaction](
	[TransactionId] [int] NOT NULL,
	[NameOnTheCard] [varchar](50) NULL,
	[ExpireDate] [varchar](50) NULL,
	[CreditCardNumber] [varchar](50) NULL,
	[CVV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserRoles]    Script Date: 2018-12-07 7:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 2018-12-07 7:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[CardNumber] [varchar](50) NULL,
	[CardType] [varchar](50) NULL,
	[NameOnTheCard] [varchar](50) NULL,
	[ExpireDate] [varchar](8) NULL,
	[CVV] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategories] ON 

INSERT [dbo].[tblCategories] ([Id], [Name], [Slug], [Sorting]) VALUES (22, N'EarPhones', N'earphones', 2)
INSERT [dbo].[tblCategories] ([Id], [Name], [Slug], [Sorting]) VALUES (25, N'Phones', N'phones', 1)
SET IDENTITY_INSERT [dbo].[tblCategories] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (1, 1, 2, 22, 2)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (2, 1, 2, 27, 2)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (3, 2, 3, 23, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (4, 2, 3, 24, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (5, 2, 3, 28, 2)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (6, 3, 3, 25, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (7, 3, 3, 29, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (8, 4, 2, 22, 3)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (9, 4, 2, 27, 3)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (10, 5, 4, 22, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (11, 6, 4, 22, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (12, 7, 4, 22, 3)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (13, 8, 4, 22, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (14, 9, 4, 22, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (15, 10, 4, 22, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (16, 11, 4, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (17, 12, 4, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (18, 13, 4, 33, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (19, 14, 4, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (20, 14, 4, 33, 2)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (21, 15, 5, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (22, 16, 6, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (23, 17, 6, 33, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (24, 18, 6, 33, 2)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (25, 19, 6, 33, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (26, 20, 6, 33, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (27, 21, 6, 33, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (28, 23, 6, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (29, 24, 6, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (30, 25, 6, 33, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (31, 26, 9, 32, 2)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (32, 27, 6, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (33, 28, 4, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (34, 29, 4, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (35, 30, 4, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (36, 31, 4, 32, 1)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [UserId], [ProductId], [Quantity]) VALUES (37, 31, 4, 33, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (5, 4, CAST(N'2018-12-03T15:05:50.9595347' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (6, 4, CAST(N'2018-12-03T15:06:23.5036857' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (7, 4, CAST(N'2018-12-03T23:11:30.9719872' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (8, 4, CAST(N'2018-12-03T23:47:35.6189793' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (9, 4, CAST(N'2018-12-04T01:27:27.8214593' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (10, 4, CAST(N'2018-12-04T01:59:59.5585684' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (11, 4, CAST(N'2018-12-04T16:32:15.9255772' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (12, 4, CAST(N'2018-12-04T19:48:40.3238812' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (13, 4, CAST(N'2018-12-04T19:49:37.3453102' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (14, 4, CAST(N'2018-12-04T19:53:45.2730997' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (15, 5, CAST(N'2018-12-04T23:41:11.0315381' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (16, 6, CAST(N'2018-12-05T00:05:39.6949794' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (17, 6, CAST(N'2018-12-05T13:05:05.0024024' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (18, 6, CAST(N'2018-12-05T13:06:33.3119079' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (19, 6, CAST(N'2018-12-05T13:07:48.8594490' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (20, 6, CAST(N'2018-12-05T13:10:18.5841432' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (21, 6, CAST(N'2018-12-05T13:13:47.7113099' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (22, 6, CAST(N'2018-12-05T13:14:23.8237011' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (23, 6, CAST(N'2018-12-05T13:15:42.0815382' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (24, 6, CAST(N'2018-12-05T13:16:53.3624257' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (25, 6, CAST(N'2018-12-05T13:20:22.4336009' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (26, 9, CAST(N'2018-12-05T15:13:04.4663949' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (27, 6, CAST(N'2018-12-05T15:48:46.0949298' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (28, 4, CAST(N'2018-12-05T17:40:38.8225135' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (29, 4, CAST(N'2018-12-05T17:50:11.9519173' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (30, 4, CAST(N'2018-12-05T17:54:29.2234577' AS DateTime2))
INSERT [dbo].[tblOrders] ([OrderId], [UserId], [CreatedAt]) VALUES (31, 4, CAST(N'2018-12-05T18:19:48.3165270' AS DateTime2))
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
SET IDENTITY_INSERT [dbo].[tblPages] ON 

INSERT [dbo].[tblPages] ([Id], [Title], [Slug], [Body], [Sorting], [HasSidebar]) VALUES (1, N'Home', N'home', N'<h2>
	<span style="color:#008080;"><span style="font-size:28px;">Home</span></span></h2>
<p>
	<span style="color:#ff8c00;"><span style="font-size:24px;"><span style="font-family: arial, sans-serif;">Shop our sale to get&nbsp;</span><span style="font-family: arial, sans-serif;">discounts on your favorite items!</span></span></span></p>
', 0, 0)
INSERT [dbo].[tblPages] ([Id], [Title], [Slug], [Body], [Sorting], [HasSidebar]) VALUES (2, N'Services', N'services', N'<h2>
	<span style="color:#008080;"><span style="font-size:28px;">Services</span></span></h2>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">
	<span style="color:#ffa500;"><span style="font-size:24px;"><span style="font-family: Arial, Helvetica, sans-serif;">we deal with the selling of mobile phones and headphones.&nbsp;be it affordable ones or the top notch we quench your thirst for any!</span></span></span></p>
<div>
	&nbsp;</div>
<p>
	<img alt="" src="/fileman/Uploads/galadriel''s path home.jpg" style="width: 200px; height: 125px;" /></p>
', 1, 0)
INSERT [dbo].[tblPages] ([Id], [Title], [Slug], [Body], [Sorting], [HasSidebar]) VALUES (3, N'About Us', N'about-us', N'<h2>
	<span style="color:#008080;"><span style="font-size:28px;">About Us</span></span></h2>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">
	<span style="color:#ffa500;"><span style="font-size:24px;"><span style="font-family: Helvetica, Arial, sans-serif; white-space: pre-wrap;">Durgam, Sonam, Nawaz, Ravneet, Keji, Maninder started Mobify because it was a part of our curriculum.</span></span></span></p>
', 2, 0)
INSERT [dbo].[tblPages] ([Id], [Title], [Slug], [Body], [Sorting], [HasSidebar]) VALUES (5, N'Contact Us', N'contact-us', N'<h2>
	<span style="color:#008080;"><span style="font-size:28px;">Contact Us</span></span></h2>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">
	<span style="color:#ffa500;"><span style="font-size:24px;"><span style="font-family: Helvetica, Arial, sans-serif; white-space: pre-wrap;">Service Support Email: support@mobify.com </span></span></span></p>
<p style="margin: 0px 0px 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">
	<span style="color:#ffa500;"><span style="font-size:24px;"><span style="font-family: Helvetica, Arial, sans-serif; white-space: pre-wrap;">Contact: 1800-234232</span></span></span></p>
', 3, 0)
SET IDENTITY_INSERT [dbo].[tblPages] OFF
SET IDENTITY_INSERT [dbo].[tblProducts] ON 

INSERT [dbo].[tblProducts] ([Id], [Name], [Slug], [Description], [Price], [CategoryName], [CategoryId], [ImageName ]) VALUES (39, N'Iphone X', N'iphone-x', N'Iphone', CAST(100.00 AS Numeric(18, 2)), N'EarPhones', 22, N'LGV30.jpg')
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
SET IDENTITY_INSERT [dbo].[tblRoles] ON 

INSERT [dbo].[tblRoles] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRoles] ([Id], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
INSERT [dbo].[tblSidebar] ([Id], [Body]) VALUES (1, N'<h2>
	Sidebar</h2>
<p>
	Sidebar body.</p>
<p>
	<img alt="" src="/fileman/Uploads/smiley 200x200.jpg" style="width: 200px; height: 200px;" /></p>
')
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (3, 2)
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (4, 2)
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (5, 2)
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (6, 2)
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (7, 2)
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (8, 2)
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (9, 2)
INSERT [dbo].[tblUserRoles] ([UserId], [RoleId]) VALUES (10, 2)
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([Id], [FirstName], [LastName], [EmailAddress], [Username], [Password], [CardNumber], [CardType], [NameOnTheCard], [ExpireDate], [CVV]) VALUES (1, N'Admin', N'Admin', N'admin@gmail.com', N'admin', N'pass', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([Id], [FirstName], [LastName], [EmailAddress], [Username], [Password], [CardNumber], [CardType], [NameOnTheCard], [ExpireDate], [CVV]) VALUES (4, N'Narasimha', N'Durgam', N'narasimharao1994@outlook.com', N'narasimhadurgam', N'12345', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([Id], [FirstName], [LastName], [EmailAddress], [Username], [Password], [CardNumber], [CardType], [NameOnTheCard], [ExpireDate], [CVV]) VALUES (5, N'Durgam', N'Rao', N'durgamnarasimha@gmail.com', N'nrdurgam', N'pass', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([Id], [FirstName], [LastName], [EmailAddress], [Username], [Password], [CardNumber], [CardType], [NameOnTheCard], [ExpireDate], [CVV]) VALUES (6, N'Sonam', N'Vadsaria', N'vada@gmail.com', N'sonam', N'pass', N'12345677891233', N'MasterCard', N'Sonam', N'11/20', N'212')
INSERT [dbo].[tblUsers] ([Id], [FirstName], [LastName], [EmailAddress], [Username], [Password], [CardNumber], [CardType], [NameOnTheCard], [ExpireDate], [CVV]) VALUES (7, N'rao', N'rao', N'rao@gmail.com', N'rao', N'pass', N'1616525162156', N'Visa', N'rao', N'11/2019', N'111')
INSERT [dbo].[tblUsers] ([Id], [FirstName], [LastName], [EmailAddress], [Username], [Password], [CardNumber], [CardType], [NameOnTheCard], [ExpireDate], [CVV]) VALUES (8, N'hdkdkkd', N'kljlkdkjq', N'lkjwkjdk@gmail.com', N'lwjjdd', N'pass', N'1111111111111111', N'Visa', N'slkjwlkdjwid', N'11/2019', N'111')
INSERT [dbo].[tblUsers] ([Id], [FirstName], [LastName], [EmailAddress], [Username], [Password], [CardNumber], [CardType], [NameOnTheCard], [ExpireDate], [CVV]) VALUES (9, N'Sunil', N'M', N'sunil@gmail.com', N'sunil', N'pass', N'521212121212121', N'Master Card', N'Sunil', N'11/2019', N'123')
INSERT [dbo].[tblUsers] ([Id], [FirstName], [LastName], [EmailAddress], [Username], [Password], [CardNumber], [CardType], [NameOnTheCard], [ExpireDate], [CVV]) VALUES (10, N'Narasimha11', N'Durgam11', N'narasimharao199114@outlook.com', N'Rao1', N'pass', N'521212121212121', N'Master Card', N'Raoss', N'11/2019', N'112')
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
USE [master]
GO
ALTER DATABASE [Db] SET  READ_WRITE 
GO
