--1.	将StudentDB的脚本文件执行，生成数据库：StudentDB。完成下列要求：(写T-SQL脚本)
CREATE DATABASE [StudentDB] ON  PRIMARY 
( NAME = N'StudentDB', FILENAME = N'D:\createdata_test\StudentDBNew.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentDB_log', FILENAME = N'D:\createdata_test\StudentDBNew_log.ldf' , SIZE = 10176KB , MAXSIZE = 390mb , FILEGROWTH = 10%)
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
ALTER DATABASE [StudentDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentDB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentDB', N'ON'

USE [StudentDB];
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClassInfos](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[GradeId] [int] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[IsDeleted] [int] NOT NULL CONSTRAINT [DF_ClassInfos_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_ClassInfos] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GradeInfos]    Script Date: 2021-10-15 11:26:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeInfos](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [varchar](50) NOT NULL,
	[IsDeleted] [int] NULL CONSTRAINT [DF_GradeInfos_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_GradeInfos] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuInfos]    Script Date: 2021-10-15 11:26:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuInfos](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](20) NOT NULL,
	[ParentId] [int] NOT NULL,
	[FrmName] [varchar](200) NULL,
	[IsMorePage] [int] NOT NULL CONSTRAINT [DF_MenuInfos_IsMorePage]  DEFAULT ((0)),
	[MOrder] [int] NOT NULL CONSTRAINT [DF_MenuInfos_MOrder]  DEFAULT ((1)),
	[IsDeleted] [int] NULL CONSTRAINT [DF_MenuInfos_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_MenuInfos] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentInfos]    Script Date: 2021-10-15 11:26:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentInfos](
	[StuId] [int] IDENTITY(1001,1) NOT NULL,
	[StuName] [varchar](50) NOT NULL,
	[ClassId] [int] NOT NULL,
	[Sex] [varchar](2) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_Students_CreateTime]  DEFAULT (getdate()),
	[IsDeleted] [int] NULL CONSTRAINT [DF_StudentInfos_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfos]    Script Date: 2021-10-15 11:26:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfos](
	[UserId] [int] IDENTITY(1000,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserPwd] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserInfos_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ViewClassInfos]    Script Date: 2021-10-15 11:26:35 ******/
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
SET IDENTITY_INSERT [dbo].[ClassInfos] OFF
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
SET IDENTITY_INSERT [dbo].[GradeInfos] OFF
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
SET IDENTITY_INSERT [dbo].[StudentInfos] ON 

INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1010, N'李丽', 8, N'女', N'1435566778888', CAST(N'2019-09-26 10:10:35.403' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1012, N'李梦丽', 3, N'女', N'13245567777', CAST(N'2021-07-12 15:56:41.550' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1015, N'李锐红', 10, N'女', N'14387909876', CAST(N'2021-07-27 11:00:12.400' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1016, N'随别杨柳', 11, N'男', N'176585950', CAST(N'2021-07-27 21:24:33.723' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1017, N'逗号', 3, N'男', N'1435566777788', CAST(N'2021-07-27 21:27:20.970' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1018, N'李梦丽', 3, N'女', N'132455677555', CAST(N'2021-07-27 21:28:57.357' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1020, N'王力', 11, N'男', N'15689079876', CAST(N'2021-10-15 10:35:23.120' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1021, N'刘丽红', 12, N'女', N'17798765498', CAST(N'2021-10-15 10:35:53.310' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1022, N'柳玉莹', 8, N'女', N'13685748990', CAST(N'2021-10-15 10:36:41.183' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1023, N'罗康', 10, N'男', N'19875633883', CAST(N'2021-10-15 10:38:21.023' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1025, N'代红明', 12, N'男', N'18877847748', CAST(N'2021-10-15 10:38:52.327' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1026, N'蒋玉', 16, N'女', N'18474844848', CAST(N'2021-10-15 10:39:31.343' AS DateTime), 0)
INSERT [dbo].[StudentInfos] ([StuId], [StuName], [ClassId], [Sex], [Phone], [CreateTime], [IsDeleted]) VALUES (1027, N'殷小红', 8, N'女', N'17984847474', CAST(N'2021-10-15 10:40:07.970' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[StudentInfos] OFF
SET IDENTITY_INSERT [dbo].[UserInfos] ON 

INSERT [dbo].[UserInfos] ([UserId], [UserName], [UserPwd]) VALUES (1000, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[UserInfos] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserInfos]    Script Date: 2021-10-15 11:26:35 ******/
ALTER TABLE [dbo].[UserInfos] ADD  CONSTRAINT [IX_UserInfos] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[Proc_Login]    Script Date: 2021-10-15 11:26:35 ******/
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
GO;
use StudentDB;
--(1) 用T-SQL脚本方式分别为年级表、班级表、学生表 三张表再插入一些数据（原来已有一些数据），每个表新插入数据不少于5条（可用单条或批量的方式）
insert GradeInfos
select '2030级',0 union
select '2040级',0 ;

insert ClassInfos
select '特种兵',14,'主打一手铁血奥尔加',0;

insert StudentInfos (StuName,ClassId,Sex,Phone) 
values('奥尔加团长',25,'男',11451419198);

--(2) 修改学生“逗号”、“刘丽红”的所属班级为“C++班”。
update StudentInfos
set ClassId = (
	select ClassId from ClassInfos
	where ClassName = 'C++班'
	)
where StuName = '逗号' or StuName = '刘丽红';

--(3) 删除班级“微信小程序班”的所有学生。
delete from StudentInfos
where ClassId = 
(
	select ClassId from ClassInfos
	where ClassName = '微信小程序班'
);
select ClassId from ClassInfos
where ClassName = '微信小程序班';

--(4) 查询年级“2019级”、“2021级”、”2024级”的所有学生
select * from StudentInfos
where ClassId in (
	select ClassId from ClassInfos
	where GradeId in(
		select GradeId from GradeInfos
		where GradeName = '2019级' or GradeName = '2021级' or GradeName = '2024级'
	)
);

select ClassId from ClassInfos
where GradeId in(
	select GradeId from GradeInfos
	where GradeName = '2019级' or GradeName = '2021级' or GradeName = '2024级'
);
select GradeId from GradeInfos
where GradeName = '2019级' or GradeName = '2021级' or GradeName = '2024级';

--(5) 统计出各个年级的班级数.查询出来的信息包含：年级编号、年级名称、班级数
select GradeInfos.GradeId '年级编号',GradeName '年级名称',
	count(ClassId)'班级数量' 
from GradeInfos
left join ClassInfos
on GradeInfos.GradeId = ClassInfos.GradeId
group by GradeInfos.GradeId,GradeInfos.GradeName;

--(6) 统计出各个班级的学生数.查询出来的信息包含：班级编号、班级名称、学生人数
select ClassInfos.ClassId '班级编号',ClassInfos.ClassName '班级名称',
	count(StudentInfos.StuId) '学生数量'
from ClassInfos
left join StudentInfos
on ClassInfos.ClassId = StudentInfos.ClassId
group by ClassInfos.ClassId,ClassInfos.ClassName;
--(7) 给StudentInfos表的StuName添加一个唯一索引。  
create unique index IX_stuName on StudentInfos(StuName);
--(8) 创建一个视图，查询学生信息，包含：学生编号、学生名称、性别、班级名称、年级名称（用连接查询）
create view view_stu_class_grade 
as
select StuId '学生编号',StuName '学生姓名',Sex '性别',班级名称,年级名称 from StudentInfos
left join 
(
	select ClassName '班级名称',GradeName '年级名称',ClassId
	from ClassInfos
	left join GradeInfos
	on ClassInfos.GradeId = GradeInfos.GradeId
) tmp
on StudentInfos.ClassId = tmp.ClassId;

select ClassName '班级名称',GradeName '年级名称' from ClassInfos
left join GradeInfos
on ClassInfos.GradeId = GradeInfos.GradeId;

select * from view_stu_class_grade;
