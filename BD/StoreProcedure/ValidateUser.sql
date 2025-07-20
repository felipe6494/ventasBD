USE [VentasBD]
GO
/****** Object:  StoredProcedure [dbo].[usp_LISTAR_Venta]    Script Date: 20/07/2025 00:53:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec[dbo].[ValidateUser]'admin','1234'
create PROCEDURE [dbo].[ValidateUser]
@UserName varchar(100),
@password varchar(200)
as
BEGIN

select Id_User,Username,Password,FirstName,LastName from users 
where UserName=@UserName and password=CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', CONVERT(VARBINARY, @password)), 2)




end 
