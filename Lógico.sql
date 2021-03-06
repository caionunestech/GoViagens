USE [master]
GO
/****** Object:  Database [GoViagens]    Script Date: 18/12/2021 02:30:25 ******/
CREATE DATABASE [GoViagens]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GoViagens', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSS\MSSQL\DATA\GoViagens.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GoViagens_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSS\MSSQL\DATA\GoViagens_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GoViagens] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GoViagens].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GoViagens] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GoViagens] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GoViagens] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GoViagens] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GoViagens] SET ARITHABORT OFF 
GO
ALTER DATABASE [GoViagens] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GoViagens] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GoViagens] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GoViagens] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GoViagens] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GoViagens] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GoViagens] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GoViagens] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GoViagens] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GoViagens] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GoViagens] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GoViagens] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GoViagens] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GoViagens] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GoViagens] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GoViagens] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [GoViagens] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GoViagens] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GoViagens] SET  MULTI_USER 
GO
ALTER DATABASE [GoViagens] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GoViagens] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GoViagens] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GoViagens] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GoViagens] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GoViagens] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GoViagens] SET QUERY_STORE = OFF
GO
USE [GoViagens]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18/12/2021 02:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destinos]    Script Date: 18/12/2021 02:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cidade] [nvarchar](max) NOT NULL,
	[Preço] [nvarchar](max) NULL,
	[Imagem] [nvarchar](max) NULL,
 CONSTRAINT [PK_Destinos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocao]    Script Date: 18/12/2021 02:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomePromocao] [nvarchar](max) NULL,
	[ValorDesconto] [float] NOT NULL,
	[DestinoId] [int] NOT NULL,
 CONSTRAINT [PK_Promocao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Promocao_DestinoId]    Script Date: 18/12/2021 02:30:30 ******/
CREATE NONCLUSTERED INDEX [IX_Promocao_DestinoId] ON [dbo].[Promocao]
(
	[DestinoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Promocao]  WITH CHECK ADD  CONSTRAINT [FK_Promocao_Destinos_DestinoId] FOREIGN KEY([DestinoId])
REFERENCES [dbo].[Destinos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Promocao] CHECK CONSTRAINT [FK_Promocao_Destinos_DestinoId]
GO
USE [master]
GO
ALTER DATABASE [GoViagens] SET  READ_WRITE 
GO
