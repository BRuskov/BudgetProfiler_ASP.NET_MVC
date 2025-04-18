USE [master]
GO
/****** Object:  Database [BudgetDBContext]    Script Date: 30.8.2016 г. 14:37:57 ******/
CREATE DATABASE [BudgetDBContext]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BudgetDBContext.mdf', FILENAME = N'C:\Users\boris.ruskov\Desktop\Project\BudgetProfilerr\App_Data\BudgetDBContext.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BudgetDBContext_log.ldf', FILENAME = N'C:\Users\boris.ruskov\Desktop\Project\BudgetProfilerr\App_Data\BudgetDBContext_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 30.8.2016 г. 14:37:57 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 30.8.2016 г. 14:37:57 ******/
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
/****** Object:  Table [dbo].[Transactions]    Script Date: 30.8.2016 г. 14:37:57 ******/
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
	[Category_ID] [int] NULL,
	[User_ID] [int] NULL,
 CONSTRAINT [PK_dbo.Transactions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserCategories]    Script Date: 30.8.2016 г. 14:37:57 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 30.8.2016 г. 14:37:57 ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201608301115571_InitialCreate', N'BudgetProfilerr.Models.BudgetDBContext', 0x1F8B0800000000000400ED5CDB6EDC36107D2FD07F10F458A4ABB58300ADB19BC05EDB85D1F802AF13F42DA025EE9AA844A92265ECA2E897F5A19FD45FE850578AA46E7B71B68111C08825F2CC70E670861C4DF2EFDFFF4C3EAC02DF7AC63123219DDA47A3B16D61EA861EA1CBA99DF0C58F3FD91FDE7FFFDDE4C20B56D6E762DC5B310E665236B59F388F4E1C87B94F38406C1410370E59B8E023370C1CE485CEF178FCB37374E46080B001CBB226F709E524C0E92FF0EB2CA42E8E7882FCEBD0C33ECB9FC39B798A6ADDA000B308B9786A9F25DE12F3BB385C101FC7F1289B615BA73E41A0CD1CFB0BDB4294861C71D0F5E413C3731E8774398FE001F21FD61186710BE4339CAFE1A41ADE7739E363B11CA79A5840B909E3613010F0E86D6E1F479DBE9195EDD27E60C10BB0345F8B55A7569CDA33C4F1328CD7A9E16C4B957832F36331BAC9D2A314906036AA01BDB194E16F4AB600A9C49F37D62CF17912E329C5098F114CB94B1E7DE2FE8AD70FE1EF984E69E2FBB2EEA03DBCAB3D80472021C2315FDFE345BEA2AB73DB72EAF31C7562394D9A932DF38AF2B7C7B67503C2D1A38F4B6A482699F330C6BF608A6358B2778738C73178F6CAC3A97135E98A2CF1B390065C84AD655BD768F511D3257F82CDF4CEB62EC90A7BC5835C814F94C04684393C4EB0414159E8C4A9FCDCEAFD871851865CB1ACAD09A062BD72A059D639666E4CA26C4F3752E1DDB81715DA459D062184D742CA790806EEA28F0EF200E179CE51109538B06CF17030126117AB0853566E81B330F431A2DD4037E8992C53EB2B9045E4B1AD7BECA703D81389B2E0AFB1F24B35FA320E83FBD0376C8372D0977998C4AED035EC1AF98062207B7FAD2113C5FD34CE46B6682B06746B9A8E3269D93B5A0884ADC34409F21A1F9A655D9298F18E4471DC2F3A0CDC9F1FD18B081EC4B96ACB6E47BB02E795795B8755D99CC6906A1CA00529F3A89D85D21ABC1A46B597EDDA0D0E9FA78C852E49556A386D5586AB2FF4827A56EFC494ED5253E2804D0B242611D016D49BDA3F6816ED23A858B22448B933D4A58C47A323D5409229065A28755A6FA5EB5EDC93656A44908448D9718716316FB426653B765D5DD96ADBF6B746FB867D118EE89BBA97B24DDCD88925F6C9892CBACC42CA1181A89E5B21CB60E767E2395E71436A04D9797664794A56972270E798D7E33D244BDBAA229AD99D9A55EA50D29E3181E9DBB1034F98D1042499B70742E5652350F55AC192FC625CA27AAF90C6775E42D403C390D05FAE5135B8B3096AC15E095566847A66A91B65138365F9B887B1F43D3E200BECC448B5ED2D21E6BCDCDA360DA729DD363DB2C1807CA0ACA469030C4800FB228FE120D7619C0ED234A786AD8DB22BB214E7CA32F2577570272B84170573A7A1623EB9465104B737A9829E3FB1E659F97CF6E37C784D39C8301C97194ACBA5B6A524B88FA02556DE8268D034BDE69E238E1E91B8C5CCBC401BA6E6B986305F48D35299EEB422F41753C4DFE59CAADD21EBB94F01AC6C7A09CB0CE09295AE18EB3BA1697EFA5D03F92836DCFA66A19F04B4E9E6D8363BBBC3CBF3B3273AC2C45116A09ACCD16CA65058F5422F1FD5A2F10EBCA41D2A863BAA1B623FBEAA55836598DA8BFE7845C957862A9EF547916ABE3290F4B83F9654F595B1A4C707C3CB2C4CEF8090D5E17438135BE6EE878252C15106911EF7C7AA4A883254F5F4A05CDD7288DAC8E34D783D9DDE3C7D3BBFEFDBC2F5534C63A457AF4A83A3BA347768F416E73535C475DD86743BF6F241096372863065A9C8363AE627D60D751CAC1A9CC03C92D661AE98284097C5E79E2B578FBADBF328BB080CE750366F1FFC91CFFE1BFA2585D8076FE45BCE4171A661C55BF3A5E1563D288CB7C49B8EECA1FAA3F5E27C0071A6B55470507CD9678C31141A86F1C51C5BB6E1CA01C594C6AAC941F163E378A2555CD421E529AAACBC281596495EEDE86E5CD4CA1FD910DB82A53F134F943EE66BC67130120346F33FFC994FB0B8C11503AE11250BCC78F63DDA3E1E1F1D2B7D8F87D383E830E6F9866A516323E28B7F5927C2B49DDFCE073653C88D14F419C5EE138AB566BF3D75F27D1B163434CA190D295AE52AE8E17D710B3F447CFBB6380F56CD77D216F74886AB534B8C9253B44F8357D4C3ABA9FD673AEFC4BAFAED8B34F58D751B437839B1C6D65F438D5A86DE61D2F369FD256FD0B2F66DEC07AD31CCB81B8EC75BF77D6D86BB595BD7B7E19AD7DDB78B8E27A5D160F38E12ABED8BEE96DD41C0431C0B9A201FCE8A8CC7705AD42A6A7731A12E89906F5C997E62EE437261FB12577D738E218308F6362DBA8FCC8E2B652943D97B5D16D95B0F98D402B259DFCDC1F1A4EDBBC16170A4E53AF902FC18D611B79F7852EF0CD8B89BECFF11473A3E6B1C620C19D623B8BBF8F13579F1A2716330275E3266983B26F58613D58BC67EC8223E74B54466F51BB8023E86E0F9ECE8D4D203D5D232D924501F6292D9D6E5666C8B6C1227BD33C931B7336DD577D924A6C58C5FA737D3480D43AFCF9026C3A65645737FEB01F55F6A1C523A180EC9087B6BB4DC05234C7BA5B30FF1509A293765C0AE173DA06B52AFD543CE91FE2B02487A8C2C2B08F1F58162B7966DCA3157741116594FD1A818A2DCD6AF31471EA4A2D3989305D01C5EBB98B1F45FDB7D467E02432E8247EC5DD1DB8447098725E3E0D1AF194324CF36F9696B685DE7C96D5A4D65BB5802A84944C9F3969E25C4F74ABD2F0D95A106089195F3228CF02517C598E5BA44BA09694FA0DC7CE561E20107910F60EC96CED133DE4437A0E047BC44EEBAF8E4D20CD2ED88BAD927E7042D6314B01CA39A0FBF0287BD60F5FE3F7825BCF691430000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name]) VALUES (1, N'Automobile')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (2, N'Bank Charges')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (3, N'Charity')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (4, N'Childcare')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (5, N'Clothing')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (6, N'Credit Card Fees')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (7, N'Education')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (8, N'Events')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (9, N'Food')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (10, N'Gifts')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (11, N'Healthcare')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (12, N'Household')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (13, N'Insurance')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (14, N'Hobbies')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (15, N'Loans')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (16, N'Taxes')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (17, N'Utilities')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (18, N'Vacation')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (19, N'Paycheck')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (20, N'Bonus')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (21, N'Rental Income')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (22, N'Interest ')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (23, N'Capital Gains')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (24, N'Lottery')
