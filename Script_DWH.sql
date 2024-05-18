USE [master]
GO
	 
/****** Object:  Database [Project_DWH]    Script Date: 5/13/2024 3:32:10 AM ******/
CREATE DATABASE [Project_DWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_DWH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_DWH.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_DWH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_DWH_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_DWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Project_DWH] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Project_DWH] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Project_DWH] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Project_DWH] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Project_DWH] SET ARITHABORT OFF 
GO

ALTER DATABASE [Project_DWH] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Project_DWH] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Project_DWH] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Project_DWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Project_DWH] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Project_DWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Project_DWH] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Project_DWH] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Project_DWH] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Project_DWH] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Project_DWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Project_DWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Project_DWH] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Project_DWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Project_DWH] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Project_DWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Project_DWH] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Project_DWH] SET RECOVERY FULL 
GO

ALTER DATABASE [Project_DWH] SET  MULTI_USER 
GO

ALTER DATABASE [Project_DWH] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Project_DWH] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Project_DWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Project_DWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Project_DWH] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Project_DWH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Project_DWH] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Project_ADM] SET  READ_WRITE 
GO

USE [Project_DWH]
GO
	 
/****** Object:  Table [dbo].[DimCall_Charges]    Script Date: 5/13/2024 3:32:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCall_Charges](
	[CallChargeSurrogateKey] [int] IDENTITY(1,1) NOT NULL,
	[CallChargeKey] [varchar](50) NULL,
	[CallType] [varchar](50) NULL,
	[Year] [int] NULL,
	[ChargesPerMinute] [numeric](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CallChargeSurrogateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
	 
/****** Object:  Table [dbo].[DimEmployees]    Script Date: 5/13/2024 3:32:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimEmployees](
	[EmployeeSurrogateKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [varchar](20) NULL,
	[EmployeeFirstName] [varchar](50) NULL,
	[EmployeeLastName] [varchar](50) NULL,
	[ManagerFirstName] [varchar](50) NULL,
	[ManagerLastName] [varchar](50) NULL,
	[SiteTown] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeSurrogateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
	 
/****** Object:  Table [dbo].[FactCall_Data]    Script Date: 5/13/2024 3:32:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactCall_Data](
	[CallUniqueKey] [int] IDENTITY(1,1) NOT NULL,
	[CallTime] [time](7) NULL,
	[CallDurationInSeconds] [int] NULL,
	[WaitTimeInSeconds] [int] NULL,
	[CallAbandoned] [bit] NULL,
	[WithinSLA] [bit] NULL,
	[EmployeeSurrogateKey] [int] NULL,
	[CallChargeSurrogateKey] [int] NULL,
	[CallDate_DateKey] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimDate]    Script Date: 5/13/2024 3:32:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[DaySuffix] [char](2) NOT NULL,
	[Weekday] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) NOT NULL,
	[WeekDayName_Short] [char](3) NOT NULL,
	[WeekDayName_FirstLetter] [char](1) NOT NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[MonthName_Short] [char](3) NOT NULL,
	[MonthName_FirstLetter] [char](1) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[Year] [int] NOT NULL,
	[MMYYYY] [char](6) NOT NULL,
	[MonthYear] [char](7) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET NOCOUNT ON

/****** Populate the DimDate table ******/
	 
TRUNCATE TABLE DimDate

DECLARE @CurrentDate DATE = '2018-01-01'
DECLARE @EndDate DATE = '2021-12-31'

WHILE @CurrentDate < @EndDate
BEGIN
   INSERT INTO [dbo].[DimDate] (
      [DateKey],
      [Date],
      [Day],
      [DaySuffix],
      [Weekday],
      [WeekDayName],
      [WeekDayName_Short],
      [WeekDayName_FirstLetter],
      [DOWInMonth],
      [DayOfYear],
      [WeekOfMonth],
      [WeekOfYear],
      [Month],
      [MonthName],
      [MonthName_Short],
      [MonthName_FirstLetter],
      [Quarter],
      [QuarterName],
      [Year],
      [MMYYYY],
      [MonthYear],
      [IsWeekend]
      )
   SELECT DateKey = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate),
      DATE = @CurrentDate,
      Day = DAY(@CurrentDate),
      [DaySuffix] = CASE 
         WHEN DAY(@CurrentDate) = 1
            OR DAY(@CurrentDate) = 21
            OR DAY(@CurrentDate) = 31
            THEN 'st'
         WHEN DAY(@CurrentDate) = 2
            OR DAY(@CurrentDate) = 22
            THEN 'nd'
         WHEN DAY(@CurrentDate) = 3
            OR DAY(@CurrentDate) = 23
            THEN 'rd'
         ELSE 'th'
         END,
      WEEKDAY = DATEPART(dw, @CurrentDate),
      WeekDayName = DATENAME(dw, @CurrentDate),
      WeekDayName_Short = UPPER(LEFT(DATENAME(dw, @CurrentDate), 3)),
      WeekDayName_FirstLetter = LEFT(DATENAME(dw, @CurrentDate), 1),
      [DOWInMonth] = DAY(@CurrentDate),
      [DayOfYear] = DATENAME(dy, @CurrentDate),
      [WeekOfMonth] = DATEPART(WEEK, @CurrentDate) - DATEPART(WEEK, DATEADD(MM, DATEDIFF(MM, 0, @CurrentDate), 0)) + 1,
      [WeekOfYear] = DATEPART(wk, @CurrentDate),
      [Month] = MONTH(@CurrentDate),
      [MonthName] = DATENAME(mm, @CurrentDate),
      [MonthName_Short] = UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)),
      [MonthName_FirstLetter] = LEFT(DATENAME(mm, @CurrentDate), 1),
      [Quarter] = DATEPART(q, @CurrentDate),
      [QuarterName] = CASE 
         WHEN DATENAME(qq, @CurrentDate) = 1
            THEN 'First'
         WHEN DATENAME(qq, @CurrentDate) = 2
            THEN 'second'
         WHEN DATENAME(qq, @CurrentDate) = 3
            THEN 'third'
         WHEN DATENAME(qq, @CurrentDate) = 4
            THEN 'fourth'
         END,
      [Year] = YEAR(@CurrentDate),
      [MMYYYY] = RIGHT('0' + CAST(MONTH(@CurrentDate) AS VARCHAR(2)), 2) + CAST(YEAR(@CurrentDate) AS VARCHAR(4)),
      [MonthYear] = CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)),
      [IsWeekend] = CASE 
         WHEN DATENAME(dw, @CurrentDate) = 'Sunday'
            OR DATENAME(dw, @CurrentDate) = 'Saturday'
            THEN 1
         ELSE 0
         END

   SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END
