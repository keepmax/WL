USE [master]
GO
/****** Object:  Database [StudentDB]    Script Date: 2023/9/7 14:07:37 ******/
CREATE DATABASE [StudentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentDB', FILENAME = N'D:\createdata_test\StudentDBNew.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentDB_log', FILENAME = N'D:\createdata_test\StudentDBNew_log.ldf' , SIZE = 10176KB , MAXSIZE = 399360KB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StudentDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentDB', N'ON'
GO
ALTER DATABASE [StudentDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudentDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudentDB]
GO
/****** Object:  Table [dbo].[ClassInfos]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassInfos](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[GradeId] [int] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_ClassInfos] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradeInfos]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeInfos](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [varchar](50) NOT NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK_GradeInfos] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewClassInfos]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewClassInfos]
AS
SELECT  dbo.ClassInfos.ClassId, dbo.ClassInfos.ClassName, dbo.ClassInfos.GradeId, dbo.GradeInfos.GradeName, 
                   dbo.ClassInfos.Remark, dbo.ClassInfos.IsDeleted
FROM      dbo.GradeInfos INNER JOIN
                   dbo.ClassInfos ON dbo.GradeInfos.GradeId = dbo.ClassInfos.GradeId

GO
/****** Object:  Table [dbo].[StudentInfos]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentInfos](
	[StuId] [int] IDENTITY(1001,1) NOT NULL,
	[StuName] [varchar](50) NOT NULL,
	[ClassId] [int] NOT NULL,
	[Sex] [varchar](2) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_stu_class_grade]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_stu_class_grade] 
as
select StuId '学生编号',StuName '学生姓名',Sex '性别',班级名称,年级名称 from StudentInfos
left join 
(
	select ClassName '班级名称',GradeName '年级名称',ClassId
	from ClassInfos
	left join GradeInfos
	on ClassInfos.GradeId = GradeInfos.GradeId
) tmp
on StudentInfos.ClassId = tmp.ClassId
GO
/****** Object:  Table [dbo].[student]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[sno] [int] NULL,
	[sname] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[score]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[score](
	[courseNo] [int] NULL,
	[score] [int] NULL,
	[sno] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_stuInfo_stuscores]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_stuInfo_stuscores] 
as
select stu.sno,stu.sname,sco.courseNo,sco.score from student stu
inner join score sco
on stu.sno = sco.sno;
GO
/****** Object:  Table [dbo].[backupbookinfo]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[backupbookinfo](
	[bookid] [varchar](50) NULL,
	[bookname] [varchar](50) NULL,
	[booktype] [int] NULL,
	[unit_price] [decimal](18, 2) NULL,
	[amount] [int] NULL,
	[indate] [datetime] NULL,
	[img] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookinfo]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookinfo](
	[bookid] [varchar](50) NULL,
	[bookname] [varchar](50) NULL,
	[booktype] [int] NULL,
	[unit_price] [decimal](18, 2) NULL,
	[amount] [int] NULL,
	[indate] [datetime] NULL,
	[img] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booktype]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booktype](
	[bookType] [varchar](50) NULL,
	[Typeid] [int] NOT NULL,
 CONSTRAINT [PK_booktype] PRIMARY KEY CLUSTERED 
(
	[Typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuInfos]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuInfos](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](20) NOT NULL,
	[ParentId] [int] NOT NULL,
	[FrmName] [varchar](200) NULL,
	[IsMorePage] [int] NOT NULL,
	[MOrder] [int] NOT NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK_MenuInfos] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_test]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_test](
	[userid] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[sex] [int] NULL,
	[status] [int] NULL,
	[role] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfos]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfos](
	[UserId] [int] IDENTITY(1000,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPwd] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserInfos_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[backupbookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'test', N'历史监视', 3, CAST(35.20 AS Decimal(18, 2)), 4, CAST(N'2023-02-24T13:53:50.000' AS DateTime), N'D:\学习资料\c#进阶\assets\1681282220357.png')
INSERT [dbo].[backupbookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'CC03', N'童年', 3, CAST(37.90 AS Decimal(18, 2)), 30, CAST(N'2023-04-25T09:15:39.000' AS DateTime), N'D:\学习资料\c#进阶\assets\1682059575825.png')
INSERT [dbo].[backupbookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'SDFIOU009', N'SpringBoot企业级实战', 5, CAST(66.66 AS Decimal(18, 2)), 30, CAST(N'2023-09-04T15:58:25.000' AS DateTime), N'D:\学习资料\c#进阶\assets\1681440299767.png')
GO
INSERT [dbo].[bookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'YUGIAS389', N'Vue项目分离企业管理', 1, CAST(99.99 AS Decimal(18, 2)), 100, CAST(N'2023-05-30T16:00:37.000' AS DateTime), N'D:\学习资料\c#进阶\assets\1681279814103.png')
INSERT [dbo].[bookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'XRT007', N'java精通', 1, CAST(60.50 AS Decimal(18, 2)), 30, CAST(N'2023-09-06T09:42:59.723' AS DateTime), N'D:\学习资料\c#进阶\assets\1681282220357.png')
INSERT [dbo].[bookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'DFUI97', N'魔鬼的步伐', 4, CAST(77.77 AS Decimal(18, 2)), 30, CAST(N'2023-05-30T15:55:26.000' AS DateTime), N'D:\学习资料\c#进阶\assets\1681287224174.png')
INSERT [dbo].[bookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'FIOSH33', N'快速上手', 2, CAST(78.40 AS Decimal(18, 2)), 33, CAST(N'2023-09-07T09:11:14.420' AS DateTime), N'D:\学习资料\c#进阶\assets\1681633100309.png')
INSERT [dbo].[bookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'XB3303', N'打鬼子', 3, CAST(33.70 AS Decimal(18, 2)), 20, CAST(N'2023-06-22T13:44:19.000' AS DateTime), N'D:\学习资料\c#进阶\assets\1680849382680.png')
INSERT [dbo].[bookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'CC99', N'asdfasdf', 4, CAST(39.00 AS Decimal(18, 2)), 17, CAST(N'2023-09-06T15:54:54.057' AS DateTime), N'D:\学习资料\c#进阶\assets\1681282220357.png')
INSERT [dbo].[bookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'FID846', N'智慧树', 5, CAST(95.80 AS Decimal(18, 2)), 44, CAST(N'2023-09-06T15:56:59.383' AS DateTime), N'D:\学习资料\c#进阶\assets\logo-极客营.png')
INSERT [dbo].[bookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'AX33', N'我的大学', 3, CAST(100.00 AS Decimal(18, 2)), 30, CAST(N'2022-11-08T18:41:24.000' AS DateTime), N'D:\学习资料\c#进阶\assets\logo-极客营.png')
INSERT [dbo].[bookinfo] ([bookid], [bookname], [booktype], [unit_price], [amount], [indate], [img]) VALUES (N'SDFS08', N'学习面向对象', 5, CAST(80.50 AS Decimal(18, 2)), 20, CAST(N'2023-03-22T15:51:06.000' AS DateTime), N'D:\学习资料\c#进阶\assets\1681289520370.png')
GO
INSERT [dbo].[booktype] ([bookType], [Typeid]) VALUES (N'程序书籍', 1)
INSERT [dbo].[booktype] ([bookType], [Typeid]) VALUES (N'哲学书籍', 2)
INSERT [dbo].[booktype] ([bookType], [Typeid]) VALUES (N'文学书籍', 3)
INSERT [dbo].[booktype] ([bookType], [Typeid]) VALUES (N'C++书籍', 4)
INSERT [dbo].[booktype] ([bookType], [Typeid]) VALUES (N'Java书籍', 5)
GO
SET IDENTITY_INSERT [dbo].[ClassInfos] ON 

INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (3, N'Java班', 4, N'Java班主要学习Java语言。', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (8, N'微信小程序班', 5, N'微信小程序班主要学习微信小程序开发技术。', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (9, N'计算机基础班', 4, N'计算机基础班主要学习计算机基础知识。qqqq', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (10, N'Dephi班', 3, N'Dephi班主要学习Dephi', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (11, N'前端班', 4, N'', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (12, N'英语班', 2, N'主要学习英语。', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (13, N'数学班', 7, N'学习数学', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (16, N'Java班（一）', 4, N'学习Java语言', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (18, N'Ps班', 2, N'学习Ps图像处理', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (20, N'Java班New', 4, N'Java班描述。。。。', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (21, N'Java（一）班', 8, N'Java Java', 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (23, N'C++班', 4, NULL, 0)
INSERT [dbo].[ClassInfos] ([ClassId], [ClassName], [GradeId], [Remark], [IsDeleted]) VALUES (25, N'特种兵', 14, N'主打一手铁血奥尔加', 0)
SET IDENTITY_INSERT [dbo].[ClassInfos] OFF
GO
SET IDENTITY_INSERT [dbo].[GradeInfos] ON 

INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (2, N'2018级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (3, N'2019级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (4, N'2020级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (5, N'2021级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (6, N'2022级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (7, N'2023级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (8, N'2024级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (9, N'2025级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (13, N'2026级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (14, N'2027级1', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (15, N'2030级', 0)
INSERT [dbo].[GradeInfos] ([GradeId], [GradeName], [IsDeleted]) VALUES (16, N'2040级', 0)
SET IDENTITY_INSERT [dbo].[GradeInfos] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuInfos] ON 

INSERT [dbo].[MenuInfos] ([MenuId], [MenuName], [ParentId], [FrmName], [IsMorePage], [MOrder], [IsDeleted]) VALUES (1, N'年级管理', 0, NULL, 0, 1, 0)
INSERT [dbo].[MenuInfos] ([MenuId], [MenuName], [ParentId], [FrmName], [IsMorePage], [MOrder], [IsDeleted]) VALUES (2, N'班级管理', 0, NULL, 0, 2, 0)
INSERT [dbo].[MenuInfos] ([MenuId], [MenuName], [ParentId], [FrmName], [IsMorePage], [MOrder], [IsDeleted]) VALUES (3, N'学生管理', 0, NULL, 0, 3, 0)
INSERT [dbo].[MenuInfos] ([MenuId], [MenuName], [ParentId], [FrmName], [IsMorePage], [MOrder], [IsDeleted]) VALUES (4, N'退出系统', 0, NULL, 2, 4, 0)
INSERT [dbo].[MenuInfos] ([MenuId], [MenuName], [ParentId], [FrmName], [IsMorePage], [MOrder], [IsDeleted]) VALUES (5, N'年级列表', 1, N'FrmGradeList', 0, 1, 0)
INSERT [dbo].[MenuInfos] ([MenuId], [MenuName], [ParentId], [FrmName], [IsMorePage], [MOrder], [IsDeleted]) VALUES (6, N'新增班级', 2, N'FrmClassInfo', 1, 1, 0)
INSERT [dbo].[MenuInfos] ([MenuId], [MenuName], [ParentId], [FrmName], [IsMorePage], [MOrder], [IsDeleted]) VALUES (7, N'班级列表', 2, N'FrmClassList', 0, 2, 0)
INSERT [dbo].[MenuInfos] ([MenuId], [MenuName], [ParentId], [FrmName], [IsMorePage], [MOrder], [IsDeleted]) VALUES (8, N'新增学生', 3, N'FrmStudentInfo', 1, 1, 0)
INSERT [dbo].[MenuInfos] ([MenuId], [MenuName], [ParentId], [FrmName], [IsMorePage], [MOrder], [IsDeleted]) VALUES (9, N'学生列表', 3, N'FrmStudentList', 0, 2, 0)
SET IDENTITY_INSERT [dbo].[MenuInfos] OFF
GO
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (1, 55, 1)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (2, 77, 1)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (3, 69, 1)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (4, 99, 1)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (1, 55, 2)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (2, 41, 2)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (3, 78, 2)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (4, 76, 2)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (1, 55, 3)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (2, 70, 3)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (3, 80, 3)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (4, 60, 3)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (1, 55, 4)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (2, 88, 4)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (3, 77, 4)
INSERT [dbo].[score] ([courseNo], [score], [sno]) VALUES (4, 97, 4)
GO
INSERT [dbo].[student] ([sno], [sname]) VALUES (1, N'华强')
INSERT [dbo].[student] ([sno], [sname]) VALUES (2, N'晓东')
INSERT [dbo].[student] ([sno], [sname]) VALUES (3, N'xiaosan')
INSERT [dbo].[student] ([sno], [sname]) VALUES (4, N'大兵')
GO
SET IDENTITY_INSERT [dbo].[StudentInfos] ON 

INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1012, N'李梦丽', 3, N'女', N'13245567777', CAST(N'2021-07-12T15:56:41.550' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1015, N'李锐红', 10, N'女', N'14387909876', CAST(N'2021-07-27T11:00:12.400' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1016, N'随别杨柳', 11, N'男', N'176585950', CAST(N'2021-07-27T21:24:33.723' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1017, N'逗号', 23, N'男', N'1435566777788', CAST(N'2021-07-27T21:27:20.970' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1018, N'李梦丽', 3, N'女', N'132455677555', CAST(N'2021-07-27T21:28:57.357' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1020, N'王力', 11, N'男', N'15689079876', CAST(N'2021-10-15T10:35:23.120' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1021, N'刘丽红', 23, N'女', N'17798765498', CAST(N'2021-10-15T10:35:53.310' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1023, N'罗康', 10, N'男', N'19875633883', CAST(N'2021-10-15T10:38:21.023' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1025, N'代红明', 12, N'男', N'18877847748', CAST(N'2021-10-15T10:38:52.327' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1026, N'蒋玉', 16, N'女', N'18474844848', CAST(N'2021-10-15T10:39:31.343' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1029, N'奥尔加团长', 25, N'男', N'11451419198', CAST(N'2023-08-29T16:24:10.993' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[StudentInfos] OFF
GO
INSERT [dbo].[User_test] ([userid], [password], [username], [sex], [status], [role]) VALUES (N'wl', N'wl', N'wuliang', 0, 0, 0)
INSERT [dbo].[User_test] ([userid], [password], [username], [sex], [status], [role]) VALUES (N'lucy', N'2233', N'吴量', 1, 0, 0)
INSERT [dbo].[User_test] ([userid], [password], [username], [sex], [status], [role]) VALUES (N'cu', N'333', N'wl', 0, 0, 1)
INSERT [dbo].[User_test] ([userid], [password], [username], [sex], [status], [role]) VALUES (N'ffff', N'asddfasdf', N'fffff', 1, 0, 1)
INSERT [dbo].[User_test] ([userid], [password], [username], [sex], [status], [role]) VALUES (N'778', N'445', N'华强', 0, 0, 3)
INSERT [dbo].[User_test] ([userid], [password], [username], [sex], [status], [role]) VALUES (N'135', N'111', N'wl', 1, 0, 3)
INSERT [dbo].[User_test] ([userid], [password], [username], [sex], [status], [role]) VALUES (N'138', N'222', N'wl', 1, 1, 2)
INSERT [dbo].[User_test] ([userid], [password], [username], [sex], [status], [role]) VALUES (N'wuliang', N'6666', N'我是傻逼', 1, 0, 3)
GO
SET IDENTITY_INSERT [dbo].[UserInfos] ON 

INSERT [dbo].[UserInfos] ([UserId], [UserName], [UserPwd]) VALUES (1000, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[UserInfos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserInfos]    Script Date: 2023/9/7 14:07:37 ******/
ALTER TABLE [dbo].[UserInfos] ADD  CONSTRAINT [IX_UserInfos] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassInfos] ADD  CONSTRAINT [DF_ClassInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GradeInfos] ADD  CONSTRAINT [DF_GradeInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MenuInfos] ADD  CONSTRAINT [DF_MenuInfos_IsMorePage]  DEFAULT ((0)) FOR [IsMorePage]
GO
ALTER TABLE [dbo].[MenuInfos] ADD  CONSTRAINT [DF_MenuInfos_MOrder]  DEFAULT ((1)) FOR [MOrder]
GO
ALTER TABLE [dbo].[MenuInfos] ADD  CONSTRAINT [DF_MenuInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StudentInfos] ADD  CONSTRAINT [DF_Students_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[StudentInfos] ADD  CONSTRAINT [DF_StudentInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ClassInfos]  WITH CHECK ADD  CONSTRAINT [FK_ClassInfos_GradeInfos] FOREIGN KEY([GradeId])
REFERENCES [dbo].[GradeInfos] ([GradeId])
GO
ALTER TABLE [dbo].[ClassInfos] CHECK CONSTRAINT [FK_ClassInfos_GradeInfos]
GO
ALTER TABLE [dbo].[StudentInfos]  WITH CHECK ADD  CONSTRAINT [FK_Students_ClassInfos] FOREIGN KEY([ClassId])
REFERENCES [dbo].[ClassInfos] ([ClassId])
GO
ALTER TABLE [dbo].[StudentInfos] CHECK CONSTRAINT [FK_Students_ClassInfos]
GO
/****** Object:  StoredProcedure [dbo].[backdata_bookinfo_proc]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[backdata_bookinfo_proc]
@bookid varchar(50)
as
	set nocount on
	declare @count int,

	@bookname varchar(50),
	@booktype int,
	@unit_price decimal(18,2),
	@amount int,
	@indate datetime,
	@img varchar(500)
	if exists(select bookid from backupbookinfo where bookid = @bookid)
	begin
		select @bookname = bookname,@booktype = booktype,@unit_price = unit_price,@amount = amount,@indate = indate,@img = img
		from backupbookinfo
		where bookid = @bookid
		
		insert into bookinfo(bookid,bookname,booktype,unit_price,amount,indate,img)
				values(@bookid,@bookname,@booktype,@unit_price,@amount,@indate,@img)
				set @count = @@ROWCOUNT
		delete from backupbookinfo where bookid = @bookid
	end
GO
/****** Object:  StoredProcedure [dbo].[bkInfo_Insert]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[bkInfo_Insert]
@msg varchar(20) output,
@bookid varchar(50),
@bookname varchar(50),
@booktype int,
@unit_price decimal(18,2),
@amount int,
@indate datetime,
@img varchar(500)
as
	set nocount on
	declare @count int
	if exists(select bookid from bookinfo where bookid = @bookid)
		begin
			set @msg = 'update'
			update bookinfo
			set bookname = @bookname,
			booktype = @booktype,
			unit_price = @unit_price,
			amount = @amount,
			indate = @indate,
			img = @img 
			where bookid = @bookid
		end
	else 
		begin
			insert into bookinfo(bookid,bookname,booktype,unit_price,amount,indate,img)
				values(@bookid,@bookname,@booktype,@unit_price,@amount,@indate,@img)
				set @count = @@ROWCOUNT
				if @count > 0
					set @msg =  '新增书籍成功！'
				else
					set @msg = '新增书籍失败！'
		end
GO
/****** Object:  StoredProcedure [dbo].[Proc_Login]    Script Date: 2023/9/7 14:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Proc_Login]
@UserName varchar(50),
@UserPwd varchar(50)
as
begin
  select count(1) from UserInfos where UserName=@UserName and UserPwd=@UserPwd
end


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GradeInfos"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ClassInfos"
            Begin Extent = 
               Top = 7
               Left = 278
               Bottom = 170
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewClassInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewClassInfos'
GO
USE [master]
GO
ALTER DATABASE [StudentDB] SET  READ_WRITE 
GO
