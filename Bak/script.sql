USE [master]
GO
/****** Object:  Database [AES_SOBS_PS]    Script Date: 24/04/2020 18:37:55 ******/
CREATE DATABASE [AES_SOBS_PS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AES_SOBS_PS', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AES_SOBS_PS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AES_SOBS_PS_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AES_SOBS_PS_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AES_SOBS_PS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AES_SOBS_PS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AES_SOBS_PS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET ARITHABORT OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AES_SOBS_PS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AES_SOBS_PS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AES_SOBS_PS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AES_SOBS_PS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AES_SOBS_PS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AES_SOBS_PS] SET  MULTI_USER 
GO
ALTER DATABASE [AES_SOBS_PS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AES_SOBS_PS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AES_SOBS_PS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AES_SOBS_PS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [AES_SOBS_PS]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 24/04/2020 18:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[NombreServicio] [varchar](150) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cotizacion]    Script Date: 24/04/2020 18:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cotizacion](
	[IdCotizacion] [int] IDENTITY(1,1) NOT NULL,
	[FechaCotizacion] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Referencia] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Procesada] [bit] NULL,
 CONSTRAINT [PK_Cotizacion] PRIMARY KEY CLUSTERED 
(
	[IdCotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 24/04/2020 18:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Precio] [float] NULL,
	[Imagen] [varchar](200) NULL,
	[Cantidad] [int] NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[IdCategoria] [int] NULL,
	[IdUsuario] [int] NULL,
	[TipoProducto] [bit] NULL,
	[Descripcion] [varchar](100) NULL,
	[ReferenciaProductoProveedor] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RespuestaCotizacion]    Script Date: 24/04/2020 18:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RespuestaCotizacion](
	[IdRespuestaCotizacion] [int] IDENTITY(1,1) NOT NULL,
	[FechaRespuesta] [datetime] NULL,
	[DisponibilidadInmediata] [bit] NULL,
	[FechaDisponibilidad] [datetime] NULL,
	[Descripcion] [varchar](5000) NULL,
	[CantidadDisponible] [int] NULL,
	[IdCotizacion] [int] NOT NULL,
	[Precio] [float] NULL,
 CONSTRAINT [PK_RespuestaCotizacion] PRIMARY KEY CLUSTERED 
(
	[IdRespuestaCotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 24/04/2020 18:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](20) NOT NULL,
	[Descripcion] [varchar](300) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TokenUser]    Script Date: 24/04/2020 18:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TokenUser](
	[IdToken] [int] IDENTITY(1,1) NOT NULL,
	[Token] [varchar](500) NOT NULL,
	[SignToken] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[IdUser] [int] NOT NULL,
 CONSTRAINT [PK_TokenUser] PRIMARY KEY CLUSTERED 
(
	[IdToken] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24/04/2020 18:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Identificacion] [varchar](12) NULL,
	[Password] [varchar](200) NULL,
	[IdRol] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[SistemaDeCotizacion] [bit] NOT NULL,
	[TokenMedio] [varchar](500) NULL,
	[Contacto] [varchar](50) NULL,
	[NombreSuscripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vista]    Script Date: 24/04/2020 18:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vista](
	[IdVista] [int] IDENTITY(1,1) NOT NULL,
	[Route] [varchar](100) NULL,
	[component_class] [varchar](50) NULL,
	[component_name] [varchar](50) NULL,
	[Activa] [bit] NULL,
	[IdRol] [int] NOT NULL,
 CONSTRAINT [PK_Vista] PRIMARY KEY CLUSTERED 
(
	[IdVista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (1, N'Accesorios para Vehículos', N'Todo tipo de accesorios para carros, motos, bicicletas, camiones, buses, etc', N'accesorios_para_vehiculos')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (2, N'Belleza', N'Artículos para belleza como perfumería, joyería, maquillaje, etc', N'belleza')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (3, N'Deportes', N'Elementos para practicar deportes, vestuario, calzado, accesorios, etc', N'deportes')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (4, N'Educación', N'Elementos y accesorios para edudcación, Libros, Cuadernos, Maletines, uniformes, lapices, etc', N'educacion')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (5, N'Electrodomésticos', N'Aparatos electrónicos de apoyo para el hogar, neveras, lavadoras, estufas, planchas, cafeteras, etc.', N'electrodomesticos')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (6, N'Ferretería', N'Elementos y servicios de ferretería, puntillas, alambre, cemento, bizagras, etc.', N'ferreteria')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (8, N'Hogar', N'Accesorios para el hogar, Muebles, Cortinas, Tenidos, Accesorios de cocina,  accesorios de baño, etc', N'hogar')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (10, N'Juguetes', N'Juguetes y entretenimiento para bebés, niños, adolecentes', N'juguetes')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (11, N'Moda', N'Ropa, Zapatos, Accesorios, etc', N'moda')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (12, N'Salud', N'Elementos para apoyar la salud como, equipos de cavitación, activadores sanguineos, lipolaser, etc', N'salud')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (13, N'Servicios', N'Clases, Cursos, Turismo, Seguridad, Transporte, Organización de Eventos, etc', N'servicios')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (14, N'Tecnología', N'Elementos de Tecnología, Celulares, TV, Portatiles, etc', N'tecnologia')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (15, N'Video Juegos', N'Consolas, Video Juegos y Accesorios', N'video_juegos')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion], [NombreServicio]) VALUES (16, N'Otros', N'Categoría no indexada', N'otros')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [NombreRol], [Descripcion]) VALUES (1, N'Proveedor', N'Oferta en Cotizaciones')
