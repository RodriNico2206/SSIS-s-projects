CREATE DATABASE Stage
DROP DATABASE Stage
USE Stage

CREATE TABLE [dbo].[Empleados](
    [IdEmpleado] [INT] NOT NULL PRIMARY KEY,
    [Apellidos] [nvarchar](255) NULL,
    [Nombre] [nvarchar](255) NULL,
    [Cargo] [nvarchar](255) NULL,
    [Tratamiento] [nvarchar](255) NULL,
    [FechaNacimiento] [datetime] NULL,
    [FechaContratación] [datetime] NULL,
    [Dirección] [nvarchar](255) NULL,
    [Ciudad] [nvarchar](255) NULL,
    [Región] [nvarchar](255) NULL,
    [CódPostal] [nvarchar](255) NULL,
    [País] [nvarchar](255) NULL,
    [TelDomicilio] [nvarchar](255) NULL,
    [Extensión] [INT] NULL,
    [Foto] [nvarchar](255) NULL,
    [Notas] [nvarchar](max) NULL,
    [Jefe] [INT] NULL
)

CREATE TABLE [dbo].[Clientes](
    [IdCliente] [nvarchar](255) NOT NULL PRIMARY KEY,
    [NombreCompañía] [nvarchar](255) NULL,
    [NombreContacto] [nvarchar](255) NULL,
    [CargoContacto] [nvarchar](255) NULL,
    [Dirección] [nvarchar](255) NULL,
    [Ciudad] [nvarchar](255) NULL,
    [Región] [nvarchar](255) NULL,
    [CódPostal] [nvarchar](255) NULL,
    [País] [nvarchar](255) NULL,
    [Teléfono] [nvarchar](255) NULL,
    [Fax] [nvarchar](255) NULL
)

CREATE TABLE [dbo].[Proveedores](
    [IdProveedor] [INT] NOT NULL PRIMARY KEY,
    [NombreCompañía] [nvarchar](255) NULL,
    [NombreContacto] [nvarchar](255) NULL,
    [CargoContacto] [nvarchar](255) NULL,
    [Dirección] [nvarchar](255) NULL,
    [Ciudad] [nvarchar](255) NULL,
    [Región] [nvarchar](255) NULL,
    [CódPostal] [nvarchar](255) NULL,
    [País] [nvarchar](255) NULL,
    [Teléfono] [nvarchar](255) NULL,
    [Fax] [nvarchar](255) NULL,
    [PáginaPrincipal] [nvarchar](255) NULL
)

CREATE TABLE [dbo].[Compañias de envios](
    [IdCompañíaEnvíos] [INT] NOT NULL PRIMARY KEY,
    [NombreCompañía] [nvarchar](255) NULL,
    [Teléfono] [nvarchar](255) NULL
)

CREATE TABLE [dbo].[Productos](
    [IdProducto] [INT] NOT NULL PRIMARY KEY,
    [NombreProducto] [nvarchar](255) NULL,
    [IdProveedor] [INT] NOT NULL FOREIGN KEY REFERENCES [dbo].[Proveedores]([IdProveedor]),
    [CantidadPorUnidad] [nvarchar](255) NULL,
    [PrecioUnidad] [FLOAT] NULL,
    [UnidadesEnExistencia] [INT] NULL,
    [UnidadesEnPedido] [INT] NULL,
    [NivelNuevoPedido] [INT] NULL,
    [Suspendido] [bit] NULL
)

CREATE TABLE [dbo].[Pedidos](
    [IdPedido] [INT] NOT NULL PRIMARY KEY,
    [IdCliente] [nvarchar](255) NOT NULL FOREIGN KEY REFERENCES [dbo].[Clientes]([IdCliente]),
    [IdEmpleado] [INT] NOT NULL FOREIGN KEY REFERENCES [dbo].[Empleados]([IdEmpleado]),
    [FechaPedido] [datetime] NULL,
    [FechaEntrega] [datetime] NULL,
    [FechaEnvío] [datetime] NULL,
    [FormaEnvío] [INT] NULL,
    [Cargo] [FLOAT] NULL,
    [Destinatario] [nvarchar](255) NULL,
    [DirecciónDestinatario] [nvarchar](255) NULL,
    [CiudadDestinatario] [nvarchar](255) NULL,
    [RegiónDestinatario] [nvarchar](255) NULL,
    [CódPostalDestinatario] [nvarchar](255) NULL,
    [PaísDestinatario] [nvarchar](255) NULL
)

CREATE TABLE [dbo].[Detalle de pedidos](
    [IdPedido] [INT] FOREIGN KEY REFERENCES [dbo].[Pedidos]([IdPedido]) NOT NULL,
    [IdProducto] [INT] FOREIGN KEY REFERENCES [dbo].[Productos]([IdProducto]) NOT NULL,
    [PrecioUnidad] [FLOAT] NULL,
    [Cantidad] [INT] NULL,
    [Descuento] [FLOAT] NULL
)

TRUNCATE TABLE [Detalle de pedidos]
TRUNCATE TABLE [Pedidos]
TRUNCATE TABLE [Productos]
TRUNCATE TABLE [Compañias de envios]
TRUNCATE TABLE [Proveedores]
TRUNCATE TABLE [Clientes]
TRUNCATE TABLE [Empleados]