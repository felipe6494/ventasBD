USE [VentasBD]
GO

/****** Object:  StoredProcedure [dbo].[usp_Actualizar_Producto]    Script Date: 19/07/2025 02:48:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Actualizar_Producto]
@Id_producto int,
@NroLote varchar(50),
@Costo decimal(18,2),
@PrecioVenta decimal(18,2)
as
BEGIN
declare @Fec_registro datetime = getdate(),@CodigoRespuesta int 
 BEGIN TRY  
   BEGIN TRANSACTION  
  update Productos set NroLote=@NroLote,Costo=@Costo,PrecioVenta=@PrecioVenta where Id_producto=@Id_producto
   set @CodigoRespuesta=1

   COMMIT TRANSACTION  
  END TRY  
  BEGIN CATCH  
   IF @@TRANCOUNT > 0  
   BEGIN  
    ROLLBACK TRANSACTION  
  select -1 as CodigoRespuesta
		,ERROR_NUMBER()+'-'+ERROR_LINE()+'-'+ERROR_MESSAGE() AS MensajeRespuesta   
 
   END  
  END CATCH  
 select  @CodigoRespuesta,'ok' as MensajeRespuesta
    
END
GO


