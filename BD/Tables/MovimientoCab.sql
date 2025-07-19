USE [VentasBD]
GO

/****** Object:  Table [dbo].[MovimientoCab]    Script Date: 19/07/2025 02:54:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MovimientoCab](
	[Id_MovimientoCab] [int] IDENTITY(1,1) NOT NULL,
	[Fec_registro] [datetime] NULL,
	[Id_TipoMovimiento] [int] NOT NULL,
	[Id_DocumentoOrigen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_MovimientoCab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MovimientoCab] ADD  DEFAULT (getdate()) FOR [Fec_registro]
GO


