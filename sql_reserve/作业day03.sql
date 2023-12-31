CREATE TABLE [CallRecords]
(
	[Id] [int] NOT NULL identity(1,1),
	[CallerNumber] [nvarchar](50), --三位数字，呼叫中心员工编号（工号）
	[TelNum] [varchar](50),
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL  --结束时间要大于开始时间,默认当前时间
)

--主键约束
alter table [CallRecords]
add constraint PK_CallRecords primary key(id)

--检查约束
alter table [CallRecords]
add constraint CK_CallRecords check(CallerNumber like '[0-9][0-9][0-9]')   

alter table [CallRecords]
add constraint CK_CallRecords_EndDateTime check(EndDateTime > StartDateTime)

--默认约束
alter table [CallRecords]
add constraint DF_CallRecords default(getdate()) for EndDateTime



INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('001', '0208888888', CAST(0x00009DAF00A4CB80 AS DateTime), CAST(0x00009DAF00A62E94 AS DateTime));
INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('001', '0208888888', CAST(0x00009DB000D63BC0 AS DateTime), CAST(0x00009DB000D68DC8 AS DateTime));
INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('001', '89898989', CAST(0x00009DB000E85C60 AS DateTime), CAST(0x00009DB000E92F50 AS DateTime));
INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('002', '98987676', CAST(0x00009DB2015BB7A0 AS DateTime), CAST(0x00009DB2015C4DA0 AS DateTime));
INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('002', '02188839389', CAST(0x00009DA4014C9C70 AS DateTime), CAST(0x00009DA4014E0308 AS DateTime));
INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('001', '767676766', CAST(0x00009DB400DAA0C0 AS DateTime), CAST(0x00009DB400DD5FE0 AS DateTime));
INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('003', '0227864656', CAST(0x00009DB200B9AB40 AS DateTime), CAST(0x00009DB200B9FC1C AS DateTime));
INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('003', '676765777', CAST(0x00009DB8014042B8 AS DateTime), CAST(0x00009DB80141804C AS DateTime));
INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('001', '89977653', CAST(0x00009D9A00FB9898 AS DateTime), CAST(0x00009D9A00FE6118 AS DateTime));
INSERT [dbo].[CallRecords] ([CallerNumber], [TelNum], [StartDateTime], [EndDateTime]) VALUES ('004', '400400400', CAST(0x00009D9A00FB9898 AS DateTime), CAST(0x00009D9A00FE6118 AS DateTime));

----查询通话时间最长的5条记录
select top 5 DATEDIFF(ss,StartDateTime,EndDateTime) '通话时间',* from CallRecords
order by (EndDateTime - StartDateTime) desc
----查询以0开头的通话总时,以秒为计算单位
select DATEDIFF(ss,StartDateTime,EndDateTime) '通话时间' from CallRecords
where TelNum like '0%'
----查询2010年7月通话总时长最多的前两个呼叫员的编号
select top 2 DATEDIFF(ss,StartDateTime,EndDateTime) '通话时间',Id from CallRecords
order by (EndDateTime - StartDateTime) desc
----查询2010年7月拨打电话次数最多的前两个呼叫员的编号
select top 2 COUNT(CallerNumber)'次数',CallerNumber '编号' from CallRecords
where DATEPART(MM,StartDateTime) = 7 and DATEPART(MM,EndDateTime) = 7
group by CallerNumber
order by COUNT(CallerNumber)desc ;




