USE [VentasBD]
GO

/****** Object:  StoredProcedure [dbo].[usp_Registrar_Producto]    Script Date: 19/07/2025 02:50:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Registrar_Producto]
@Nombre_producto varchar(250),
@NroLote varchar(50),
@Costo decimal(18,2),
@PrecioVenta decimal(18,2)
as
BEGIN
declare @Fec_registro datetime = getdate(),@CodigoRespuesta int 
 BEGIN TRY  
   BEGIN TRANSACTION  
   if not exists(select 1 from  Productos where Nombre_producto=@Nombre_producto and NroLote=@NroLote )
   begin
   insert into Productos(Nombre_producto,NroLote,Fec_registro,Costo,PrecioVenta,bActivo)
   values (@Nombre_producto,@NroLote,@Fec_registro,@Costo,@PrecioVenta,1)
   set @CodigoRespuesta=1
   end
   else set @CodigoRespuesta=0

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


