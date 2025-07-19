USE [VentasBD]
GO

/****** Object:  Table [dbo].[CompraCab]    Script Date: 19/07/2025 02:53:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompraCab](
	[Id_CompraCab] [int] IDENTITY(1,1) NOT NULL,
	[Fec_registro] [datetime] NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Igv] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_CompraCab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CompraCab] ADD  DEFAULT (getdate()) FOR [Fec_registro]
GO


