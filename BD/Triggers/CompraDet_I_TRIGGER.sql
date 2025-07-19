USE [VentasBD]
GO

/****** Object:  Trigger [dbo].[CompraDet_I_TRIGGER]    Script Date: 19/07/2025 02:52:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[CompraDet_I_TRIGGER]
ON [dbo].[CompraDet]
AFTER INSERT
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
declare @Id_CompraCab int,@Id_movimientocab int
DECLARE  @p1 table (iCodigo int)  
select @Id_CompraCab=Id_CompraCab
FROM inserted X;
if not exists (select 1 from [dbo].[MovimientoCab]where  Id_DocumentoOrigen=@Id_CompraCab and Id_TipoMovimiento=1)
begin
INSERT INTO [dbo].[MovimientoCab](Fec_registro,	Id_TipoMovimiento,	Id_DocumentoOrigen)
OUTPUT Inserted.Id_movimientocab into @p1  
SELECT
X.Fec_registro,1,@Id_CompraCab
FROM inserted X;

select @Id_movimientocab = iCodigo from @p1 
end 
else
	begin
	select @Id_movimientocab=Id_movimientocab from  [dbo].[MovimientoCab]  where Id_DocumentoOrigen=@Id_CompraCab and Id_TipoMovimiento=1
	end

INSERT INTO [dbo].[Movimientodet](Id_movimientocab	,Id_producto,	Cantidad)
SELECT @Id_movimientocab,x.Id_producto,x.Cantidad FROM inserted X;


END
GO

ALTER TABLE [dbo].[CompraDet] ENABLE TRIGGER [CompraDet_I_TRIGGER]
GO


