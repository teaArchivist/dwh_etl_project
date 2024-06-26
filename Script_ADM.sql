USE [master]
GO
	 
/****** Object:  Database [Project_ADM]    Script Date: 5/13/2024 11:09:49 AM ******/
CREATE DATABASE [Project_ADM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_ADM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_ADM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_ADM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_ADM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_ADM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Project_ADM] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Project_ADM] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Project_ADM] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Project_ADM] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Project_ADM] SET ARITHABORT OFF 
GO

ALTER DATABASE [Project_ADM] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Project_ADM] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Project_ADM] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Project_ADM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Project_ADM] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Project_ADM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Project_ADM] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Project_ADM] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Project_ADM] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Project_ADM] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Project_ADM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Project_ADM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Project_ADM] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Project_ADM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Project_ADM] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Project_ADM] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Project_ADM] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Project_ADM] SET RECOVERY FULL 
GO

ALTER DATABASE [Project_ADM] SET  MULTI_USER 
GO

ALTER DATABASE [Project_ADM] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Project_ADM] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Project_ADM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Project_ADM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Project_ADM] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Project_ADM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Project_ADM] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Project_ADM] SET  READ_WRITE 
GO

USE [Project_ADM]
GO

/****** Object:  Table [dbo].[Functional_Rejects]    Script Date: 5/13/2024 11:09:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Functional_Rejects](
	[RejectDate] [datetime] NULL,
	[RejectPackageAndTask] [nvarchar](205) NULL,
	[RejectColumn] [nvarchar](max) NULL,
	[RejectDescription] [nvarchar](max) NULL,
	[Number_of_cases] [numeric](20, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Technicals_Rejects]    Script Date: 5/13/2024 11:09:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Technicals_Rejects](
	[RejectDate] [datetime] NULL,
	[RejectPackageAndTask] [nvarchar](255) NULL,
	[RejectColumn] [nvarchar](50) NULL,
	[RejectDescription] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
