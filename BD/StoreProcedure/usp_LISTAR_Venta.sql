USE [VentasBD]
GO

/****** Object:  StoredProcedure [dbo].[usp_LISTAR_Venta]    Script Date: 19/07/2025 02:50:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- exec[dbo].[usp_LISTAR_Compra]1
CREATE PROCEDURE [dbo].[usp_LISTAR_Venta]
@Id_VentaCab int 
as
BEGIN

select  cab.Fec_registro,p.Nombre_producto,det.Cantidad,det.Precio,det.SubTotal,det.Igv,det.Total from Ventacab cab inner join  VentaDet det on cab.Id_VentaCab=det.Id_VentaCab 
left join Productos p on p.Id_producto=det.Id_producto
where cab.Id_VentaCab=@Id_VentaCab




end 
GO


