USE [master]
GO
/****** Object:  Database [BudgetDBContext]    Script Date: 30.8.2016 г. 13:16:39 ******/
CREATE DATABASE [BudgetDBContext]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BudgetDBContext.mdf', FILENAME = N'C:\Users\boris.ruskov\Desktop\BudgetProfilerr-master\BudgetProfilerr\App_Data\BudgetDBContext.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BudgetDBContext_log.ldf', FILENAME = N'C:\Users\boris.ruskov\Desktop\BudgetProfilerr-master\BudgetProfilerr\App_Data\BudgetDBContext_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BudgetDBContext] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BudgetDBContext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BudgetDBContext] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BudgetDBContext] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BudgetDBContext] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BudgetDBContext] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BudgetDBContext] SET ARITHABORT OFF 
GO
ALTER DATABASE [BudgetDBContext] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BudgetDBContext] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BudgetDBContext] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BudgetDBContext] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BudgetDBContext] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BudgetDBContext] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BudgetDBContext] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BudgetDBContext] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BudgetDBContext] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BudgetDBContext] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BudgetDBContext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BudgetDBContext] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BudgetDBContext] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BudgetDBContext] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BudgetDBContext] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BudgetDBContext] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BudgetDBContext] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BudgetDBContext] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BudgetDBContext] SET  MULTI_USER 
GO
ALTER DATABASE [BudgetDBContext] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BudgetDBContext] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BudgetDBContext] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BudgetDBContext] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BudgetDBContext] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BudgetDBContext]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 30.8.2016 г. 13:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30.8.2016 г. 13:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](35) NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 30.8.2016 г. 13:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Amount] [float] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[isExpense] [bit] NOT NULL,
	[CategoryID_ID] [int] NULL,
	[User_ID] [int] NULL,
 CONSTRAINT [PK_dbo.Transactions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserCategories]    Script Date: 30.8.2016 г. 13:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_ID] [int] NULL,
	[User_ID] [int] NULL,
 CONSTRAINT [PK_dbo.UserCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 30.8.2016 г. 13:16:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201608300844051_InitialCreate', N'BudgetProfilerr.Models.BudgetDBContext', 0x1F8B0800000000000400ED5C5B6FDB36147E1FB0FF20E871482D2745812DB05B244E32186B2E88D3626F0123D18E3089D2442AB031EC97ED613F697F6187BA522475B59DBA4551206824F25CBF730E7974DAFFFEF977F261ED7BC60B8EA81B90A9793C1A9B062676E0B864353563B67CF3B3F9E1FD8F3F4C2E1D7F6D7CCED7BDE5EB6027A153F399B1F0D4B2A8FD8C7D4447BE6B47010D966C6407BE859CC03A198F7FB18E8F2D0C244CA0651893FB9830D7C7C92FF0EB2C20360E598CBCEBC0C11ECD9EC39B4542D5B8413EA621B2F1D43C8F9D15667751B0743D1C45A37487699C792E026916D85B9A062224608881ACA79F285EB02820AB45080F90F7B00931AC5B228FE24C87D372795775C6275C1DABDC9893B263CA02BF27C1E3B7997D2C79FB202B9B85FDC082976069B6E15A27569C9A33C4F02A883689E14C43E6783AF322BEBACED2A384A08BE9A842E8C890961F15680150F13F47C62CF6581CE129C1318B106CB98B9F3CD7FE0D6F1E823F309992D8F344D9417A785779008F80438823B6B9C7CB4CA3F9856958D57D96BCB1D826EC49D59C13F6F6C4346E80397AF270010DC1240B1644F8574C70042A3B7788311C8167E70E4E8CAB709778F19F3937C0228496695CA3F5474C56EC1982E99D695CB96BECE40F32013E11170211F6B028C61A0145A613ABF473A3F71F224428B2B95A5B0340A6F51D03F5BC2E30B523374C63BA160AEFC69DA0D0CCEACC0F20BDE65C2E0230701B7C54220F909E170CF9614107D4E60F7B5372E9E53AC4841621701E041E46A49DD00D7A715789F5259279E6E10EBCC75EB2843EBB619AFE155C3E8AEBAFA2C0BF0F3C4D2808CB1E17411CD95CE2A07DED038A00F4DDA5878A1475933B5DD920315FD02E6BB24A2765E7ACC1296C9D2E0A22DFF3443DAF2B37A2ACA5609C74CB123DE3F4237A15C6BD309747D9B6B0CBE97C475E9FF4AA4D52A2391FCB956592D22E5092947ED5CE526985BC9C469597CDD2F54E9F679406B69B885473EA122B5255D54BE2183DCA531AA9BAE201810B407643802E8838357F52ACDA8D55AEB8C04ABA4154F98C47A363D94C82417ADA29715D67B1ABBEDC936D2A7010980835728716D1875B9DB02DB15715B60CDEEED6680EDB57C1881ADA9D84ADC3C64E2CB14F4CA439661610865CC8ED9915D23A7671CE9FE335D31448E09DD5489A156659154E77815935EB43C9348D32AFE9DDA958A54A4A88191D31351C5BE87133EA0809E6ED40A1F4B29650F95AA225F845ABA27AC7107674B892C847877E25A0D05436BB358C6E8E6281AE880CF9045335CE10C3A5D5B983C9D458EF510D7662A64A980B14337C6E6D9B9AB3956A9B0E55A1475D9034A90B841E85605FE0D11CEB5A8CD3029AFA12B1B551760596FC94595480B23B6EA5EDF1BC8D6ED5F4D127D7280CE12E27F4D5B327C6226DAACFDE2CFA779AFD948665534DC3B990B6E004B713B4C2D25B600D922697DE0BC4D013E2779A99E32BCBE47A5793EE736E4A49539D9697807C0BFFBB585B951B65B5064A044B9B5E819A3E5CB9128DB11A0975FB93AF1DC84391E60E380BBCD82775F7C8A6DDE98D5EDC9F3E51294C2C4901D96496623309C2B2173AF9A8928D77E025E570D1DF51ED24F6E3AB4A8F58245379D19D5EDE081649E5CFBA53113AC12221E171775A422F58A4253C3E185CA6697A07802C0FA9FD91D8B0773F1014DA8F2211E171775A65435124553E3D2857371CA20679BC8E5E47A7D76FDFCEEFFBB670F514539BE9D52B53EFBC5ED9DD3783F3339B9CE6DAEF44AA353B794220A4730A376921CC76726667D78172F6160ECE628E9B7466E69437A68BA67467EDE563EFF6984A2F05FDD194EEDB078EC47BC040CF2424F6811DF1C67350A8A9D1786BBCD4DCB07BA574615F9FD4ADF147E3257ACB6CB30BBC34B60D0E0A2F0D5AEF16331DF38B66CF2EB1724039A5B6837250F8189C4F94EE8BBCA43851155D18A9DB32C93A1FEDA38D4A2B245D621AA0FA8BEBF036C8624319F6477CC168F1A737F35CCC6F73F9826B44DC25A62CFD526D9E8C8F4FA4C9C8C39952B428753C4DE7A87654F1D5BFB9BBDCB4AD5FD57B8E59882316E40545F6338A9471C03DCDFA7D1B16D48CD2690DC987E94AD2FD27E7965E80D8F683730E68CD763238F7E4F617473A7E0B6E513E18CE8983D753F3AF64E7A931FFFDB1B2F9C8B88D20C59C1A63E3EFBE862DD26F3FFED9B6EE9C070CB47D1B31A18C8D6923E264BCF554D830BAC386BEBE0DD7548EA6C3E2EF2B8FBEDDCC43492308C3674D8CA66FBC5BCE0D011271C481823C38315216C19951E9B1DD452EB1DD10795ACDD47373179873EB1774E5371718EA08C76F9DD25D78B6B6B10A2E52FCB5D9646FF361C278C8B0999C83434AD3B784C34049C3B5F215F0D16F5A6E3F19A53A2D3078D2ECEBC8242D9F3AEAB3C88160E415F3C797C4C5ABE68DDE9878CD9CA19FA6548750642F6A6725F3FCD0362E99F671E02AF81480E7D3E353C35C54C338651D4375898E67D3E49B7664B28E9DF04EC7473FE2B4D54C661D9B06337EB9B94D2D3C3433407D860FEB4618F5F3AF073497A9E0489A6C382423EC6D00731788D0C54BEB7CE2A10C590E45C0AE95EE314DA9F6EDA1EE08FF7101143EEAAE4A12FC4B04C176A5E2146BE66419E4954F92285F22DDDAAF31430E94A3B388B94B8039BCB631A5C9BFC9FB8CBC18965CFA4FD89993DB9885310395B1FFE4558CC10B6813FF6464B42AF3E436E9ACD25DA80062BABCFD794BCE63D7730AB9AF341DA21A12BC3267CD18EE4BC69B32AB4D41E926201D0965E62B0E140FD80F3D20466FC902BDE021B201043FE215B237F9E7977A22ED8EA89A7D72E1A255847C9AD128F7C3AF8061C75FBFFF1FF4756CF9BF430000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name]) VALUES (1, N'Rent')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (2, N'Utilities')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (3, N'Insurance')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (4, N'Fees')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (5, N'Wages')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (6, N'Taxes')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (7, N'Interest')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (8, N'Supplies')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (9, N'Depreciation')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (10, N'Maintenance')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (11, N'Travel')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (12, N'Food')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (13, N'Entertainment')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (14, N'Training')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (15, N'Rent')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (16, N'Utilities')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (17, N'Insurance')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (18, N'Fees')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (19, N'Wages')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (20, N'Taxes')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (21, N'Interest')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (22, N'Supplies')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (23, N'Depreciation')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (24, N'Maintenance')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (25, N'Travel')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (26, N'Food')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (27, N'Entertainment')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (28, N'Training')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (29, N'Rent')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (30, N'Utilities')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (31, N'Insurance')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (32, N'Fees')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (33, N'Wages')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (34, N'Taxes')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (35, N'Interest')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (36, N'Supplies')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (37, N'Depreciation')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (38, N'Maintenance')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (39, N'Travel')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (40, N'Food')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (41, N'Entertainment')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (42, N'Training')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (43, N'Rent')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (44, N'Utilities')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (45, N'Insurance')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (46, N'Fees')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (47, N'Wages')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (48, N'Taxes')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (49, N'Interest')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (50, N'Supplies')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (51, N'Depreciation')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (52, N'Maintenance')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (53, N'Travel')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (54, N'Food')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (55, N'Entertainment')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (56, N'Training')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (1, N'Gym Membership', 45.31, CAST(N'2001-01-01 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (2, N'Courses', 436.3, CAST(N'2002-12-14 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (3, N'Books', 32.5, CAST(N'2004-04-06 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (4, N'Bank Interest', 455.3, CAST(N'2001-10-05 00:00:00.000' AS DateTime), 0, 7, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (5, N'Loan Interest', 214.54, CAST(N'2001-03-07 00:00:00.000' AS DateTime), 0, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (6, N'Credit Interest', 31.51, CAST(N'2002-01-08 00:00:00.000' AS DateTime), 1, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (7, N'Mortrage', 209, CAST(N'2002-03-07 00:00:00.000' AS DateTime), 1, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (8, N'Paper', 4, CAST(N'2004-02-06 00:00:00.000' AS DateTime), 1, 8, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (9, N'Ink', 57, CAST(N'2002-03-08 00:00:00.000' AS DateTime), 1, 8, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (10, N'Tax', 71.12, CAST(N'2007-11-06 00:00:00.000' AS DateTime), 1, 6, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (11, N'Wage', 3462, CAST(N'2012-06-14 00:00:00.000' AS DateTime), 0, 5, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (12, N'Wage', 3156.43, CAST(N'2006-02-06 00:00:00.000' AS DateTime), 0, 5, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (15, N'Business Fee', 52.54, CAST(N'2004-03-08 00:00:00.000' AS DateTime), 1, 4, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (16, N'Attorney Fee', 88.32, CAST(N'2001-03-07 00:00:00.000' AS DateTime), 1, 4, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (17, N'Consultant Fee', 1245.3, CAST(N'2007-05-02 00:00:00.000' AS DateTime), 1, 4, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (18, N'Healthcare', 32.5, CAST(N'2003-02-26 00:00:00.000' AS DateTime), 1, 3, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (19, N'Car Insurance', 1200, CAST(N'2002-06-04 00:00:00.000' AS DateTime), 1, 3, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (20, N'Wage', 4520, CAST(N'2004-04-21 00:00:00.000' AS DateTime), 0, 5, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (21, N'Bank Interest', 326, CAST(N'2002-05-30 00:00:00.000' AS DateTime), 0, 7, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (23, N'Gym Membership', 45.31, CAST(N'2001-01-01 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (24, N'Courses', 436.3, CAST(N'2002-12-14 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (25, N'Books', 32.5, CAST(N'2004-04-06 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (26, N'Bank Interest', 455.3, CAST(N'2001-10-05 00:00:00.000' AS DateTime), 0, 7, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (27, N'Loan Interest', 214.54, CAST(N'2001-03-07 00:00:00.000' AS DateTime), 0, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (28, N'Credit Interest', 31.51, CAST(N'2002-01-08 00:00:00.000' AS DateTime), 1, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (29, N'Mortrage', 209, CAST(N'2002-03-07 00:00:00.000' AS DateTime), 1, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (31, N'Ink', 57, CAST(N'2002-03-08 00:00:00.000' AS DateTime), 1, 8, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (32, N'Tax', 71.12, CAST(N'2007-11-06 00:00:00.000' AS DateTime), 1, 6, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (33, N'Wage', 3462, CAST(N'2012-06-14 00:00:00.000' AS DateTime), 0, 5, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (34, N'Wage', 3156.43, CAST(N'2006-02-06 00:00:00.000' AS DateTime), 0, 5, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (35, N'Business Fee', 52.54, CAST(N'2004-03-08 00:00:00.000' AS DateTime), 1, 4, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (36, N'Attorney Fee', 88.32, CAST(N'2001-03-07 00:00:00.000' AS DateTime), 1, 4, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (37, N'Consultant Fee', 1245.3, CAST(N'2007-05-02 00:00:00.000' AS DateTime), 1, 4, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (38, N'Healthcare', 32.5, CAST(N'2003-02-26 00:00:00.000' AS DateTime), 1, 3, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (39, N'Car Insurance', 1200, CAST(N'2002-06-04 00:00:00.000' AS DateTime), 1, 3, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (40, N'Wage', 4520, CAST(N'2004-04-21 00:00:00.000' AS DateTime), 0, 5, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (41, N'Bank Interest', 326, CAST(N'2002-05-30 00:00:00.000' AS DateTime), 0, 7, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (42, N'Gym Membership', 45.31, CAST(N'2001-01-01 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (43, N'Courses', 436.3, CAST(N'2002-12-14 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (44, N'Books', 32.5, CAST(N'2004-04-06 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (45, N'Bank Interest', 455.3, CAST(N'2001-10-05 00:00:00.000' AS DateTime), 0, 7, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (46, N'Loan Interest', 214.54, CAST(N'2001-03-07 00:00:00.000' AS DateTime), 0, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (47, N'Credit Interest', 31.51, CAST(N'2002-01-08 00:00:00.000' AS DateTime), 1, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (48, N'Mortrage', 209, CAST(N'2002-03-07 00:00:00.000' AS DateTime), 1, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (49, N'Paper', 4, CAST(N'2004-02-06 00:00:00.000' AS DateTime), 1, 8, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (50, N'Ink', 57, CAST(N'2002-03-08 00:00:00.000' AS DateTime), 1, 8, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (51, N'Tax', 71.12, CAST(N'2007-11-06 00:00:00.000' AS DateTime), 1, 6, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (52, N'Wage', 3462, CAST(N'2012-06-14 00:00:00.000' AS DateTime), 0, 5, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (53, N'Wage', 3156.43, CAST(N'2006-02-06 00:00:00.000' AS DateTime), 0, 5, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (54, N'Business Fee', 52.54, CAST(N'2004-03-08 00:00:00.000' AS DateTime), 1, 4, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (55, N'Attorney Fee', 88.32, CAST(N'2001-03-07 00:00:00.000' AS DateTime), 1, 4, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (56, N'Consultant Fee', 1245.3, CAST(N'2007-05-02 00:00:00.000' AS DateTime), 1, 4, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (57, N'Healthcare', 32.5, CAST(N'2003-02-26 00:00:00.000' AS DateTime), 1, 3, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (58, N'Car Insurance', 1200, CAST(N'2002-06-04 00:00:00.000' AS DateTime), 1, 3, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (59, N'Wage', 4520, CAST(N'2004-04-21 00:00:00.000' AS DateTime), 0, 5, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (60, N'Bank Interest', 326, CAST(N'2002-05-30 00:00:00.000' AS DateTime), 0, 7, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (61, N'Gym Membership', 45.31, CAST(N'2001-01-01 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (62, N'Courses', 436.3, CAST(N'2002-12-14 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (63, N'Books', 32.5, CAST(N'2004-04-06 00:00:00.000' AS DateTime), 1, 14, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (64, N'Bank Interest', 455.3, CAST(N'2001-10-05 00:00:00.000' AS DateTime), 0, 7, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (65, N'Loan Interest', 214.54, CAST(N'2001-03-07 00:00:00.000' AS DateTime), 0, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (66, N'Credit Interest', 31.51, CAST(N'2002-01-08 00:00:00.000' AS DateTime), 1, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (67, N'Mortrage', 209, CAST(N'2002-03-07 00:00:00.000' AS DateTime), 1, 7, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (68, N'Paper', 4, CAST(N'2004-02-06 00:00:00.000' AS DateTime), 1, 8, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (69, N'Ink', 57, CAST(N'2002-03-08 00:00:00.000' AS DateTime), 1, 8, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (70, N'Tax', 71.12, CAST(N'2007-11-06 00:00:00.000' AS DateTime), 1, 6, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (72, N'Wage', 3156.43, CAST(N'2006-02-06 00:00:00.000' AS DateTime), 0, 5, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (73, N'Business Fee', 52.54, CAST(N'2004-03-08 00:00:00.000' AS DateTime), 1, 4, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (74, N'Attorney Fee', 88.32, CAST(N'2001-03-07 00:00:00.000' AS DateTime), 1, 4, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (75, N'Consultant Fee', 1245.3, CAST(N'2007-05-02 00:00:00.000' AS DateTime), 1, 4, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (76, N'Healthcare', 32.5, CAST(N'2003-02-26 00:00:00.000' AS DateTime), 1, 3, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (77, N'Car Insurance', 1200, CAST(N'2002-06-04 00:00:00.000' AS DateTime), 1, 3, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (78, N'Wage', 4520, CAST(N'2004-04-21 00:00:00.000' AS DateTime), 0, 5, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [CategoryID_ID], [User_ID]) VALUES (79, N'Bank Interest', 326, CAST(N'2002-05-30 00:00:00.000' AS DateTime), 0, 7, 4)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (1, N'Morris', N'Gonzales')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (2, N'Maggie', N'Little')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (3, N'Andrew', N'Douglas')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (4, N'Evelyn', N'Turner')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (5, N'Jorge', N'Love')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (6, N'Clay', N'Martinez')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (7, N'Morris', N'Gonzales')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (8, N'Maggie', N'Little')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (9, N'Andrew', N'Douglas')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (10, N'Evelyn', N'Turner')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (11, N'Jorge', N'Love')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (12, N'Clay', N'Martinez')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (13, N'Morris', N'Gonzales')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (14, N'Maggie', N'Little')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (15, N'Andrew', N'Douglas')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (16, N'Evelyn', N'Turner')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (17, N'Jorge', N'Love')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (18, N'Clay', N'Martinez')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (19, N'Morris', N'Gonzales')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (20, N'Maggie', N'Little')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (21, N'Andrew', N'Douglas')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (22, N'Evelyn', N'Turner')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (23, N'Jorge', N'Love')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (24, N'Clay', N'Martinez')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_CategoryID_ID]    Script Date: 30.8.2016 г. 13:16:39 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryID_ID] ON [dbo].[Transactions]
(
	[CategoryID_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_ID]    Script Date: 30.8.2016 г. 13:16:39 ******/
CREATE NONCLUSTERED INDEX [IX_User_ID] ON [dbo].[Transactions]
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category_ID]    Script Date: 30.8.2016 г. 13:16:39 ******/
CREATE NONCLUSTERED INDEX [IX_Category_ID] ON [dbo].[UserCategories]
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_ID]    Script Date: 30.8.2016 г. 13:16:39 ******/
CREATE NONCLUSTERED INDEX [IX_User_ID] ON [dbo].[UserCategories]
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transactions]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.Transactions_dbo.Categories_CategoryID_ID] FOREIGN KEY([CategoryID_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_dbo.Transactions_dbo.Categories_CategoryID_ID]
GO
ALTER TABLE [dbo].[Transactions]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.Transactions_dbo.Users_User_ID] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_dbo.Transactions_dbo.Users_User_ID]
GO
ALTER TABLE [dbo].[UserCategories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserCategories_dbo.Categories_Category_ID] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[UserCategories] CHECK CONSTRAINT [FK_dbo.UserCategories_dbo.Categories_Category_ID]
GO
ALTER TABLE [dbo].[UserCategories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserCategories_dbo.Users_User_ID] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserCategories] CHECK CONSTRAINT [FK_dbo.UserCategories_dbo.Users_User_ID]
GO
USE [master]
GO
ALTER DATABASE [BudgetDBContext] SET  READ_WRITE 
GO