INSERT [dbo].[Categories] ([ID], [Name]) VALUES (25, N'Salary')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (1, N'Gasoline', 32.61, CAST(N'2001-02-03 00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (2, N'Maintenance', 90.1, CAST(N'2003-01-11 00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (4, N'Check orders', 12.54, CAST(N'2001-04-02 00:00:00.000' AS DateTime), 1, 2, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (5, N'Salary', 1040, CAST(N'2002-01-05 00:00:00.000' AS DateTime), 0, 25, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (6, N'Interest', 360.43, CAST(N'2001-12-23 00:00:00.000' AS DateTime), 0, 22, 1)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (7, N'Charity', 32.65, CAST(N'2004-05-18 00:00:00.000' AS DateTime), 1, 3, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (8, N'Babysitting', 94.21, CAST(N'2006-04-24 00:00:00.000' AS DateTime), 1, 4, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (9, N'Late fee', 30.99, CAST(N'2002-06-03 00:00:00.000' AS DateTime), 1, 6, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (11, N'Rewards programs', 100, CAST(N'2005-01-04 00:00:00.000' AS DateTime), 0, 6, 2)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (12, N'Tuition', 63.21, CAST(N'2003-04-07 00:00:00.000' AS DateTime), 1, 7, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (13, N'School supplies', 904, CAST(N'2005-02-04 00:00:00.000' AS DateTime), 1, 7, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (14, N'Lottery', 43851, CAST(N'2004-01-06 00:00:00.000' AS DateTime), 0, 24, 3)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (15, N'Cash advance fee', 64.33, CAST(N'2006-06-01 00:00:00.000' AS DateTime), 1, 6, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (16, N'Monthly payment', 454.1, CAST(N'2003-07-02 00:00:00.000' AS DateTime), 1, 11, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (18, N'Salary', 56.12, CAST(N'2004-02-26 00:00:00.000' AS DateTime), 0, 25, 4)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (19, N'Vision', 466.35, CAST(N'2002-07-21 00:00:00.000' AS DateTime), 1, 11, 5)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (20, N'Hospital', 50.19, CAST(N'2005-01-06 00:00:00.000' AS DateTime), 1, 11, 5)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (21, N'Health', 501.3, CAST(N'2011-12-26 00:00:00.000' AS DateTime), 1, 11, 5)
INSERT [dbo].[Transactions] ([ID], [Description], [Amount], [TimeStamp], [isExpense], [Category_ID], [User_ID]) VALUES (22, N'Paycheck', 943.21, CAST(N'2002-06-23 00:00:00.000' AS DateTime), 0, 25, 5)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
SET IDENTITY_INSERT [dbo].[UserCategories] ON 

INSERT [dbo].[UserCategories] ([ID], [Category_ID], [User_ID]) VALUES (1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserCategories] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (1, N'Jason', N'Hart')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (2, N'Mary', N'Hughes')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (3, N'Jacob', N'McGrath')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (4, N'Rose', N'Piper')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (5, N'Rachel', N'Scott')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName]) VALUES (6, N'Robert', N'Randall')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_Category_ID]    Script Date: 30.8.2016 г. 14:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Category_ID] ON [dbo].[Transactions]
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_ID]    Script Date: 30.8.2016 г. 14:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_User_ID] ON [dbo].[Transactions]
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category_ID]    Script Date: 30.8.2016 г. 14:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_Category_ID] ON [dbo].[UserCategories]
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_ID]    Script Date: 30.8.2016 г. 14:37:57 ******/
CREATE NONCLUSTERED INDEX [IX_User_ID] ON [dbo].[UserCategories]
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Transactions_dbo.Categories_Category_ID] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_dbo.Transactions_dbo.Categories_Category_ID]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Transactions_dbo.Users_User_ID] FOREIGN KEY([User_ID])
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
