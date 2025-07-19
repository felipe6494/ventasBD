USE [VentasBD]
GO

/****** Object:  StoredProcedure [dbo].[usp_Registrar_Ventacab]    Script Date: 19/07/2025 02:51:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Registrar_Ventacab]
@SubTotal decimal(18,2),
@Igv decimal(18,2),
@Total decimal(18,2)
as
BEGIN
declare @Fec_registro datetime = getdate(),@Id_VentaCab int
 BEGIN TRY  
   BEGIN TRANSACTION  
    DECLARE  @p1 table (iCodigo int)  
   insert into Ventacab(Fec_registro,SubTotal,Igv,Total)
   OUTPUT Inserted.Id_VentaCab into @p1  
   values (@Fec_registro,@SubTotal,@Igv,@Total)
 select @Id_VentaCab = iCodigo from @p1 

   COMMIT TRANSACTION  
  END TRY  
  BEGIN CATCH  
   IF @@TRANCOUNT > 0  
   BEGIN  
    ROLLBACK TRANSACTION  
  select ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage; 
   END  
  END CATCH  
 
     select @Id_VentaCab 
END
GO


