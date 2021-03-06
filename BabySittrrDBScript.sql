USE [master]
GO
/****** Object:  Database [BabySitter]    Script Date: 17/03/2018 20:47:44 ******/
CREATE DATABASE [BabySitter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BabySitter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BabySitter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BabySitter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BabySitter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BabySitter] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BabySitter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BabySitter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BabySitter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BabySitter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BabySitter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BabySitter] SET ARITHABORT OFF 
GO
ALTER DATABASE [BabySitter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BabySitter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BabySitter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BabySitter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BabySitter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BabySitter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BabySitter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BabySitter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BabySitter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BabySitter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BabySitter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BabySitter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BabySitter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BabySitter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BabySitter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BabySitter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BabySitter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BabySitter] SET RECOVERY FULL 
GO
ALTER DATABASE [BabySitter] SET  MULTI_USER 
GO
ALTER DATABASE [BabySitter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BabySitter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BabySitter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BabySitter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BabySitter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BabySitter] SET QUERY_STORE = OFF
GO
USE [BabySitter]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BabySitter]
GO
/****** Object:  Table [dbo].[BabyCareUser]    Script Date: 17/03/2018 20:47:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BabyCareUser](
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BCUsers] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BabySitter]    Script Date: 17/03/2018 20:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BabySitter](
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[StreetNumber] [int] NOT NULL,
	[BirthDate] [datetime] NULL,
	[StreetName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BabySitter] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BabySitterInvitation]    Script Date: 17/03/2018 20:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BabySitterInvitation](
	[Status] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[ActualDate] [datetime] NULL,
	[StartingTime] [datetime] NULL,
	[EndingTime] [datetime] NULL,
	[price] [int] NULL,
	[InvitationNumber] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvitationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 17/03/2018 20:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invitation]    Script Date: 17/03/2018 20:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invitation](
	[Status] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[ActualDate] [datetime] NULL,
	[StartingTime] [datetime] NULL,
	[EndingTime] [datetime] NULL,
	[parentUserName] [nvarchar](50) NOT NULL,
	[price] [int] NULL,
	[InvitationNumber] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvitationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 17/03/2018 20:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[StreetNumber] [int] NOT NULL,
	[BirthDate] [datetime] NULL,
	[StreetName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParentInvitation]    Script Date: 17/03/2018 20:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParentInvitation](
	[InvitationNumber] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ActualDate] [time](7) NOT NULL,
	[StartingTime] [time](7) NOT NULL,
	[EndingTime] [time](7) NOT NULL,
 CONSTRAINT [PK_ParentInvitation] PRIMARY KEY CLUSTERED 
(
	[InvitationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 17/03/2018 20:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[InvitationNumber] [int] NOT NULL,
	[PaymentItem] [nvarchar](50) NOT NULL,
	[CreditCardNumber] [int] NOT NULL,
	[Comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvitationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentItems]    Script Date: 17/03/2018 20:47:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentItems](
	[PaymentItem] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentItems] PRIMARY KEY CLUSTERED 
(
	[PaymentItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BabySitter]  WITH CHECK ADD  CONSTRAINT [FK_BSuserName] FOREIGN KEY([UserName])
REFERENCES [dbo].[BabyCareUser] ([UserName])
GO
ALTER TABLE [dbo].[BabySitter] CHECK CONSTRAINT [FK_BSuserName]
GO
ALTER TABLE [dbo].[BabySitter]  WITH CHECK ADD  CONSTRAINT [FK_CityBabySitter_Constraint] FOREIGN KEY([City])
REFERENCES [dbo].[Cities] ([City])
GO
ALTER TABLE [dbo].[BabySitter] CHECK CONSTRAINT [FK_CityBabySitter_Constraint]
GO
ALTER TABLE [dbo].[BabySitterInvitation]  WITH CHECK ADD  CONSTRAINT [FK_BabySitterInvitation_Constraint] FOREIGN KEY([UserName])
REFERENCES [dbo].[BabySitter] ([UserName])
GO
ALTER TABLE [dbo].[BabySitterInvitation] CHECK CONSTRAINT [FK_BabySitterInvitation_Constraint]
GO
ALTER TABLE [dbo].[Invitation]  WITH CHECK ADD  CONSTRAINT [FK_BabySitter_Invitation_Constraint] FOREIGN KEY([UserName])
REFERENCES [dbo].[BabySitter] ([UserName])
GO
ALTER TABLE [dbo].[Invitation] CHECK CONSTRAINT [FK_BabySitter_Invitation_Constraint]
GO
ALTER TABLE [dbo].[Invitation]  WITH CHECK ADD  CONSTRAINT [FK_Parent_Invitation_Constraint] FOREIGN KEY([parentUserName])
REFERENCES [dbo].[Parent] ([UserName])
GO
ALTER TABLE [dbo].[Invitation] CHECK CONSTRAINT [FK_Parent_Invitation_Constraint]
GO
ALTER TABLE [dbo].[Parent]  WITH CHECK ADD  CONSTRAINT [FK_CityParent_Constraint] FOREIGN KEY([City])
REFERENCES [dbo].[Cities] ([City])
GO
ALTER TABLE [dbo].[Parent] CHECK CONSTRAINT [FK_CityParent_Constraint]
GO
ALTER TABLE [dbo].[Parent]  WITH CHECK ADD  CONSTRAINT [FK_pUserName] FOREIGN KEY([UserName])
REFERENCES [dbo].[BabyCareUser] ([UserName])
GO
ALTER TABLE [dbo].[Parent] CHECK CONSTRAINT [FK_pUserName]
GO
ALTER TABLE [dbo].[ParentInvitation]  WITH CHECK ADD  CONSTRAINT [FK_ParentInvitation_Constraint] FOREIGN KEY([UserName])
REFERENCES [dbo].[Parent] ([UserName])
GO
ALTER TABLE [dbo].[ParentInvitation] CHECK CONSTRAINT [FK_ParentInvitation_Constraint]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Constraint] FOREIGN KEY([PaymentItem])
REFERENCES [dbo].[PaymentItems] ([PaymentItem])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Constraint]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Inv] FOREIGN KEY([InvitationNumber])
REFERENCES [dbo].[Invitation] ([InvitationNumber])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Inv]
GO
USE [master]
GO
ALTER DATABASE [BabySitter] SET  READ_WRITE 
GO
