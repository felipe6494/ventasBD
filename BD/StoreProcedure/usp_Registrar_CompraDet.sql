USE [VentasBD]
GO

/****** Object:  StoredProcedure [dbo].[usp_Registrar_CompraDet]    Script Date: 19/07/2025 02:50:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Registrar_CompraDet]
@Id_producto int,
@Id_CompraCab int,
@Cantidad int,
@Precio decimal(18,2),
@SubTotal decimal(18,2),
@Igv decimal(18,2),
@Total decimal(18,2)
as
BEGIN
declare @CodigoRespuesta int 
 BEGIN TRY  
   BEGIN TRANSACTION  
   insert into CompraDet(Id_CompraCab,Id_producto,Cantidad,Precio,SubTotal,Igv,Total)
 
   values (@Id_CompraCab,@Id_producto,@Cantidad,@Precio,@SubTotal,@Igv,@Total)

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


