USE [VentasBD]
GO

/****** Object:  StoredProcedure [dbo].[usp_LISTAR_Compra]    Script Date: 19/07/2025 02:49:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- exec[dbo].[usp_LISTAR_Compra]1
CREATE PROCEDURE [dbo].[usp_LISTAR_Compra]
@Id_CompraCab int 
as
BEGIN

select  cab.Fec_registro,p.Nombre_producto,det.Cantidad,det.Precio,det.SubTotal,det.Igv,det.Total from Compracab cab inner join  CompraDet det on cab.Id_CompraCab=det.Id_CompraCab 
left join Productos p on p.Id_producto=det.Id_producto
where cab.Id_CompraCab=@Id_CompraCab




end 
GO


