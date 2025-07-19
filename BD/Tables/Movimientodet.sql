USE [VentasBD]
GO

/****** Object:  Table [dbo].[Movimientodet]    Script Date: 19/07/2025 02:55:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Movimientodet](
	[Id_MovimientoDet] [int] IDENTITY(1,1) NOT NULL,
	[Id_movimientocab] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_MovimientoDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Movimientodet]  WITH CHECK ADD FOREIGN KEY([Id_movimientocab])
REFERENCES [dbo].[MovimientoCab] ([Id_MovimientoCab])
GO

ALTER TABLE [dbo].[Movimientodet]  WITH CHECK ADD FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Productos] ([Id_producto])
GO


