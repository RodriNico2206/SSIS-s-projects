
CREATE TABLE [audit log] (
		PackageName VARCHAR(100),
		TaskName VARCHAR(100),
		RowsProcess INT,
		StartTime DATETIME,
		EndTime DATETIME,
		ErrorMessage VARCHAR(MAX)
)


SELECT * FROM [Stage].[dbo].[audit log]

/*
TRUNCATE TABLE [Stage].[dbo].[Clientes]
TRUNCATE TABLE [Stage].[dbo].[Compañia de envios]
TRUNCATE TABLE [Stage].[dbo].[Detalle de pedidos]
TRUNCATE TABLE [Stage].[dbo].[Empleados]
TRUNCATE TABLE [Stage].[dbo].[Fields calculated]
TRUNCATE TABLE [Stage].[dbo].[Merge Join Result]
TRUNCATE TABLE [Stage].[dbo].[Pedidos]
TRUNCATE TABLE [Stage].[dbo].[Productos]
TRUNCATE TABLE [Stage].[dbo].[Proveedores]
TRUNCATE TABLE [Stage].[dbo].[audit log]
TRUNCATE TABLE [Stage].[dbo].[Detalle de pedidos with changes]


"
INSERT INTO [audit log] (PackageName, TaskName, RowsProcess, StartTime, EndTime)
VALUES ("+ @[User::PackageName] +", "+ @[User::TaskName] +", "+ (DT_WSTR, 12)@[User::RowsProcessed] +", "+@[User::StartTime]+" ,"+ (DT_WSTR, 12)@[User::EndTime] +")
"

DECLARE @count1 INT, @count2 INT, @count3 INT, @count4 INT, @count5 INT, @count6 INT, @count7 INT,@Tot INT

SELECT @count1 = COUNT(*) FROM [Clientes]
SELECT @count2 = COUNT(*) FROM [Compañia de envios]
SELECT @count3 = COUNT(*) FROM [Detalle de pedidos]
SELECT @count4 = COUNT(*) FROM [Empleados]
SELECT @count5 = COUNT(*) FROM [Pedidos]
SELECT @count6 = COUNT(*) FROM [Productos]
SELECT @count7 = COUNT(*) FROM [Proveedores]

SELECT @Tot = @count1+@count2+@count3+@count4+@count5+@count6+@count7
PRINT(@Tot)
SELECT count = COUNT(*) FROM [Stage].[dbo].[Fields calculated]

INSERT INTO [audit log]
SELECT 'a', 'b', 0, GETDATE(), GETDATE(), null
SELECT @@IDENTITY

INSERT INTO [audit log] (PackageName, TaskName, RowsProcess, StartTime, EndTime)
VALUES ('a', 'b', 2, GETDATE(), GETDATE()+2)




CREATE TABLE [dbo].[Detalle de pedidos with changes](
	[IdPedido] [int] NULL,
	[IdProducto] [int] NULL,
	[IdCliente] [nvarchar](255) NULL,
	[FechaPedido] [datetime] NULL,
	[FechaEntrega] [datetime] NULL,
	[FechaEnvío] [datetime] NULL,
	[FormaEnvío] [int] NULL,
	[Cargo] [money] NULL,
	[Destinatario] [nvarchar](255) NULL,
	[DirecciónDestinatario] [nvarchar](255) NULL,
	[CiudadDestinatario] [nvarchar](255) NULL,
	[RegiónDestinatario] [nvarchar](255) NULL,
	[CódPostalDestinatario] [nvarchar](255) NULL,
	[PaísDestinatario] [nvarchar](255) NULL,
	[PrecioUnidad] [float] NULL,
	[Cantidad] [float] NULL,
	[Descuento] [float] NULL,
	[Total Pagado] [Float] NULL,
)


*/