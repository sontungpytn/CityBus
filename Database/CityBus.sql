USE [master]
GO
/****** Object:  Database [CityBus]    Script Date: 3/25/2017 2:02:38 AM ******/
CREATE DATABASE [CityBus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CityBus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CityBus.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CityBus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CityBus_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CityBus] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CityBus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CityBus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CityBus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CityBus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CityBus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CityBus] SET ARITHABORT OFF 
GO
ALTER DATABASE [CityBus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CityBus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CityBus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CityBus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CityBus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CityBus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CityBus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CityBus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CityBus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CityBus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CityBus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CityBus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CityBus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CityBus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CityBus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CityBus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CityBus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CityBus] SET RECOVERY FULL 
GO
ALTER DATABASE [CityBus] SET  MULTI_USER 
GO
ALTER DATABASE [CityBus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CityBus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CityBus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CityBus] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CityBus] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CityBus', N'ON'
GO
USE [CityBus]
GO
/****** Object:  Table [dbo].[BOOKING]    Script Date: 3/25/2017 2:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BOOKING](
	[BookingID] [varchar](6) NOT NULL,
	[UserEmail] [varchar](50) NOT NULL,
	[BookingState] [bit] NOT NULL,
	[BookingDate] [date] NOT NULL,
	[BusDetailID] [varchar](6) NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[ArrivalDate] [date] NOT NULL,
	[Amount] [money] NOT NULL,
 CONSTRAINT [PK_BOOKING] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BUSDETAIL]    Script Date: 3/25/2017 2:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BUSDETAIL](
	[BusDetailID] [varchar](6) NOT NULL,
	[BusID] [varchar](6) NOT NULL,
	[DepartureTime] [varchar](10) NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[AvailableSeat] [int] NOT NULL,
 CONSTRAINT [PK_BUSDETAIL] PRIMARY KEY CLUSTERED 
(
	[BusDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BUSES]    Script Date: 3/25/2017 2:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BUSES](
	[BusID] [varchar](6) NOT NULL,
	[BusName] [nvarchar](50) NOT NULL,
	[RouteID] [varchar](6) NOT NULL,
	[Fare] [money] NOT NULL,
	[TotalSeat] [int] NOT NULL,
 CONSTRAINT [PK_BUSES] PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CITIES]    Script Date: 3/25/2017 2:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CITIES](
	[CityID] [varchar](6) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[NationalID] [varchar](15) NOT NULL,
 CONSTRAINT [PK_CITIES] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PASSENGER]    Script Date: 3/25/2017 2:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PASSENGER](
	[PassengerID] [varchar](6) NOT NULL,
	[BookingID] [varchar](6) NOT NULL,
	[PassengerName] [nvarchar](50) NOT NULL,
	[NationalID] [varchar](15) NULL,
	[Phone] [varchar](15) NULL,
 CONSTRAINT [PK_PASSENGER] PRIMARY KEY CLUSTERED 
(
	[PassengerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROUTES]    Script Date: 3/25/2017 2:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ROUTES](
	[RouteID] [varchar](6) NOT NULL,
	[FromCityID] [varchar](6) NOT NULL,
	[ToCityID] [varchar](6) NOT NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [PK_ROUTES] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 3/25/2017 2:02:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERS](
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Role] [bit] NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'033QMT', N'5RMIOS', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'03YIF0', N'E6BZZP', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'053RQ7', N'5JYUGT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0903PS', N'Q3NK4G', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'09JN2Q', N'WD9PN8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0J4L4W', N'HL94ZZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0K5DD4', N'1W51YW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0RDO68', N'Z4D61X', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0RSNUH', N'1V1KSC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0S85WM', N'FFYLTK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0UVBPP', N'MBI5J6', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0XMAZ8', N'CMESBP', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0Y0GKW', N'DJDV61', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'0ZLF8D', N'98O7JA', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'117JJM', N'0BBEAY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'12ZH71', N'LJ7KPM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'14D8ED', N'HFHZ2X', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'14FDQC', N'GI8ZY8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'15AX3O', N'U8ZB9Z', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'1E6AB7', N'5KJOJD', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'1F0BBD', N'WRLEG1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'1IA9NO', N'LPFIWZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'1J8L48', N'0W0K2T', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'1RZDH1', N'3TY8QT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'1S4KDT', N'PJN665', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'1XZZPR', N'9HNF1K', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'2CPOC0', N'7XG4UL', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'2FT6E8', N'GINZ19', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'2IQWE9', N'KQ3YXX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'2MOLO4', N'HMTB3P', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'2MSSP3', N'QX5CKO', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'2P8LTX', N'IIDCU2', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'2VGUND', N'BKOF95', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'32BEMJ', N'MXC0E4', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'35ICBH', N'L9LBR5', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3A5OQW', N'ZBC4AK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3EJAE8', N'E9ZGD8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3ILOU3', N'ZPB2RI', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3K6QK6', N'6RB98V', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3L65QE', N'CQRGGK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3U2H6V', N'0FJUDY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3U8N23', N'UKIMXA', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3UU62Z', N'P0IJ7D', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3W7NVX', N'OCW7WC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3WEB6Z', N'P7G4J5', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'3YFL36', N'LT7QST', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'4969Y1', N'LDDTGO', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'4BBW9T', N'H8LLNM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'4COMPI', N'9M0WBM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'4LTCA7', N'I0ZLH6', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'4MSM83', N'IHS8WP', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'4PJST1', N'WMQ1QN', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'4SFR4N', N'B4WBCH', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'516D1Q', N'XTT5LV', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'53DA4I', N'7M9OQF', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'55I8RL', N'NU2X7M', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5AKMYV', N'I45QWP', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5AP2J0', N'CWJS9J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5DYLM6', N'J42KK1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5EZ1Y9', N'A5RCKE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5KYZJP', N'OKIW1J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5MQYGT', N'MDFAQN', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5P0D11', N'R5YUYT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5R4NPL', N'X0DPQZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5TQQUA', N'NYAG9K', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'5Y6Q5U', N'G8I50R', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6AXYZ7', N'EE2WI7', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6BXWW0', N'XO5R8W', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6EBRNP', N'A9PFP3', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6OBTZN', N'7GDPVH', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6Q2QAJ', N'03BQJE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6TUEOO', N'LR45NB', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6X1RIA', N'USO9BE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6X1TE6', N'L7G7W0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6X7H3I', N'5VQU6D', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'6ZGU9J', N'0RH0EX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'70H1BK', N'64LDTS', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'734X43', N'OT5WW0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'77EM29', N'P5WPGQ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'7CVUAB', N'CVHAW8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'7FCX16', N'F5QFQY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'7JNQFO', N'2FUJIW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'7KP59X', N'RNLQ2Z', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'7SLH95', N'1DQAEM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'7VYDU3', N'S48YPT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'7WZRV6', N'R4JUVX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'80P18O', N'DDLJFH', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'811GZF', N'ZN3065', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'88J3IF', N'7ABZNK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'89HR07', N'5BAFHE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'8AO8KH', N'WR605G', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'8NKJS2', N'85V97K', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'8PXWRS', N'QCN5AM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'8QQ4C7', N'56O8JL', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'8R1BV8', N'59ACW2', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'92Y0SH', N'75SNW5', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'946KKT', N'C2P4AH', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'954J02', N'PIIBFE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'9CKUXZ', N'D16WTC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'9LSVN8', N'XVVZF2', N'7:10', CAST(N'2017-04-04' AS Date), 30)
GO
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'9MFWL8', N'YY2OQY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'9NSW2N', N'T45TZU', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'9RFH4Y', N'1FC3PD', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'9V677A', N'IES3O5', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'9VO6DU', N'NHH51Q', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'9XK5OR', N'V2WU2Z', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'A1QWGA', N'2MZ5LD', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'A8VBK7', N'PUIUNI', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'AEKREV', N'72ILHL', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'AWVAI8', N'IGNY9E', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'AX8DXJ', N'9AMV3S', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'B6NE8C', N'ZBL9NZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'B9HEQT', N'6CQ445', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BDCP8R', N'T2F5CZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BDQ9BQ', N'A6SOGT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BIO9F9', N'T7H7XE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BJQN9B', N'CVB5E8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BL5JMF', N'G3OWGN', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BPT1GD', N'6MHSZM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BPUALF', N'RN4A5Q', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BQZHH2', N'8F3Q36', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BTH9G1', N'WS8PUY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'BZ67PW', N'IFWF9X', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'C4EVUM', N'MXQZRO', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'C6FF17', N'ND947V', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'C8HSC7', N'AZE8BG', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CDSLYB', N'MHZ7CZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CG8YVS', N'J8H09O', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CH7AO9', N'53QWS6', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CHVLBX', N'VK2TK0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CJ57Q0', N'YKGAMH', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CMHYGY', N'8FMNFA', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CQ9UKR', N'O80HW6', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CRTDC5', N'UDLKDZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CSCOWR', N'LSG27B', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'CVSUA8', N'S9E9OE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'D1CCSI', N'P00XN7', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'D2F29T', N'IAE8DJ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'D8AGD1', N'SHEUIN', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'D8QEN7', N'AD2DU3', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'DATEYN', N'M01MKQ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'DB4P94', N'47VNWA', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'DLDZ9W', N'LRQRXX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'DXLZG5', N'811U6W', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'DYM9M3', N'1FUF2J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'E1AP2A', N'CRRXSQ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'E1FJQL', N'65UQI0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'E60PQZ', N'81EC4C', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'E8A4RB', N'GR22YY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'EA0383', N'8Z7PG8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'EE9UEK', N'FIDSNN', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'EJ4D2S', N'MLM1ZI', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'EJVC3J', N'TC0BO9', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'EKQ4GM', N'1A10J8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'ELJ6P5', N'NBN89W', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'EMTQL2', N'HF27OI', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'EOOJ1F', N'9AQ6E9', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'ETG7DZ', N'UE1VS1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'F43F5P', N'E0V4GR', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'F7H71P', N'3337LP', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FB3EUD', N'SMPBVD', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FFET2M', N'BRK7PM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FIQP4Y', N'1G41KM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FK3H0A', N'G8ECUT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FLSMGL', N'PA2D7L', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FOZPRG', N'S8ITUF', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FPHRAI', N'E1U90Q', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FTDDM8', N'UMP9OX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FU5G2D', N'RGLD6S', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FUWN2O', N'JHLC1X', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'FVZ5VE', N'PDBAJK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'G0J7BY', N'KUV5PX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'G43S0G', N'UARQIT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'G4ZB9K', N'84Y00S', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'G5V3ML', N'EQPO2N', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'GB10F5', N'RLNX5R', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'GBSDR4', N'GGZ43J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'GGLA1F', N'VMLP4H', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'GL8GNU', N'OU70JO', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'GMBNLZ', N'9LSSW7', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'GNCWHN', N'BMPLIS', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'GQQAIC', N'GM1FAU', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'GTOX8S', N'R7KVNC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'GZZTKP', N'TM5APJ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'H2I3Z0', N'353PUX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'H5TZ3U', N'IEPG1C', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'H62VYG', N'IPGB04', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'H8XPZV', N'PCNU4C', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'HG1E2T', N'L3RHMX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'HGAFHA', N'S5BF19', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'HPXK2L', N'XXAPXK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'HUVR8N', N'Q552ZY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'HWLLXR', N'LHBZ7N', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'HWRIZB', N'OOG2PC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'I0IEWX', N'2F1C86', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'I24INJ', N'2MXNA8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'I3KB7W', N'F8IBAH', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'I5QABX', N'P14NZK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'I93TZX', N'P9INN0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'I9DEOY', N'UFRGTN', N'7:10', CAST(N'2017-04-04' AS Date), 30)
GO
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'I9GHX4', N'QK1Z0V', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'IC1E73', N'FR50LK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'IOAJCL', N'JDDQJZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'IPA4D3', N'9QWU1U', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'IR4ATQ', N'5BNFCZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'IWTMEX', N'T3L5AB', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'J4U8YO', N'WXT24C', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'JAM7OS', N'Y5FYO8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'JGYQIA', N'6UXY0K', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'JIFKO2', N'MWK0EM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'JKEUCX', N'YS0WB9', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'JRVCI8', N'5XIO9R', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'JS4I8L', N'FSZP50', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'JUIK9F', N'M1CABQ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'JV7EVN', N'CBN2XD', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'JVUX86', N'HDMR34', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'K0W4D1', N'3RRU1J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'K11S4M', N'B9H91P', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'K1W1YH', N'L1XRIW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'KBSW1K', N'QUFKCN', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'KC7P4F', N'JXZJH5', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'KD9BAH', N'PE45NV', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'KI2CT0', N'731TTY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'KIKR6I', N'RFZ9PK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'KL3XMJ', N'W7YH4D', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'KM2R0F', N'L57O11', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'KOJVA6', N'L5XP2I', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'KVGREV', N'5HI8OY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'L0DOFT', N'YWBZLR', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'L3QR92', N'CIS21T', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'L47821', N'W953WO', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'L7EXEU', N'H07LRS', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'L89BZJ', N'VJ3622', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'L8LVN8', N'X4ARG3', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'LCLHOE', N'L8NM2W', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'LG2KUW', N'22DJAP', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'LJIYUO', N'BBA40E', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'LL87EN', N'JU5H2R', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'LRFA6O', N'PKJY44', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'LVDZQI', N'J6AUM1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'M2MOUS', N'8LLYOB', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'M37OPR', N'UIZM3E', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'M42OMW', N'ZY5AH7', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'M5C57W', N'HOWDJ9', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'M9WU6X', N'N6ARFB', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'MINZ80', N'DV31NI', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'MK82EV', N'91YZ5Y', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'MMNP7U', N'FPUJGH', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'MQAO9T', N'Q326PJ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'MQESID', N'FN6WB7', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'MRT2ZE', N'A9Z90L', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'MUIUU7', N'TPAF8P', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'MXS0PU', N'C4L5BW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'N29752', N'46IKVA', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'N34Y3S', N'SSNHYW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'N5RAFU', N'WW39N8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NBVN6Y', N'9ODUDW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NLXB8W', N'U22YXI', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NM2WY5', N'P71OUL', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NN6JP1', N'KV9DU1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NNCBD4', N'E2IC5D', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NPDK9D', N'YUPJ8W', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NSBZYC', N'EYZEHJ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NTXUZL', N'N6F6G7', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NU6QU7', N'DX4EKG', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NVBCF0', N'356O1P', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'NY716N', N'LXROVE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'O29UOD', N'L9MGFI', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'O3X2G5', N'75S4RU', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'O5XDYE', N'V6ZLC6', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OAMZFS', N'1A5T75', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OH1BPF', N'EMO84Y', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OIVS8Q', N'5YQJ24', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OIX4IE', N'JTZ2DK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OK39SY', N'5TTFKT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OKTGPZ', N'SYQR8J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OLTF4A', N'XRE2UQ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'ONMMF1', N'RVXMYM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OQ97W8', N'C83FO5', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OTI3XQ', N'NF3SDF', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OURVIC', N'3RES8X', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OXW8XW', N'UUTMJX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'OZW74S', N'LN4UV9', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'P63T5E', N'QEBRGB', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PGGOFV', N'SV16A0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PGUD61', N'5Z2POX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PIFVO3', N'RX0F94', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PMLDCN', N'JLRX99', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'POC0MI', N'YQJUNB', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PSRFRB', N'QPYIFJ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PTSZSC', N'SZWX8V', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PTV9XD', N'WXYPPS', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PWLSH8', N'M5VH5B', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PYBRB9', N'G1DDAC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PYDZHE', N'5QNIED', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'PZ3CQC', N'GVK9BC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Q0MKSW', N'UNLSNH', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Q2ISXT', N'8V14WR', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Q3B9HU', N'HEMWXK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Q54TZQ', N'7A41P5', N'7:10', CAST(N'2017-04-04' AS Date), 30)
GO
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Q9JUU2', N'P3IR8D', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'QDKK0S', N'GTXUU0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'QG76PP', N'Y6M8P5', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'QI4PZW', N'YAKL41', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'QIGIP0', N'OQ4BDC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'QL9EY0', N'V8TM69', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'QQK2OW', N'V3C21H', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'QW40KO', N'95NY39', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'R0HLOU', N'SM4UNK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'RE5JLI', N'QAMQ4Y', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'RJD6AV', N'QZDPJE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'RMWQ8P', N'S6URKB', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'RPCGZT', N'2474SD', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'RRXNSR', N'Q1E0IL', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'RTJYYM', N'UH00Q1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'RXGYEF', N'LJV6RW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'S02O4E', N'TZXLBM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'S2VT6J', N'U4RXH5', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'S3PXU9', N'GQQ7VI', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'S4D3UQ', N'8AV6ZW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'S4WOLC', N'HERD35', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'S4XS6A', N'DZFS64', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'S695DY', N'AFA4JR', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'S9D78Z', N'NVS3BY', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SAHUDY', N'6A33KF', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SAK3BJ', N'SPHCSA', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SB8FQN', N'NU2GI3', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SBMGK9', N'O88LJM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SC9DSS', N'FLL6F0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SE9BQM', N'0YNV36', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SKCCX1', N'O2X0ZL', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SKM2VL', N'AWGOO9', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SODL3B', N'B944V8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'SX12VI', N'SABVQD', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'T15QRI', N'Q9OY08', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'T248A2', N'ILGTP8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'T5Y3A8', N'UU1EW8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TAGBZG', N'3OBI6U', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TESJH1', N'4SVMFM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TEUQU6', N'0QQRMT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TGOW4O', N'OSTXYC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'THLPVB', N'BGJGP0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TIS6PS', N'KRNPWA', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TK7WCD', N'8YO2H0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TR2H5Q', N'IRZXM2', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TU41P3', N'WJ4VAG', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TVUGKH', N'OHK7GN', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TXGCHR', N'31JD03', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'TXWYA2', N'TYJJC6', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'U29XOF', N'7GHKAL', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'U2ZYHS', N'O7OEGX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'U54P8R', N'9GTXZH', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'U54V8A', N'EKKAV0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'U5YVEC', N'U5PIAW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'U96CG0', N'P1NQIW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UD1TAF', N'SQXQED', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UEA8QH', N'2NJKOD', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UFO55S', N'U14UCT', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UG719K', N'GQZZQ6', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UH1YLK', N'D7NF5D', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UIZADF', N'LNW54R', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UO011D', N'G8KLVB', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UPBM0P', N'VONCB6', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'URJSJD', N'W9TH5L', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UTL1BK', N'XR0YQ1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UWXF8J', N'4X4PTB', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'UZ4N18', N'QV8ZHR', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'V3PFO9', N'AAUHG7', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'V3ZKJC', N'XVKVVW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'V6LONT', N'42BWZL', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'V7BNOT', N'ZBG8SM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VBQ3GN', N'QPU9EZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VE486C', N'ATT97I', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VF8APT', N'HWXDZP', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VGLFF6', N'FKR61J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VGXNL2', N'BLR702', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VJHFAF', N'VZ5G2J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VRDBFR', N'HJ3Y2Z', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VS8H57', N'M7PNED', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VT7I7L', N'MKJUF3', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VUNZLK', N'Q3CTK2', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VVBJR6', N'TVURNQ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VWAORM', N'JXT2YZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VY0O2L', N'GE1AWJ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VZJIMI', N'J5A35V', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'VZU00Z', N'5MQ7P9', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'W0R93N', N'839KQU', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'W1N2KC', N'WA0U6N', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'W9JNX9', N'EXO9O4', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'WIG2LY', N'5QFKKS', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'WKQL8C', N'WM6B95', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'WMJWN8', N'0T0B5D', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'WMXGND', N'069BW0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'WP3M75', N'J1FZBP', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'WPG6K0', N'MLO082', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'WVOLYK', N'9FX47W', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'WVZ3Y4', N'8902ZS', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'WWQ54T', N'WJR4TJ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'X0122S', N'CL4WDJ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'X12P2V', N'5CH6HM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
GO
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'X3OTGC', N'6150ZK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'X5TBE2', N'I3HQFU', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XAVO7Y', N'DOOZ1W', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XDB6V6', N'PI485J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XEZBGM', N'D850KC', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XFU0ZV', N'ZNO1F1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XHVLDW', N'8GHP9U', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XLEMU3', N'1AOM0Z', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XME1J4', N'G1011J', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XOJ5H0', N'QX8RMD', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XP75KC', N'TS6WV2', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'XPOS7W', N'10JOW1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Y0ITT1', N'WRH8S9', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Y3GYIG', N'K1A8G8', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Y85UT8', N'X0FJNK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Y8CSG6', N'WESOQX', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Y8NSAJ', N'XPVE85', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'YF7FTO', N'QTTH85', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'YGHF1L', N'RCL8K0', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'YI9NSQ', N'D2JD0T', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'YMJ6UU', N'SZV4TE', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'YPAJTU', N'8GDCUW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'YQ632K', N'OZ6707', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'YTN5Y7', N'6C0N89', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'YYK48P', N'VHF3N4', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Z2XYGO', N'WJF3T3', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Z34AWP', N'ERYYLW', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'Z84SRQ', N'Z6AIIV', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'ZAYF7H', N'5NO7G6', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'ZNMWAR', N'RFSMYZ', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'ZQQ8TY', N'1S6IVK', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'ZQUBN6', N'2K4JTV', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'ZRKGVL', N'1ZPJU1', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSDETAIL] ([BusDetailID], [BusID], [DepartureTime], [DepartureDate], [AvailableSeat]) VALUES (N'ZYW12D', N'OCQWQM', N'7:10', CAST(N'2017-04-04' AS Date), 30)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'03BQJE', N'Thuận Thảo', N'HN57', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'069BW0', N'Kim Hoàng', N'HN07', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'0BBEAY', N'Việt Bus', N'HN09', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'0FJUDY', N'Mai Linh', N'HN09', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'0QQRMT', N'Thuận Thảo', N'HN32', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'0RH0EX', N'Phương Trang', N'HN05', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'0T0B5D', N'Mai Linh', N'HN52', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'0W0K2T', N'Sao Việt', N'HN11', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'0YNV36', N'Mai Linh', N'HN22', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'10JOW1', N'Sao Việt', N'HN15', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1A10J8', N'Sao Việt', N'HN17', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1A5T75', N'Sao Việt', N'HN13', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1AOM0Z', N'Phương Trang', N'HN13', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1DQAEM', N'Việt Bus', N'HN50', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1FC3PD', N'Mai Linh', N'HN54', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1FUF2J', N'Kim Hoàng', N'HN60', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1G41KM', N'Thuận Thảo', N'HN21', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1S6IVK', N'Sao Việt', N'HN10', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1V1KSC', N'Thuận Thảo', N'HN46', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1W51YW', N'Việt Bus', N'HN42', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'1ZPJU1', N'Việt Bus', N'HN48', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'22DJAP', N'Sao Việt', N'HN30', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'2474SD', N'Kim Hoàng', N'HN11', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'2F1C86', N'Việt Bus', N'HN29', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'2FUJIW', N'Phương Trang', N'HN34', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'2K4JTV', N'Hoàng Long', N'HN40', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'2MXNA8', N'Sao Việt', N'HN47', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'2MZ5LD', N'Thuận Thảo', N'HN62', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'2NJKOD', N'Kim Hoàng', N'HN38', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'31JD03', N'Sao Việt', N'HN07', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'3337LP', N'Việt Bus', N'HN55', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'353PUX', N'Kim Hoàng', N'HN63', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'356O1P', N'Mai Linh', N'HN13', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'3OBI6U', N'Hoàng Long', N'HN49', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'3RES8X', N'Mai Linh', N'HN26', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'3RRU1J', N'Hoàng Long', N'HN11', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'3TY8QT', N'Việt Bus', N'HN10', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'42BWZL', N'Mai Linh', N'HN03', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'46IKVA', N'Mai Linh', N'HN04', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'47VNWA', N'Thuận Thảo', N'HN30', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'4SVMFM', N'Phương Trang', N'HN42', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'4X4PTB', N'Mai Linh', N'HN50', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'53QWS6', N'Hoàng Long', N'HN24', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'56O8JL', N'Phương Trang', N'HN36', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'59ACW2', N'Kim Hoàng', N'HN59', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5BAFHE', N'Kim Hoàng', N'HN61', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5BNFCZ', N'Việt Bus', N'HN61', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5CH6HM', N'Kim Hoàng', N'HN24', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5HI8OY', N'Hoàng Long', N'HN38', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5JYUGT', N'Sao Việt', N'HN08', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5KJOJD', N'Sao Việt', N'HN37', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5MQ7P9', N'Phương Trang', N'HN19', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5NO7G6', N'Kim Hoàng', N'HN09', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5QFKKS', N'Việt Bus', N'HN16', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5QNIED', N'Sao Việt', N'HN49', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5RMIOS', N'Thuận Thảo', N'HN53', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5TTFKT', N'Phương Trang', N'HN29', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5VQU6D', N'Thuận Thảo', N'HN22', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5XIO9R', N'Hoàng Long', N'HN19', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5YQJ24', N'Hoàng Long', N'HN40', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'5Z2POX', N'Kim Hoàng', N'HN16', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'6150ZK', N'Mai Linh', N'HN60', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'64LDTS', N'Phương Trang', N'HN18', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'65UQI0', N'Hoàng Long', N'HN15', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'6A33KF', N'Phương Trang', N'HN10', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'6C0N89', N'Mai Linh', N'HN25', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'6CQ445', N'Mai Linh', N'HN30', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'6MHSZM', N'Thuận Thảo', N'HN43', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'6RB98V', N'Sao Việt', N'HN51', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'6UXY0K', N'Kim Hoàng', N'HN52', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'72ILHL', N'Thuận Thảo', N'HN16', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'731TTY', N'Việt Bus', N'HN37', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'75S4RU', N'Kim Hoàng', N'HN46', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'75SNW5', N'Mai Linh', N'HN34', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'7A41P5', N'Thuận Thảo', N'HN61', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'7ABZNK', N'Việt Bus', N'HN13', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'7GDPVH', N'Phương Trang', N'HN26', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'7GHKAL', N'Việt Bus', N'HN25', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'7M9OQF', N'Phương Trang', N'HN38', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'7XG4UL', N'Việt Bus', N'HN32', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'811U6W', N'Thuận Thảo', N'HN09', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'81EC4C', N'Việt Bus', N'HN04', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'839KQU', N'Mai Linh', N'HN07', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'84Y00S', N'Thuận Thảo', N'HN41', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'85V97K', N'Mai Linh', N'HN51', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8902ZS', N'Hoàng Long', N'HN13', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8AV6ZW', N'Hoàng Long', N'HN37', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8F3Q36', N'Thuận Thảo', N'HN14', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8FMNFA', N'Kim Hoàng', N'HN02', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8GDCUW', N'Kim Hoàng', N'HN37', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8GHP9U', N'Hoàng Long', N'HN48', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8LLYOB', N'Phương Trang', N'HN20', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8V14WR', N'Việt Bus', N'HN30', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8YO2H0', N'Việt Bus', N'HN03', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'8Z7PG8', N'Sao Việt', N'HN56', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'91YZ5Y', N'Kim Hoàng', N'HN40', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'95NY39', N'Việt Bus', N'HN11', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'98O7JA', N'Sao Việt', N'HN44', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'9AMV3S', N'Việt Bus', N'HN27', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'9AQ6E9', N'Phương Trang', N'HN08', 200000.0000, 50)
GO
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'9FX47W', N'Phương Trang', N'HN55', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'9GTXZH', N'Mai Linh', N'HN62', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'9HNF1K', N'Phương Trang', N'HN07', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'9LSSW7', N'Thuận Thảo', N'HN51', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'9M0WBM', N'Việt Bus', N'HN21', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'9ODUDW', N'Mai Linh', N'HN08', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'9QWU1U', N'Kim Hoàng', N'HN17', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'A5RCKE', N'Kim Hoàng', N'HN34', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'A6SOGT', N'Phương Trang', N'HN31', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'A9PFP3', N'Mai Linh', N'HN44', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'A9Z90L', N'Thuận Thảo', N'HN26', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'AAUHG7', N'Mai Linh', N'HN39', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'AD2DU3', N'Mai Linh', N'HN19', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'AFA4JR', N'Phương Trang', N'HN03', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ATT97I', N'Phương Trang', N'HN48', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'AWGOO9', N'Sao Việt', N'HN20', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'AZE8BG', N'Phương Trang', N'HN04', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'B4WBCH', N'Kim Hoàng', N'HN21', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'B944V8', N'Kim Hoàng', N'HN41', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'B9H91P', N'Việt Bus', N'HN15', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'BBA40E', N'Phương Trang', N'HN06', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'BGJGP0', N'Phương Trang', N'HN43', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'BKOF95', N'Việt Bus', N'HN33', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'BLR702', N'Mai Linh', N'HN32', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'BMPLIS', N'Việt Bus', N'HN20', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'BRK7PM', N'Hoàng Long', N'HN04', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'C2P4AH', N'Hoàng Long', N'HN17', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'C4L5BW', N'Việt Bus', N'HN02', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'C83FO5', N'Hoàng Long', N'HN36', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'CBN2XD', N'Hoàng Long', N'HN27', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'CIS21T', N'Sao Việt', N'HN12', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'CL4WDJ', N'Kim Hoàng', N'HN49', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'CMESBP', N'Sao Việt', N'HN50', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'CQRGGK', N'Thuận Thảo', N'HN56', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'CRRXSQ', N'Hoàng Long', N'HN53', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'CVB5E8', N'Sao Việt', N'HN35', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'CVHAW8', N'Việt Bus', N'HN34', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'CWJS9J', N'Kim Hoàng', N'HN31', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'D16WTC', N'Mai Linh', N'HN43', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'D2JD0T', N'Việt Bus', N'HN46', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'D7NF5D', N'Kim Hoàng', N'HN23', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'D850KC', N'Hoàng Long', N'HN23', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'DDLJFH', N'Việt Bus', N'HN35', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'DJDV61', N'Sao Việt', N'HN23', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'DOOZ1W', N'Thuận Thảo', N'HN63', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'DV31NI', N'Thuận Thảo', N'HN59', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'DX4EKG', N'Mai Linh', N'HN56', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'DZFS64', N'Việt Bus', N'HN36', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'E0V4GR', N'Sao Việt', N'HN42', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'E1U90Q', N'Kim Hoàng', N'HN13', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'E2IC5D', N'Phương Trang', N'HN45', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'E6BZZP', N'Phương Trang', N'HN62', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'E9ZGD8', N'Kim Hoàng', N'HN12', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'EE2WI7', N'Kim Hoàng', N'HN14', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'EKKAV0', N'Sao Việt', N'HN14', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'EMO84Y', N'Việt Bus', N'HN62', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'EQPO2N', N'Thuận Thảo', N'HN27', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ERYYLW', N'Sao Việt', N'HN09', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'EXO9O4', N'Hoàng Long', N'HN29', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'EYZEHJ', N'Việt Bus', N'HN57', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'F5QFQY', N'Việt Bus', N'HN14', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'F8IBAH', N'Sao Việt', N'HN54', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'FFYLTK', N'Mai Linh', N'HN63', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'FIDSNN', N'Sao Việt', N'HN16', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'FKR61J', N'Mai Linh', N'HN02', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'FLL6F0', N'Sao Việt', N'HN29', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'FN6WB7', N'Kim Hoàng', N'HN08', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'FPUJGH', N'Hoàng Long', N'HN05', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'FR50LK', N'Hoàng Long', N'HN09', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'FSZP50', N'Phương Trang', N'HN49', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'G1011J', N'Phương Trang', N'HN27', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'G1DDAC', N'Hoàng Long', N'HN08', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'G3OWGN', N'Sao Việt', N'HN22', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'G8ECUT', N'Mai Linh', N'HN47', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'G8I50R', N'Sao Việt', N'HN52', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'G8KLVB', N'Thuận Thảo', N'HN19', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GE1AWJ', N'Hoàng Long', N'HN39', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GGZ43J', N'Sao Việt', N'HN03', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GI8ZY8', N'Hoàng Long', N'HN41', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GINZ19', N'Việt Bus', N'HN17', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GM1FAU', N'Kim Hoàng', N'HN20', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GQQ7VI', N'Thuận Thảo', N'HN29', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GQZZQ6', N'Kim Hoàng', N'HN45', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GR22YY', N'Kim Hoàng', N'HN57', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GTXUU0', N'Phương Trang', N'HN02', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'GVK9BC', N'Hoàng Long', N'HN31', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'H07LRS', N'Sao Việt', N'HN32', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'H8LLNM', N'Thuận Thảo', N'HN10', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HDMR34', N'Phương Trang', N'HN56', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HEMWXK', N'Sao Việt', N'HN25', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HERD35', N'Hoàng Long', N'HN57', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HF27OI', N'Phương Trang', N'HN24', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HFHZ2X', N'Hoàng Long', N'HN52', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HJ3Y2Z', N'Sao Việt', N'HN05', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HL94ZZ', N'Kim Hoàng', N'HN19', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HMTB3P', N'Hoàng Long', N'HN02', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HOWDJ9', N'Kim Hoàng', N'HN22', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'HWXDZP', N'Phương Trang', N'HN22', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'I0ZLH6', N'Phương Trang', N'HN54', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'I3HQFU', N'Thuận Thảo', N'HN44', 200000.0000, 50)
GO
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'I45QWP', N'Sao Việt', N'HN40', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'IAE8DJ', N'Sao Việt', N'HN46', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'IEPG1C', N'Thuận Thảo', N'HN13', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'IES3O5', N'Phương Trang', N'HN28', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'IFWF9X', N'Phương Trang', N'HN47', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'IGNY9E', N'Phương Trang', N'HN30', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'IHS8WP', N'Sao Việt', N'HN21', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'IIDCU2', N'Sao Việt', N'HN39', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ILGTP8', N'Mai Linh', N'HN61', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'IPGB04', N'Việt Bus', N'HN51', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'IRZXM2', N'Mai Linh', N'HN45', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'J1FZBP', N'Kim Hoàng', N'HN54', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'J42KK1', N'Sao Việt', N'HN27', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'J5A35V', N'Việt Bus', N'HN54', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'J6AUM1', N'Thuận Thảo', N'HN37', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'J8H09O', N'Kim Hoàng', N'HN18', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'JDDQJZ', N'Mai Linh', N'HN11', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'JHLC1X', N'Thuận Thảo', N'HN20', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'JLRX99', N'Thuận Thảo', N'HN35', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'JTZ2DK', N'Phương Trang', N'HN17', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'JU5H2R', N'Việt Bus', N'HN52', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'JXT2YZ', N'Thuận Thảo', N'HN05', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'JXZJH5', N'Việt Bus', N'HN23', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'K1A8G8', N'Mai Linh', N'HN41', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'KQ3YXX', N'Việt Bus', N'HN58', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'KRNPWA', N'Mai Linh', N'HN36', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'KUV5PX', N'Sao Việt', N'HN57', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'KV9DU1', N'Hoàng Long', N'HN35', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'L1XRIW', N'Hoàng Long', N'HN51', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'L3RHMX', N'Phương Trang', N'HN39', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'L57O11', N'Hoàng Long', N'HN20', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'L5XP2I', N'Kim Hoàng', N'HN10', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'L7G7W0', N'Thuận Thảo', N'HN36', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'L8NM2W', N'Thuận Thảo', N'HN33', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'L9LBR5', N'Sao Việt', N'HN59', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'L9MGFI', N'Việt Bus', N'HN53', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LDDTGO', N'Kim Hoàng', N'HN58', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LHBZ7N', N'Thuận Thảo', N'HN47', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LJ7KPM', N'Kim Hoàng', N'HN33', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LJV6RW', N'Sao Việt', N'HN31', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LN4UV9', N'Sao Việt', N'HN02', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LNW54R', N'Hoàng Long', N'HN16', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LPFIWZ', N'Phương Trang', N'HN21', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LR45NB', N'Thuận Thảo', N'HN54', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LRQRXX', N'Kim Hoàng', N'HN39', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LSG27B', N'Thuận Thảo', N'HN45', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LT7QST', N'Mai Linh', N'HN37', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'LXROVE', N'Thuận Thảo', N'HN15', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'M01MKQ', N'Hoàng Long', N'HN32', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'M1CABQ', N'Hoàng Long', N'HN25', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'M5VH5B', N'Hoàng Long', N'HN30', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'M7PNED', N'Phương Trang', N'HN50', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'MBI5J6', N'Thuận Thảo', N'HN49', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'MDFAQN', N'Mai Linh', N'HN59', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'MHZ7CZ', N'Thuận Thảo', N'HN17', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'MKJUF3', N'Việt Bus', N'HN59', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'MLM1ZI', N'Hoàng Long', N'HN28', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'MLO082', N'Sao Việt', N'HN28', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'MWK0EM', N'Hoàng Long', N'HN47', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'MXC0E4', N'Kim Hoàng', N'HN51', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'MXQZRO', N'Phương Trang', N'HN23', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'N6ARFB', N'Thuận Thảo', N'HN07', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'N6F6G7', N'Mai Linh', N'HN14', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'NBN89W', N'Mai Linh', N'HN12', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ND947V', N'Việt Bus', N'HN63', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'NF3SDF', N'Hoàng Long', N'HN61', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'NHH51Q', N'Kim Hoàng', N'HN36', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'NU2GI3', N'Thuận Thảo', N'HN55', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'NU2X7M', N'Phương Trang', N'HN57', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'NVS3BY', N'Việt Bus', N'HN44', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'NYAG9K', N'Việt Bus', N'HN07', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'O2X0ZL', N'Phương Trang', N'HN15', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'O7OEGX', N'Sao Việt', N'HN58', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'O80HW6', N'Việt Bus', N'HN08', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'O88LJM', N'Sao Việt', N'HN63', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OCQWQM', N'Sao Việt', N'HN34', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OCW7WC', N'Hoàng Long', N'HN62', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OHK7GN', N'Mai Linh', N'HN46', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OKIW1J', N'Kim Hoàng', N'HN50', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OOG2PC', N'Thuận Thảo', N'HN18', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OQ4BDC', N'Mai Linh', N'HN21', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OSTXYC', N'Phương Trang', N'HN52', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OT5WW0', N'Mai Linh', N'HN18', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OU70JO', N'Phương Trang', N'HN09', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'OZ6707', N'Kim Hoàng', N'HN44', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'P00XN7', N'Mai Linh', N'HN10', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'P0IJ7D', N'Mai Linh', N'HN28', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'P14NZK', N'Kim Hoàng', N'HN26', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'P1NQIW', N'Kim Hoàng', N'HN47', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'P3IR8D', N'Mai Linh', N'HN48', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'P5WPGQ', N'Kim Hoàng', N'HN30', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'P71OUL', N'Việt Bus', N'HN22', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'P7G4J5', N'Mai Linh', N'HN06', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'P9INN0', N'Việt Bus', N'HN28', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'PA2D7L', N'Hoàng Long', N'HN33', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'PCNU4C', N'Thuận Thảo', N'HN11', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'PDBAJK', N'Việt Bus', N'HN05', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'PE45NV', N'Hoàng Long', N'HN59', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'PI485J', N'Thuận Thảo', N'HN02', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'PIIBFE', N'Sao Việt', N'HN48', 200000.0000, 50)
GO
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'PJN665', N'Việt Bus', N'HN24', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'PKJY44', N'Kim Hoàng', N'HN53', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'PUIUNI', N'Phương Trang', N'HN16', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Q1E0IL', N'Sao Việt', N'HN06', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Q326PJ', N'Việt Bus', N'HN43', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Q3CTK2', N'Mai Linh', N'HN42', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Q3NK4G', N'Phương Trang', N'HN51', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Q552ZY', N'Thuận Thảo', N'HN34', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Q9OY08', N'Hoàng Long', N'HN06', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QAMQ4Y', N'Sao Việt', N'HN60', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QCN5AM', N'Việt Bus', N'HN31', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QEBRGB', N'Hoàng Long', N'HN34', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QK1Z0V', N'Hoàng Long', N'HN03', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QPU9EZ', N'Kim Hoàng', N'HN43', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QPYIFJ', N'Mai Linh', N'HN33', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QTTH85', N'Việt Bus', N'HN45', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QUFKCN', N'Việt Bus', N'HN49', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QV8ZHR', N'Mai Linh', N'HN23', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QX5CKO', N'Kim Hoàng', N'HN04', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QX8RMD', N'Thuận Thảo', N'HN58', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'QZDPJE', N'Hoàng Long', N'HN63', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'R4JUVX', N'Việt Bus', N'HN18', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'R5YUYT', N'Hoàng Long', N'HN07', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'R7KVNC', N'Phương Trang', N'HN11', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'RCL8K0', N'Thuận Thảo', N'HN48', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'RFSMYZ', N'Mai Linh', N'HN20', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'RFZ9PK', N'Kim Hoàng', N'HN35', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'RGLD6S', N'Thuận Thảo', N'HN12', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'RLNX5R', N'Kim Hoàng', N'HN48', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'RN4A5Q', N'Thuận Thảo', N'HN03', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'RNLQ2Z', N'Phương Trang', N'HN53', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'RVXMYM', N'Việt Bus', N'HN60', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'RX0F94', N'Sao Việt', N'HN41', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'S48YPT', N'Sao Việt', N'HN19', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'S5BF19', N'Kim Hoàng', N'HN32', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'S6URKB', N'Mai Linh', N'HN57', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'S8ITUF', N'Thuận Thảo', N'HN39', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'S9E9OE', N'Kim Hoàng', N'HN28', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SABVQD', N'Mai Linh', N'HN29', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SHEUIN', N'Kim Hoàng', N'HN56', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SM4UNK', N'Hoàng Long', N'HN26', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SMPBVD', N'Kim Hoàng', N'HN42', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SPHCSA', N'Phương Trang', N'HN32', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SQXQED', N'Mai Linh', N'HN05', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SSNHYW', N'Hoàng Long', N'HN46', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SV16A0', N'Phương Trang', N'HN25', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SYQR8J', N'Mai Linh', N'HN40', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SZV4TE', N'Sao Việt', N'HN36', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'SZWX8V', N'Việt Bus', N'HN26', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'T2F5CZ', N'Việt Bus', N'HN47', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'T3L5AB', N'Sao Việt', N'HN18', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'T45TZU', N'Hoàng Long', N'HN54', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'T7H7XE', N'Hoàng Long', N'HN60', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'TC0BO9', N'Phương Trang', N'HN12', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'TM5APJ', N'Hoàng Long', N'HN43', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'TPAF8P', N'Phương Trang', N'HN35', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'TS6WV2', N'Sao Việt', N'HN33', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'TVURNQ', N'Kim Hoàng', N'HN05', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'TYJJC6', N'Hoàng Long', N'HN44', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'TZXLBM', N'Mai Linh', N'HN35', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'U14UCT', N'Sao Việt', N'HN24', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'U22YXI', N'Thuận Thảo', N'HN52', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'U4RXH5', N'Phương Trang', N'HN40', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'U5PIAW', N'Việt Bus', N'HN56', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'U8ZB9Z', N'Việt Bus', N'HN06', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UARQIT', N'Kim Hoàng', N'HN27', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UDLKDZ', N'Sao Việt', N'HN04', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UE1VS1', N'Hoàng Long', N'HN50', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UFRGTN', N'Hoàng Long', N'HN58', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UH00Q1', N'Sao Việt', N'HN38', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UIZM3E', N'Phương Trang', N'HN33', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UKIMXA', N'Mai Linh', N'HN38', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UMP9OX', N'Việt Bus', N'HN19', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UNLSNH', N'Hoàng Long', N'HN21', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'USO9BE', N'Phương Trang', N'HN44', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UU1EW8', N'Phương Trang', N'HN14', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'UUTMJX', N'Kim Hoàng', N'HN62', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'V2WU2Z', N'Thuận Thảo', N'HN04', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'V3C21H', N'Việt Bus', N'HN39', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'V6ZLC6', N'Hoàng Long', N'HN42', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'V8TM69', N'Kim Hoàng', N'HN29', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'VHF3N4', N'Thuận Thảo', N'HN08', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'VJ3622', N'Hoàng Long', N'HN10', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'VK2TK0', N'Mai Linh', N'HN49', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'VMLP4H', N'Hoàng Long', N'HN56', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'VONCB6', N'Thuận Thảo', N'HN60', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'VZ5G2J', N'Việt Bus', N'HN41', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'W7YH4D', N'Thuận Thảo', N'HN40', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'W953WO', N'Mai Linh', N'HN58', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'W9TH5L', N'Phương Trang', N'HN60', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WA0U6N', N'Sao Việt', N'HN45', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WD9PN8', N'Hoàng Long', N'HN45', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WESOQX', N'Sao Việt', N'HN43', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WJ4VAG', N'Việt Bus', N'HN12', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WJF3T3', N'Mai Linh', N'HN53', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WJR4TJ', N'Mai Linh', N'HN17', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WM6B95', N'Phương Trang', N'HN63', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WMQ1QN', N'Thuận Thảo', N'HN23', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WR605G', N'Hoàng Long', N'HN55', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WRH8S9', N'Mai Linh', N'HN15', 200000.0000, 50)
GO
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WRLEG1', N'Kim Hoàng', N'HN25', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WS8PUY', N'Phương Trang', N'HN61', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WW39N8', N'Hoàng Long', N'HN14', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WXT24C', N'Thuận Thảo', N'HN28', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'WXYPPS', N'Mai Linh', N'HN55', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'X0DPQZ', N'Phương Trang', N'HN41', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'X0FJNK', N'Thuận Thảo', N'HN06', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'X4ARG3', N'Sao Việt', N'HN55', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'XO5R8W', N'Kim Hoàng', N'HN55', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'XPVE85', N'Sao Việt', N'HN61', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'XR0YQ1', N'Việt Bus', N'HN38', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'XRE2UQ', N'Mai Linh', N'HN27', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'XTT5LV', N'Thuận Thảo', N'HN50', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'XVKVVW', N'Mai Linh', N'HN24', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'XVVZF2', N'Thuận Thảo', N'HN25', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'XXAPXK', N'Mai Linh', N'HN16', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Y5FYO8', N'Sao Việt', N'HN53', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Y6M8P5', N'Thuận Thảo', N'HN31', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'YAKL41', N'Sao Việt', N'HN26', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'YKGAMH', N'Phương Trang', N'HN46', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'YQJUNB', N'Thuận Thảo', N'HN38', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'YS0WB9', N'Hoàng Long', N'HN12', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'YUPJ8W', N'Phương Trang', N'HN58', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'YWBZLR', N'Kim Hoàng', N'HN06', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'YY2OQY', N'Việt Bus', N'HN40', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Z4D61X', N'Kim Hoàng', N'HN15', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'Z6AIIV', N'Mai Linh', N'HN31', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ZBC4AK', N'Kim Hoàng', N'HN03', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ZBG8SM', N'Sao Việt', N'HN62', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ZBL9NZ', N'Thuận Thảo', N'HN24', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ZN3065', N'Thuận Thảo', N'HN42', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ZNO1F1', N'Hoàng Long', N'HN18', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ZPB2RI', N'Phương Trang', N'HN59', 200000.0000, 50)
INSERT [dbo].[BUSES] ([BusID], [BusName], [RouteID], [Fare], [TotalSeat]) VALUES (N'ZY5AH7', N'Phương Trang', N'HN37', 200000.0000, 50)
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'01', N'﻿Hà Nội', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'02', N'Hải Phòng', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'03', N'Đà Nẵng', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'04', N'TP HCM', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'05', N'An Giang', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'06', N'Bà Rịa - Vũng Tàu', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'07', N'Bắc Giang', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'08', N'Bắc Kạn', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'09', N'Bạc Liêu', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'10', N'Bắc Ninh', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'11', N'Bến Tre', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'12', N'Bình Định', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'13', N'Bình Dương', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'14', N'Bình Phước', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'15', N'Bình Thuận', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'16', N'Cà Mau', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'17', N'Cao Bằng', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'18', N'Cần Thơ', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'19', N'Đắk Lắk', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'20', N'Đắk Nông', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'21', N'Điện Biên', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'22', N'Đồng Nai', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'23', N'Đồng Tháp', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'24', N'Gia Lai', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'25', N'Hà Giang', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'26', N'Hà Nam', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'27', N'Hà Tĩnh', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'28', N'Hải Dương', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'29', N'Hậu Giang', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'30', N'Hòa Bình', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'31', N'Hưng Yên', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'32', N'Khánh Hòa', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'33', N'Kiên Giang', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'34', N'Kon Tum', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'35', N'Lai Châu', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'36', N'Lâm Đồng', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'37', N'Lạng Sơn', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'38', N'Lào Cai', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'39', N'Long An', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'40', N'Nam Định', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'41', N'Nghệ An', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'42', N'Ninh Bình', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'43', N'Ninh Thuận', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'44', N'Phú Thọ', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'45', N'Quảng Bình', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'46', N'Quảng Nam', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'47', N'Quảng Ngãi', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'48', N'Quảng Ninh', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'49', N'Quảng Trị', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'50', N'Sóc Trăng', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'51', N'Sơn La', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'52', N'Tây Ninh', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'53', N'Thái Bình', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'54', N'Thái Nguyên', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'55', N'Thanh Hóa', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'56', N'Thừa Thiên Huế', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'57', N'Tiền Giang', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'58', N'Trà Vinh', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'59', N'Tuyên Quang', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'60', N'Vĩnh Long', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'61', N'Vĩnh Phúc', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'62', N'Yên Bái', N'84')
INSERT [dbo].[CITIES] ([CityID], [CityName], [NationalID]) VALUES (N'63', N'Phú Yên', N'84')
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN02', N'01', N'02', 207)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN03', N'01', N'03', 471)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN04', N'01', N'04', 469)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN05', N'01', N'05', 266)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN06', N'01', N'06', 853)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN07', N'01', N'07', 952)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN08', N'01', N'08', 727)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN09', N'01', N'09', 319)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN10', N'01', N'10', 264)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN11', N'01', N'11', 613)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN12', N'01', N'12', 712)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN13', N'01', N'13', 945)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN14', N'01', N'14', 948)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN15', N'01', N'15', 394)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN16', N'01', N'16', 742)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN17', N'01', N'17', 313)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN18', N'01', N'18', 802)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN19', N'01', N'19', 854)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN20', N'01', N'20', 515)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN21', N'01', N'21', 793)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN22', N'01', N'22', 882)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN23', N'01', N'23', 875)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN24', N'01', N'24', 304)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN25', N'01', N'25', 602)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN26', N'01', N'26', 688)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN27', N'01', N'27', 980)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN28', N'01', N'28', 839)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN29', N'01', N'29', 628)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN30', N'01', N'30', 822)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN31', N'01', N'31', 918)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN32', N'01', N'32', 629)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN33', N'01', N'33', 268)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN34', N'01', N'34', 798)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN35', N'01', N'35', 287)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN36', N'01', N'36', 290)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN37', N'01', N'37', 375)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN38', N'01', N'38', 578)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN39', N'01', N'39', 859)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN40', N'01', N'40', 638)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN41', N'01', N'41', 669)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN42', N'01', N'42', 882)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN43', N'01', N'43', 902)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN44', N'01', N'44', 490)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN45', N'01', N'45', 953)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN46', N'01', N'46', 433)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN47', N'01', N'47', 604)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN48', N'01', N'48', 705)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN49', N'01', N'49', 477)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN50', N'01', N'50', 749)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN51', N'01', N'51', 395)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN52', N'01', N'52', 225)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN53', N'01', N'53', 946)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN54', N'01', N'54', 313)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN55', N'01', N'55', 938)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN56', N'01', N'56', 505)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN57', N'01', N'57', 509)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN58', N'01', N'58', 393)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN59', N'01', N'59', 579)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN60', N'01', N'60', 688)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN61', N'01', N'61', 604)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN62', N'01', N'62', 329)
INSERT [dbo].[ROUTES] ([RouteID], [FromCityID], [ToCityID], [Duration]) VALUES (N'HN63', N'01', N'63', 587)
INSERT [dbo].[USERS] ([Email], [Password], [Name], [Role]) VALUES (N'admin@citybus.com', N'admin', N'Admin', 1)
INSERT [dbo].[USERS] ([Email], [Password], [Name], [Role]) VALUES (N'quynhnh@citybus.com', N'p@ssword', N'Quynh Nguyen', 0)
INSERT [dbo].[USERS] ([Email], [Password], [Name], [Role]) VALUES (N'tungdsse04019@fpt.edu.vn', N'123456', N'Dong Son Tung', 0)
ALTER TABLE [dbo].[BOOKING]  WITH CHECK ADD  CONSTRAINT [FK_BOOKING_BUSDETAIL] FOREIGN KEY([BusDetailID])
REFERENCES [dbo].[BUSDETAIL] ([BusDetailID])
GO
ALTER TABLE [dbo].[BOOKING] CHECK CONSTRAINT [FK_BOOKING_BUSDETAIL]
GO
ALTER TABLE [dbo].[BOOKING]  WITH CHECK ADD  CONSTRAINT [FK_BOOKING_USERS] FOREIGN KEY([UserEmail])
REFERENCES [dbo].[USERS] ([Email])
GO
ALTER TABLE [dbo].[BOOKING] CHECK CONSTRAINT [FK_BOOKING_USERS]
GO
ALTER TABLE [dbo].[BUSDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_BUSDETAIL_BUSES] FOREIGN KEY([BusID])
REFERENCES [dbo].[BUSES] ([BusID])
GO
ALTER TABLE [dbo].[BUSDETAIL] CHECK CONSTRAINT [FK_BUSDETAIL_BUSES]
GO
ALTER TABLE [dbo].[BUSES]  WITH CHECK ADD  CONSTRAINT [FK_BUSES_ROUTES] FOREIGN KEY([RouteID])
REFERENCES [dbo].[ROUTES] ([RouteID])
GO
ALTER TABLE [dbo].[BUSES] CHECK CONSTRAINT [FK_BUSES_ROUTES]
GO
ALTER TABLE [dbo].[PASSENGER]  WITH CHECK ADD  CONSTRAINT [FK_PASSENGER_BOOKING] FOREIGN KEY([BookingID])
REFERENCES [dbo].[BOOKING] ([BookingID])
GO
ALTER TABLE [dbo].[PASSENGER] CHECK CONSTRAINT [FK_PASSENGER_BOOKING]
GO
ALTER TABLE [dbo].[ROUTES]  WITH CHECK ADD  CONSTRAINT [FK_ROUTES_CITIES] FOREIGN KEY([FromCityID])
REFERENCES [dbo].[CITIES] ([CityID])
GO
ALTER TABLE [dbo].[ROUTES] CHECK CONSTRAINT [FK_ROUTES_CITIES]
GO
ALTER TABLE [dbo].[ROUTES]  WITH CHECK ADD  CONSTRAINT [FK_ROUTES_CITIES1] FOREIGN KEY([ToCityID])
REFERENCES [dbo].[CITIES] ([CityID])
GO
ALTER TABLE [dbo].[ROUTES] CHECK CONSTRAINT [FK_ROUTES_CITIES1]
GO
ALTER TABLE [dbo].[BUSDETAIL]  WITH CHECK ADD CHECK  (([AvailableSeat]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [CityBus] SET  READ_WRITE 
GO
