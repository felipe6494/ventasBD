USE [VentasBD]
GO
/****** Object:  StoredProcedure [dbo].[usp_LISTAR_Kardex]    Script Date: 19/07/2025 19:42:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec[dbo].[usp_LISTAR_Movimientos]1
create PROCEDURE [dbo].[usp_LISTAR_Movimientos]
@Id_producto int 
as
BEGIN


select p.Id_producto ,cab.Fec_registro FecRegistro,case when Id_TipoMovimiento=1 then 'Entrada' else 'salida' end as TipoMovimiento,Cantidad

from  Productos p inner join  Movimientodet m on p.Id_producto=m.Id_producto
left join MovimientoCab cab on cab.Id_MovimientoCab=m.Id_movimientocab
where p.Id_producto=@Id_producto



end 
