USE [VentasBD]
GO

/****** Object:  StoredProcedure [dbo].[usp_Registrar_CompraCab]    Script Date: 19/07/2025 02:50:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[usp_Registrar_CompraCab]
@SubTotal decimal(18,2),
@Igv decimal(18,2),
@Total decimal(18,2)
as
BEGIN
declare @Fec_registro datetime = getdate(),@Id_CompraCab int
 BEGIN TRY  
   BEGIN TRANSACTION  
    DECLARE  @p1 table (iCodigo int)  
   insert into CompraCab(Fec_registro,SubTotal,Igv,Total)
   OUTPUT Inserted.Id_CompraCab into @p1  
   values (@Fec_registro,@SubTotal,@Igv,@Total)
 select @Id_CompraCab = iCodigo from @p1 

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
 
     select @Id_CompraCab 
END
GO


