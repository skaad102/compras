USE [master]
GO
/****** Object:  Database [mi_tienda_Db]    Script Date: 01/12/2021 02:02:52 p. m. ******/
CREATE DATABASE [mi_tienda_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mi_tienda_Db', FILENAME = N'D:\programas\SQL2019\SQLSER\MSSQL15.MSSQLSERVER\MSSQL\DATA\mi_tienda_Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mi_tienda_Db_log', FILENAME = N'D:\programas\SQL2019\SQLSER\MSSQL15.MSSQLSERVER\MSSQL\DATA\mi_tienda_Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mi_tienda_Db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mi_tienda_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mi_tienda_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mi_tienda_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mi_tienda_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mi_tienda_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mi_tienda_Db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [mi_tienda_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET RECOVERY FULL 
GO
ALTER DATABASE [mi_tienda_Db] SET  MULTI_USER 
GO
ALTER DATABASE [mi_tienda_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mi_tienda_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mi_tienda_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mi_tienda_Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mi_tienda_Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mi_tienda_Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mi_tienda_Db', N'ON'
GO
ALTER DATABASE [mi_tienda_Db] SET QUERY_STORE = OFF
GO
USE [mi_tienda_Db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01/12/2021 02:02:52 p. m. ******/
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
/****** Object:  Table [dbo].[Compra]    Script Date: 01/12/2021 02:02:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[CompraId] [int] IDENTITY(1,1) NOT NULL,
	[FechaCompra] [datetime2](7) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[ProveedorId] [int] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[CompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 01/12/2021 02:02:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ProdurctoId] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [int] NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Precio] [real] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProdurctoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 01/12/2021 02:02:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[ProveedorId] [int] IDENTITY(1,1) NOT NULL,
	[Nit] [nvarchar](max) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/12/2021 02:02:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Identificador] [nvarchar](max) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Apellido] [nvarchar](max) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Fecha_nacimiento] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 01/12/2021 02:02:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[VentaId] [int] IDENTITY(1,1) NOT NULL,
	[FechaVenta] [datetime2](7) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Total] [float] NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[VentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211130214531_v1.0', N'5.0.9')
GO
SET IDENTITY_INSERT [dbo].[Compra] ON 

INSERT [dbo].[Compra] ([CompraId], [FechaCompra], [Cantidad], [Precio], [ProductoId], [ProveedorId]) VALUES (1, CAST(N'2020-10-20T00:00:00.0000000' AS DateTime2), 3, 15000, 2, 1)
INSERT [dbo].[Compra] ([CompraId], [FechaCompra], [Cantidad], [Precio], [ProductoId], [ProveedorId]) VALUES (3, CAST(N'2020-10-20T00:00:00.0000000' AS DateTime2), 3, 15000, 3, 2)
INSERT [dbo].[Compra] ([CompraId], [FechaCompra], [Cantidad], [Precio], [ProductoId], [ProveedorId]) VALUES (4, CAST(N'2021-12-01T12:38:43.7162625' AS DateTime2), 10, 15000, 3, 2)
INSERT [dbo].[Compra] ([CompraId], [FechaCompra], [Cantidad], [Precio], [ProductoId], [ProveedorId]) VALUES (5, CAST(N'2021-12-01T13:56:58.3888140' AS DateTime2), 2, 25300, 2, 2)
INSERT [dbo].[Compra] ([CompraId], [FechaCompra], [Cantidad], [Precio], [ProductoId], [ProveedorId]) VALUES (6, CAST(N'2021-12-01T13:58:43.3879840' AS DateTime2), 8, 69000, 2, 2)
SET IDENTITY_INSERT [dbo].[Compra] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([ProdurctoId], [SKU], [Nombre], [Precio], [Stock]) VALUES (1, 252055, N'cama', 2500000, 2)
INSERT [dbo].[Producto] ([ProdurctoId], [SKU], [Nombre], [Precio], [Stock]) VALUES (2, 233020, N'almohada', 350000, 11)
INSERT [dbo].[Producto] ([ProdurctoId], [SKU], [Nombre], [Precio], [Stock]) VALUES (3, 50, N'mouse', 25000, 13)
INSERT [dbo].[Producto] ([ProdurctoId], [SKU], [Nombre], [Precio], [Stock]) VALUES (4, 36006, N'zaptos', 0, 0)
INSERT [dbo].[Producto] ([ProdurctoId], [SKU], [Nombre], [Precio], [Stock]) VALUES (5, 5656, N'zapatillas', 0, 0)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([ProveedorId], [Nit], [Nombre], [Correo]) VALUES (1, N'9999995565', N'more products', N'produc@core.com')
INSERT [dbo].[Proveedor] ([ProveedorId], [Nit], [Nombre], [Correo]) VALUES (2, N'25555', N'sika', N'sika@coreo')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Identificador], [Nombre], [Apellido], [Correo], [Fecha_nacimiento]) VALUES (8, N'1010101', N'peimero', N'sanchez', N'perim@corero', CAST(N'2021-11-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[User] ([UserId], [Identificador], [Nombre], [Apellido], [Correo], [Fecha_nacimiento]) VALUES (9, N'1251255', N'camila', N'toro', N'toro@corero', CAST(N'2021-11-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[User] ([UserId], [Identificador], [Nombre], [Apellido], [Correo], [Fecha_nacimiento]) VALUES (10, N'666666', N'camila', N'sanchez', N'cami@corero', CAST(N'2021-11-24T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[User] ([UserId], [Identificador], [Nombre], [Apellido], [Correo], [Fecha_nacimiento]) VALUES (14, N'3111311', N'samanta', N'sama', N'sam@cre.com', CAST(N'2021-11-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[User] ([UserId], [Identificador], [Nombre], [Apellido], [Correo], [Fecha_nacimiento]) VALUES (15, N'1616616', N'nuevo ', N'nuevo 15', N'dato@corer.com', CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[User] ([UserId], [Identificador], [Nombre], [Apellido], [Correo], [Fecha_nacimiento]) VALUES (16, N'19191919', N'nuevo 18', N'18 ultimo', N'ultimo@corer.co', CAST(N'2021-12-23T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Compra_ProductoId]    Script Date: 01/12/2021 02:02:52 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Compra_ProductoId] ON [dbo].[Compra]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Compra_ProveedorId]    Script Date: 01/12/2021 02:02:52 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Compra_ProveedorId] ON [dbo].[Compra]
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Venta_ProductoId]    Script Date: 01/12/2021 02:02:52 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Venta_ProductoId] ON [dbo].[Venta]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Venta_UserId]    Script Date: 01/12/2021 02:02:52 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Venta_UserId] ON [dbo].[Venta]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProdurctoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Producto_ProductoId]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Proveedor_ProveedorId] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedor] ([ProveedorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Proveedor_ProveedorId]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProdurctoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Producto_ProductoId]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [mi_tienda_Db] SET  READ_WRITE 
GO
