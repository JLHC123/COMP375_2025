USE [master]
GO
/****** Object:  Database [Practice]    Script Date: 2/17/2025 1:21:45 PM ******/
CREATE DATABASE [Practice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Practice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Practice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Practice] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practice] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practice] SET  MULTI_USER 
GO
ALTER DATABASE [Practice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practice] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Practice] SET QUERY_STORE = ON
GO
ALTER DATABASE [Practice] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Practice]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/17/2025 1:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFirstName] [nvarchar](50) NOT NULL,
	[CustomerLastName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 2/17/2025 1:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddress](
	[CustomerAddressId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Street1] [nvarchar](100) NOT NULL,
	[Street2] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[States] [nvarchar](100) NOT NULL,
	[Zip] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Customer__DB891B78B040E2F5] PRIMARY KEY CLUSTERED 
(
	[CustomerAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/17/2025 1:21:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (1, N'Daniel', N'Ford')
INSERT [dbo].[Customer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (2, N'Fransisco', N'Mora')
INSERT [dbo].[Customer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (3, N'Home', N'Work')
INSERT [dbo].[Customer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (4, N'Chat', N'GPT')
INSERT [dbo].[Customer] ([CustomerId], [CustomerFirstName], [CustomerLastName]) VALUES (5, N'Class', N'Grades')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerAddress] ON 

INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (1, 1, N'East', N'560', N'Huntington', N'West Virginia', N'25711')
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (2, 1, N'Center', N'380', N'Vero Beach', N'Florida', N'32964')
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (3, 2, N'Transport', N'7', N'Atlanta', N'Georgia', N'30306')
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (4, 3, N'Derek', N'2216', N'Saginaw', N'Michigan', N'48604')
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (5, 4, N'Gale', N'944', N'Huntington', N'West Virginia', N'25716')
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (6, 4, N'Burning Wood', N'9656', N'Sacramento', N'California', N'95838')
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (7, 4, N'Pawling', N'61', N'New Haven', N'Connecticut', N'06520')
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (8, 4, N'Sheridan', N'848', N'Long Beach', N'California', N'90840')
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (9, 5, N'Hanover', N'54441', N'Lexington', N'Kentucky', N'40546')
INSERT [dbo].[CustomerAddress] ([CustomerAddressId], [CustomerId], [Street1], [Street2], [City], [States], [Zip]) VALUES (10, 5, N'Brickson Park', N'0', N'Tampa', N'Florida', N'33615')
SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (1, 2, CAST(N'2025-02-17T21:19:34.167' AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (2, 2, CAST(N'2025-02-17T21:19:34.167' AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (3, 4, CAST(N'2025-02-17T21:19:34.167' AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (4, 3, CAST(N'2025-02-17T21:19:34.170' AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (5, 4, CAST(N'2025-02-17T21:19:34.170' AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (6, 4, CAST(N'2025-02-17T21:19:34.170' AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (7, 2, CAST(N'2025-02-17T21:19:34.170' AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (8, 4, CAST(N'2025-02-17T21:19:34.170' AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (9, 5, CAST(N'2025-02-17T21:19:34.170' AS DateTime))
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate]) VALUES (10, 3, CAST(N'2025-02-17T21:19:34.170' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getutcdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [FK_CustomerAddress_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
USE [master]
GO
ALTER DATABASE [Practice] SET  READ_WRITE 
GO
