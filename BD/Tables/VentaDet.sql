USE [VentasBD]
GO

/****** Object:  Table [dbo].[VentaDet]    Script Date: 19/07/2025 02:55:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VentaDet](
	[Id_VentaDet] [int] IDENTITY(1,1) NOT NULL,
	[Id_VentaCab] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Igv] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_VentaDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VentaDet]  WITH CHECK ADD FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Productos] ([Id_producto])
GO

ALTER TABLE [dbo].[VentaDet]  WITH CHECK ADD FOREIGN KEY([Id_VentaCab])
REFERENCES [dbo].[Ventacab] ([Id_VentaCab])
GO


