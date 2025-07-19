USE [VentasBD]
GO

/****** Object:  Trigger [dbo].[VentaDet_I_TRIGGER]    Script Date: 19/07/2025 02:53:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create TRIGGER [dbo].[VentaDet_I_TRIGGER]
ON [dbo].[VentaDet]
AFTER INSERT
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
declare @Id_VentaCab int,@Id_movimientocab int
DECLARE  @p1 table (iCodigo int)  
select @Id_VentaCab=Id_VentaCab
FROM inserted X;
if not exists (select 1 from [dbo].[MovimientoCab]where  Id_DocumentoOrigen=@Id_VentaCab and Id_TipoMovimiento=2)
begin
INSERT INTO [dbo].[MovimientoCab](Fec_registro,	Id_TipoMovimiento,	Id_DocumentoOrigen)
OUTPUT Inserted.Id_movimientocab into @p1  
SELECT
GETDATE(),2,@Id_VentaCab
FROM inserted X;

select @Id_movimientocab = iCodigo from @p1 
end 
else
	begin
	select @Id_movimientocab=Id_movimientocab from  [dbo].[MovimientoCab]  where Id_DocumentoOrigen=@Id_VentaCab and Id_TipoMovimiento=2
	end

INSERT INTO [dbo].[Movimientodet](Id_movimientocab	,Id_producto,	Cantidad)
SELECT @Id_movimientocab,x.Id_producto,x.Cantidad FROM inserted X;


END
GO

ALTER TABLE [dbo].[VentaDet] ENABLE TRIGGER [VentaDet_I_TRIGGER]
GO


