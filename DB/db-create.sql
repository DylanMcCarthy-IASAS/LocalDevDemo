USE [master]
GO

CREATE LOGIN [NightSkyDbUser] WITH PASSWORD=N'DifZeZoxtMe+xUmOoLfJB7F9FbZLKGPxs4vXI1+d7ZE=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

/****** Object:  Database [NightSkyDb]    Script Date: 20/06/2022 8:19:59 PM ******/
CREATE DATABASE [NightSkyDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NightSkyDb', FILENAME = N'/var/opt/mssql/data/NightSkyDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NightSkyDb_log', FILENAME = N'/var/opt/mssql/data/NightSkyDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NightSkyDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NightSkyDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NightSkyDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NightSkyDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NightSkyDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NightSkyDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NightSkyDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [NightSkyDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NightSkyDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NightSkyDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NightSkyDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NightSkyDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NightSkyDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NightSkyDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NightSkyDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NightSkyDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NightSkyDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NightSkyDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NightSkyDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NightSkyDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NightSkyDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NightSkyDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NightSkyDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NightSkyDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NightSkyDb] SET RECOVERY FULL 
GO
ALTER DATABASE [NightSkyDb] SET  MULTI_USER 
GO
ALTER DATABASE [NightSkyDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NightSkyDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NightSkyDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NightSkyDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NightSkyDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NightSkyDb', N'ON'
GO
ALTER DATABASE [NightSkyDb] SET QUERY_STORE = OFF
GO
USE [NightSkyDb]
GO
/****** Object:  User [NightSkyDbUser]    Script Date: 20/06/2022 8:19:59 PM ******/
CREATE USER [NightSkyDbUser] FOR LOGIN [NightSkyDbUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NightSkyDbUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NightSkyDbUser]
GO
/****** Object:  Table [dbo].[Galaxies]    Script Date: 20/06/2022 8:19:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
USE [NightSkyDb]
GO
/****** Object:  Table [dbo].[Galaxies]    Script Date: 20/06/2022 10:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galaxies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[DistanceFromSolarSystem] [int] NOT NULL,
 CONSTRAINT [PK_Galaxies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planets]    Script Date: 20/06/2022 10:23:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[HasLife] [bit] NOT NULL,
	[DistanceFromSun] [int] NULL,
 CONSTRAINT [PK_Planets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Galaxies] ON 
GO
INSERT [dbo].[Galaxies] ([Id], [Name], [Type], [DistanceFromSolarSystem]) VALUES (1, N'M32 Andromeda', N'Spiral', 752)
GO
INSERT [dbo].[Galaxies] ([Id], [Name], [Type], [DistanceFromSolarSystem]) VALUES (2, N'LMC Large Magellanic Cloud', N'Magellanic Spiral', 50)
GO
INSERT [dbo].[Galaxies] ([Id], [Name], [Type], [DistanceFromSolarSystem]) VALUES (3, N'M33 Triangulum', N'Spiral', 970)
GO
SET IDENTITY_INSERT [dbo].[Galaxies] OFF
GO
SET IDENTITY_INSERT [dbo].[Planets] ON 
GO
INSERT [dbo].[Planets] ([Id], [Name], [HasLife], [DistanceFromSun]) VALUES (1, N'Mercury', 0, 58)
GO
INSERT [dbo].[Planets] ([Id], [Name], [HasLife], [DistanceFromSun]) VALUES (2, N'Venus', 0, 108)
GO
INSERT [dbo].[Planets] ([Id], [Name], [HasLife], [DistanceFromSun]) VALUES (3, N'Earth', 1, 150)
GO
INSERT [dbo].[Planets] ([Id], [Name], [HasLife], [DistanceFromSun]) VALUES (4, N'Mars', 0, 228)
GO
INSERT [dbo].[Planets] ([Id], [Name], [HasLife], [DistanceFromSun]) VALUES (5, N'Jupiter', 0, 778)
GO
INSERT [dbo].[Planets] ([Id], [Name], [HasLife], [DistanceFromSun]) VALUES (6, N'Saturn', 0, 1427)
GO
INSERT [dbo].[Planets] ([Id], [Name], [HasLife], [DistanceFromSun]) VALUES (7, N'Uranus', 0, 2871)
GO
INSERT [dbo].[Planets] ([Id], [Name], [HasLife], [DistanceFromSun]) VALUES (8, N'Neptune', 0, 4497)
GO
SET IDENTITY_INSERT [dbo].[Planets] OFF
GO

USE [master]
GO
ALTER DATABASE [NightSkyDb] SET  READ_WRITE 
GO