INSERT [dbo].[Rol] ([IdRol], [NombreRol], [Descripcion]) VALUES (2, N'Cliente', N'Inscribe Cotizaciones')
INSERT [dbo].[Rol] ([IdRol], [NombreRol], [Descripcion]) VALUES (3, N'Administrador', N'Administración del sistema')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TokenUse__A9D105343FD1B15A]    Script Date: 24/04/2020 18:37:55 ******/
ALTER TABLE [dbo].[TokenUser] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Usuario__A9D10534BA41D9F3]    Script Date: 24/04/2020 18:37:55 ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [UQ__Usuario__A9D10534BA41D9F3] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cotizacion] ADD  CONSTRAINT [DF_Cotizacion_Referencia]  DEFAULT (((((0)-(0))-(0))-(0))-(0.)) FOR [Referencia]
GO
ALTER TABLE [dbo].[Cotizacion] ADD  CONSTRAINT [DF_Cotizacion_Cantidad]  DEFAULT ((0)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[Cotizacion] ADD  CONSTRAINT [DF_Cotizacion_Procesada]  DEFAULT ((0)) FOR [Procesada]
GO
ALTER TABLE [dbo].[TokenUser] ADD  CONSTRAINT [DF_TokenUser_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Activo]  DEFAULT ((0)) FOR [Activo]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_SistemaDeCotizacion]  DEFAULT ((0)) FOR [SistemaDeCotizacion]
GO
ALTER TABLE [dbo].[Vista] ADD  CONSTRAINT [DF_Vista_Route]  DEFAULT ('/Error') FOR [Route]
GO
ALTER TABLE [dbo].[Vista] ADD  CONSTRAINT [DF_Vista_Activa]  DEFAULT ((0)) FOR [Activa]
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_Cotizacion_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Cotizacion] CHECK CONSTRAINT [FK_Cotizacion_Producto]
GO
ALTER TABLE [dbo].[Cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_Cotizacion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Cotizacion] CHECK CONSTRAINT [FK_Cotizacion_Usuario]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Usuario]
GO
ALTER TABLE [dbo].[RespuestaCotizacion]  WITH CHECK ADD  CONSTRAINT [FK_RespuestaCotizacion_Cotizacion] FOREIGN KEY([IdCotizacion])
REFERENCES [dbo].[Cotizacion] ([IdCotizacion])
GO
ALTER TABLE [dbo].[RespuestaCotizacion] CHECK CONSTRAINT [FK_RespuestaCotizacion_Cotizacion]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
ALTER TABLE [dbo].[Vista]  WITH CHECK ADD  CONSTRAINT [FK_Vista_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Vista] CHECK CONSTRAINT [FK_Vista_Rol]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(número de cotizacion) Valor que toma la cotización para unificarla a un instante donde una cotizacion tendrá varios productosy un mismo usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cotizacion', @level2type=N'COLUMN',@level2name=N'Referencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Determina el tipo de prodcuto, si es producto o servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'TipoProducto'
GO
USE [master]
GO
ALTER DATABASE [AES_SOBS_PS] SET  READ_WRITE 
GO
