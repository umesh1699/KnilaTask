USE [master]
GO
/****** Object:  Database [KnilaTaskDB]     Script Date: 21-11-2022 17:13:08 ******/
CREATE DATABASE [KnilaTaskDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KnilaTaskDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KnilaTaskDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KnilaTaskDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KnilaTaskDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KnilaTaskDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KnilaTaskDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KnilaTaskDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KnilaTaskDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KnilaTaskDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KnilaTaskDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KnilaTaskDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KnilaTaskDB] SET  MULTI_USER 
GO
ALTER DATABASE [KnilaTaskDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KnilaTaskDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KnilaTaskDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KnilaTaskDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KnilaTaskDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KnilaTaskDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KnilaTaskDB] SET QUERY_STORE = OFF
GO
USE [KnilaTaskDB]
GO
/****** Object:  Table [dbo].[City]    Script Date: 21-11-2022 22:29:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[StateId] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 21-11-2022 22:29:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](250) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactAddress]    Script Date: 21-11-2022 22:29:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [varchar](250) NULL,
	[AddressLine2] [varchar](250) NULL,
	[Landmark] [varchar](150) NULL,
	[PostalCode] [varchar](50) NULL,
	[ContactId] [int] NULL,
 CONSTRAINT [PK_ContactAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 21-11-2022 22:29:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateTbl]    Script Date: 21-11-2022 22:29:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateTbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (1, N'Bengaluru', 1)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (2, N'Mysore', 1)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (3, N'Kochi', 2)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (4, N'Thiruvananthapuram', 2)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (5, N'Bhopal', 3)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (6, N'Indore', 3)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (7, N'Jabalpur', 3)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (8, N'Mumbai', 4)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (9, N'Pune', 4)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (10, N'Nashik', 4)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (11, N'Nagpur', 4)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (12, N'Aurangabad', 4)
INSERT [dbo].[City] ([Id], [Name], [StateId]) VALUES (13, N'Karad', 4)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Email], [PhoneNumber], [CityId], [StateId], [CountryId]) VALUES (1, N'Umesh', N'Thorat', N'umeshthorat1699@gmail.com', N'9762273113', 13, 4, 1)
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Email], [PhoneNumber], [CityId], [StateId], [CountryId]) VALUES (5, N'Sachin', N'Tendulkar', N'sachin@gmail.com', N'9874563210', 8, 4, 1)
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Email], [PhoneNumber], [CityId], [StateId], [CountryId]) VALUES (7, N'tej', N'Yadav', N'tej@gmail.com', N'9874563210', 3, 2, 1)
INSERT [dbo].[Contact] ([Id], [FirstName], [LastName], [Email], [PhoneNumber], [CityId], [StateId], [CountryId]) VALUES (8, N'Jhon', N'T', N'jhon@gmail.com', N'4563212012', 6, 3, 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactAddress] ON 

INSERT [dbo].[ContactAddress] ([Id], [AddressLine1], [AddressLine2], [Landmark], [PostalCode], [ContactId]) VALUES (1, N'near Alankar Hotel', N'karad', N'Alankar Hotel', N'415110', 1)
INSERT [dbo].[ContactAddress] ([Id], [AddressLine1], [AddressLine2], [Landmark], [PostalCode], [ContactId]) VALUES (5, N'Marine Drive', N'Mumbai', NULL, N'400020', 5)
INSERT [dbo].[ContactAddress] ([Id], [AddressLine1], [AddressLine2], [Landmark], [PostalCode], [ContactId]) VALUES (6, N'MG Road', N'Kochi', N'Kochi', N'412012', 7)
INSERT [dbo].[ContactAddress] ([Id], [AddressLine1], [AddressLine2], [Landmark], [PostalCode], [ContactId]) VALUES (7, N'Indra Nagar', N'Indore', N'Indore', N'568953', 8)
SET IDENTITY_INSERT [dbo].[ContactAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name]) VALUES (1, N'India')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[StateTbl] ON 

INSERT [dbo].[StateTbl] ([Id], [Name], [CountryId]) VALUES (1, N'Karnataka', 1)
INSERT [dbo].[StateTbl] ([Id], [Name], [CountryId]) VALUES (2, N'Kerala', 1)
INSERT [dbo].[StateTbl] ([Id], [Name], [CountryId]) VALUES (3, N'Madhya Pradesh', 1)
INSERT [dbo].[StateTbl] ([Id], [Name], [CountryId]) VALUES (4, N'Maharashtra', 1)
SET IDENTITY_INSERT [dbo].[StateTbl] OFF
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[StateTbl] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_City]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Country]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[StateTbl] ([Id])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_State]
GO
ALTER TABLE [dbo].[ContactAddress]  WITH CHECK ADD  CONSTRAINT [FK_ContactAddress_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[ContactAddress] CHECK CONSTRAINT [FK_ContactAddress_Contact]
GO
ALTER TABLE [dbo].[StateTbl]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[StateTbl] CHECK CONSTRAINT [FK_State_Country]
GO


/****** Object:  StoredProcedure [dbo].[p_GetAllContactsData]    Script Date: 21-11-2022 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetAllContactsData]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	   c.Id,
	   c.FirstName,
	   c.LastName,
	   c.Email,
	   c.PhoneNumber,
	   ca.AddressLine1,
	   ca.AddressLine2,
	   ca.Landmark,
	   ca.PostalCode,
	   ct.Name as CityName,
	   st.Name as StateName,
	   co.Name as CountryName	   
	   from Contact c 
	   join ContactAddress ca on c.Id = ca.ContactId
	   join City ct on c.CityId = ct.Id
	   join StateTbl st on c.StateId = st.Id
	   join Country co on c.CountryId = co.Id
	   order by c.Id desc;
END
GO
/****** Object:  StoredProcedure [dbo].[p_GetContactsDataById]    Script Date: 21-11-2022 17:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetContactsDataById]
	@ContactId as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT c.FirstName,
	   c.LastName,
	   c.Email,
	   c.PhoneNumber,
	   ca.AddressLine1,
	   ca.AddressLine2,
	   ca.Landmark,
	   ca.PostalCode,
	   ct.Name as CityName,
	   st.Name as StateName,
	   co.Name as CountryName	   
	   from Contact c 
	   join ContactAddress ca on c.Id = ca.ContactId
	   join City ct on c.CityId = ct.Id
	   join StateTbl st on c.StateId = st.Id
	   join Country co on c.CountryId = co.Id
	   where c.Id=@ContactId;
END
GO
USE [master]
GO
ALTER DATABASE [KnilaTaskDB] SET  READ_WRITE 
GO
