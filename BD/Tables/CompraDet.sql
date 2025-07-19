USE [VentasBD]
GO

/****** Object:  Table [dbo].[CompraDet]    Script Date: 19/07/2025 02:54:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompraDet](
	[Id_CompraDet] [int] IDENTITY(1,1) NOT NULL,
	[Id_CompraCab] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fec_registro] [datetime] NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Igv] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_CompraDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CompraDet] ADD  DEFAULT (getdate()) FOR [Fec_registro]
GO

ALTER TABLE [dbo].[CompraDet]  WITH CHECK ADD FOREIGN KEY([Id_CompraCab])
REFERENCES [dbo].[CompraCab] ([Id_CompraCab])
GO

ALTER TABLE [dbo].[CompraDet]  WITH CHECK ADD FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Productos] ([Id_producto])
GO


