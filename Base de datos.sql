USE [master]
GO
/****** Object:  Database [autenticacion]    Script Date: 12/10/2022 23:19:58 ******/
CREATE DATABASE [autenticacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'autenticacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\autenticacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'autenticacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\autenticacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [autenticacion] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [autenticacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [autenticacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [autenticacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [autenticacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [autenticacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [autenticacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [autenticacion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [autenticacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [autenticacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [autenticacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [autenticacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [autenticacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [autenticacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [autenticacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [autenticacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [autenticacion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [autenticacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [autenticacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [autenticacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [autenticacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [autenticacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [autenticacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [autenticacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [autenticacion] SET RECOVERY FULL 
GO
ALTER DATABASE [autenticacion] SET  MULTI_USER 
GO
ALTER DATABASE [autenticacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [autenticacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [autenticacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [autenticacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [autenticacion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [autenticacion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'autenticacion', N'ON'
GO
ALTER DATABASE [autenticacion] SET QUERY_STORE = OFF
GO
USE [autenticacion]
GO
/****** Object:  Table [dbo].[Encuesta]    Script Date: 12/10/2022 23:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encuesta](
	[Idencuesta] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Idencuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 12/10/2022 23:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[Idpreguntas] [int] NOT NULL,
	[Pregunta] [varchar](50) NULL,
	[EsRequerido] [varchar](50) NULL,
	[TipoCampo] [varchar](50) NULL,
	[iencuesta] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idpreguntas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resultados]    Script Date: 12/10/2022 23:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resultados](
	[Idpresultados] [int] NOT NULL,
	[preguntar] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idpresultados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 12/10/2022 23:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[IdRol] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 12/10/2022 23:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[Nombres] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Clave] [varchar](50) NULL,
	[IdRol] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Encuesta] ([Idencuesta], [Nombre], [Descripcion]) VALUES (1, N'Musicaa', N'Generos musicales')
INSERT [dbo].[Encuesta] ([Idencuesta], [Nombre], [Descripcion]) VALUES (2, N'animales', N'tipos de animales')
GO
INSERT [dbo].[Preguntas] ([Idpreguntas], [Pregunta], [EsRequerido], [TipoCampo], [iencuesta]) VALUES (1, N'Generos Musicales', N'Sí', N'Texto', 1)
INSERT [dbo].[Preguntas] ([Idpreguntas], [Pregunta], [EsRequerido], [TipoCampo], [iencuesta]) VALUES (2, N'Pop es genero musica', N'Sí', N'Texto', 1)
INSERT [dbo].[Preguntas] ([Idpreguntas], [Pregunta], [EsRequerido], [TipoCampo], [iencuesta]) VALUES (3, N'Tipos de animales', N'Sí', N'Texto', 2)
INSERT [dbo].[Preguntas] ([Idpreguntas], [Pregunta], [EsRequerido], [TipoCampo], [iencuesta]) VALUES (4, N'Nombre un animal salvaje', N'Sí', N'Texto', 2)
INSERT [dbo].[Preguntas] ([Idpreguntas], [Pregunta], [EsRequerido], [TipoCampo], [iencuesta]) VALUES (5, N'Marimba es un genero musical', N'Sí', N'Texto', 1)
GO
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (1, 1)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (2, 1)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (3, 1)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (4, 2)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (5, 2)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (6, 1)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (7, 2)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (8, 1)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (9, 1)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (10, 1)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (11, 2)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (12, 5)
INSERT [dbo].[Resultados] ([Idpresultados], [preguntar]) VALUES (13, 5)
GO
INSERT [dbo].[ROL] ([IdRol], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[ROL] ([IdRol], [Descripcion]) VALUES (2, N'Empleado')
GO
INSERT [dbo].[USUARIOS] ([Nombres], [Correo], [Clave], [IdRol]) VALUES (N'Luisa', N'lferca@gmail.com', N'123', 1)
INSERT [dbo].[USUARIOS] ([Nombres], [Correo], [Clave], [IdRol]) VALUES (N'Mildred', N'milix@gmail.com', N'456', 2)
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD FOREIGN KEY([iencuesta])
REFERENCES [dbo].[Encuesta] ([Idencuesta])
GO
ALTER TABLE [dbo].[Resultados]  WITH CHECK ADD FOREIGN KEY([preguntar])
REFERENCES [dbo].[Preguntas] ([Idpreguntas])
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
USE [master]
GO
ALTER DATABASE [autenticacion] SET  READ_WRITE 
GO
