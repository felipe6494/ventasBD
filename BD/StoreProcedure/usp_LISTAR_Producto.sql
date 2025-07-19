USE [VentasBD]
GO

/****** Object:  StoredProcedure [dbo].[usp_LISTAR_Producto]    Script Date: 19/07/2025 02:49:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[usp_LISTAR_Producto]
@Id_producto int 
as
BEGIN

 select Nombre_producto,NroLote,Fec_registro,Costo,PrecioVenta from Productos where Id_producto= @Id_producto and bActivo=1 

end 
GO


