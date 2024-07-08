create database if not exists TechStore;
use TechStore;
-- tabla Producto
create table Producto (
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar(50) NOT NULL,
descripcion TEXT,
precio DECIMAL (10,2) NOT NULL,
categoria VARCHAR (50),
stock_disponible INT CHECK (stock_disponible >= 0)
);
-- tabla Cliente
create table Cliente(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar(50) NOT NULL,
direccion text,
email varchar(200) NOT NULL UNIQUE,
telefono varchar(15)
);
-- tabla Pedido
create table Pedido(
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
fecha_pedido DATE NOT NULL,
estado_pedido ENUM ('pendiente','entregado') NOT NULL,
metodo_pago varchar(20),
foreign key (id_cliente) references Cliente(id_cliente)
);
-- tabla Detalle_Pedido
create table Detalle_Pedido(
id_detalle INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT,
id_producto INT,
cantidad INT CHECK (cantidad > 0),
precio_unit DECIMAL (10,2) NOT NULL,
foreign key (id_pedido) REFERENCES Pedido(id_pedido),
foreign key (id_producto) REFERENCES Producto (id_producto)
);
-- tabla Proveedores
create table Proveedores(
id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar (50) NOT NULL,
direccion text,
telefono varchar (15),
email varchar (100)
);
-- tabla Compras_Proveedor
create table Compras_Proveedor(
id_compra INT AUTO_INCREMENT PRIMARY KEY,
id_proveedor INT,
id_producto INT,
cantidad INT CHECK (cantidad > 0),
fecha_compra DATE NOT NULL,
foreign key (id_proveedor) REFERENCES Proveedores (id_proveedor),
foreign key (id_producto) REFERENCES Producto (id_producto)
);
-- tabla Inventario
create table Inventario (
id_inventario INT AUTO_INCREMENT PRIMARY KEY,
id_producto INT,
stock_actual INT CHECK (stock_actual >= 0),
entrada INT CHECK (entrada >= 0),
salida INT CHECK (salida >= 0),
foreign key (id_producto) REFERENCES Producto (id_producto)
);

-- Insercion de datos
-- Producto

INSERT INTO Producto (nombre, descripcion, precio, categoria, stock_disponible)
VALUES ('Laptop Lenovo','Laptop con procesador Intel Core i7','1200','Computadoras','15');

INSERT INTO Producto (nombre, descripcion, precio, categoria, stock_disponible)
VALUES ('PC de Escritorio Dell Inspiron 3671','Computadora de escritorio para uso doméstico',
'899','Computadora','10');

INSERT INTO Producto (nombre, descripcion, precio, categoria, stock_disponible)
VALUES ('iPhone 12 Pro','Smartphone Apple','1299','Smartphone','8');

INSERT INTO Producto (nombre, descripcion, precio, categoria, stock_disponible)
VALUES ('Samsung Galaxy S21','Smartphone Android','999','Smartphone','10');

INSERT INTO Producto (nombre, descripcion, precio, categoria, stock_disponible)
VALUES ('Mouse Logitech MX Master 3','Auriculares con cancelación de ruido','699','Electronica','6');

INSERT INTO Producto (nombre, descripcion, precio, categoria, stock_disponible)
VALUES ('Auriculares Bose QuietComfort 35 II','Auriculares con cancelación de ruido','599','Electronica','10');

-- Cliente
INSERT INTO Cliente (nombre, direccion, email, telefono)
VALUES ('Ana Lopez','Av.Rivadavia 234','analopez@gmail.com','1155678890');

INSERT INTO Cliente (nombre, direccion, email, telefono)
VALUES ('Martín Rodriguez','Av. Santa Fe 1345','martinrodriguezz@gmail.com','1167345678');

INSERT INTO Cliente (nombre, direccion, email, telefono)
VALUES ('Juan Martinez','Av.Cabildo 4567','juan_martinez@gmail.com','1123457890');

INSERT INTO Cliente (nombre, direccion, email, telefono)
VALUES ('Sofia Gomez','Av. Belgrano 1456','sofia_gomez@yahoo.com.ar','1154321098');

-- Pedido

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (1,'2024-03-10','entregado','tarjeta');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (2,'2024-03-12','pendiente','tarjeta');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (2,'2024-04-02','entregado','efectivo');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (3,'2024-05-14','entregado','efectivo');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (4,'2024-05-15','entregado','efectivo');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (4,'2024-05-29','pendiente','tarjeta');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (4,'2024-05-30','entregado','efectivo');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (1,'2024-05-30','pendiente','tarjeta');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (2,'2024-06-01','entregado','efectivo');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (3,'2024-06-03','entregado','efectivo');

INSERT INTO Pedido (id_cliente, fecha_pedido, estado_pedido, metodo_pago)
VALUES (3,'2024-06-12','pendiente','tarjeta');

-- Detalle pedido
INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (1,1,1,1200);

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (2,3,1,1299);

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (3,2,2,899);

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (4,1,1,1299);

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (5,1,3,1299);

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (6,4,1,999);

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (7,1,1,1200);

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (8,3,4,1299);

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (9,1,1,1200);

INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unit)
VALUES (10,6,1,599);

-- Proveedores
INSERT INTO Proveedores (nombre, direccion, telefono, email)
VALUES ('MegaTech.', 'Av.Maipu 2234', '115466789', 'info@megatech.com');

INSERT INTO Proveedores (nombre, contacto, direccion, telefono, email)
VALUES ('TecnoPro', 'Aguirre 456', '1124355778', 'ventas@tecno-pro.com');

-- Compras_proveedor
INSERT INTO Compras_Proveedor (id_proveedor, id_producto, cantidad, fecha_compra)
VALUES (1, 1, 5, '2024-03-01');

INSERT INTO Compras_Proveedor (id_proveedor, id_producto, cantidad, fecha_compra)
VALUES (1, 3, 3, '2024-05-05');

INSERT INTO Compras_Proveedor (id_proveedor, id_producto, cantidad, fecha_compra)
VALUES (1, 4, 10, '2024-06-05');

INSERT INTO Compras_Proveedor (id_proveedor, id_producto, cantidad, fecha_compra)
VALUES (2, 2, 2, '2024-03-10');

INSERT INTO Compras_Proveedor (id_proveedor, id_producto, cantidad, fecha_compra)
VALUES (2, 6,5 ,'2024-04-15');

-- Inventario
INSERT INTO Inventario (id_producto, entrada, salida, stock_actual)
VALUES (1, 5, 7, 15);

INSERT INTO Inventario (id_producto, entrada, salida, stock_actual)
VALUES (2, 2, 2, 10);

INSERT INTO Inventario (id_producto, entrada, salida, stock_actual)
VALUES (3, 3, 5, 8);

INSERT INTO Inventario (id_producto, entrada, salida, stock_actual)
VALUES (4, 10, 1, 10);

INSERT INTO Inventario (id_producto, entrada, salida, stock_actual)
VALUES (5, 0, 0, 6);

INSERT INTO Inventario (id_producto, entrada, salida, stock_actual)
VALUES (6, 5, 1, 10);

-- Consultas Sql 

-- Pedidos Mensuales
SELECT YEAR(fecha_pedido) AS Anio, MONTH(fecha_pedido) AS Mes, COUNT(*) AS Cantidad_pedidos
FROM Pedido
GROUP BY YEAR(fecha_pedido), MONTH(fecha_pedido)
ORDER BY Anio, Mes;

-- Articulo x mes
SELECT YEAR(P.fecha_pedido) AS Anio, MONTH(P.fecha_pedido) AS Mes, PR.nombre AS Articulo, SUM(DP.cantidad) AS Cantidad_pedida
FROM Pedido P
INNER JOIN Detalle_Pedido DP ON P.id_pedido = DP.id_pedido
INNER JOIN Producto PR ON DP.id_producto = PR.id_producto
GROUP BY YEAR(P.fecha_pedido), MONTH(P.fecha_pedido), PR.nombre
ORDER BY Anio, Mes, PR.nombre;

-- Ranking de artículos
SELECT PR.nombre AS Articulo, YEAR(P.fecha_pedido) AS Anio, MONTH(P.fecha_pedido) AS Mes, SUM(DP.cantidad) AS Cantidad_pedida
FROM Pedido P
INNER JOIN Detalle_Pedido DP ON P.id_pedido = DP.id_pedido
INNER JOIN Producto PR ON DP.id_producto = PR.id_producto
GROUP BY PR.nombre, YEAR(P.fecha_pedido), MONTH(P.fecha_pedido)
ORDER BY Cantidad_pedida DESC;

-- Clientes con más pedidos realizados
SELECT C.nombre AS Cliente, COUNT(*) AS Cantidad_pedidos -- count (id_cliente)
FROM Cliente C
LEFT JOIN Pedido P ON C.id_cliente = P.id_cliente
GROUP BY C.nombre
ORDER BY Cantidad_pedidos DESC;

-- Ingresos por mes
SELECT YEAR(fecha_pedido) AS Anio, MONTH(fecha_pedido) AS Mes, SUM(DP.cantidad * DP.precio_unit) AS Ingreso_total
FROM Pedido P
INNER JOIN Detalle_Pedido DP ON P.id_pedido = DP.id_pedido
GROUP BY YEAR(fecha_pedido), MONTH(fecha_pedido)
ORDER BY Anio, Mes;

-- Productos con menor stock
SELECT nombre AS Producto, stock_disponible AS Stock_disponible
FROM Producto
WHERE stock_disponible < 10;

-- Pedidos pendientes
SELECT P.id_pedido AS Pedido, C.nombre AS Cliente, P.fecha_pedido AS Fecha_del_pedido
FROM Pedido P
INNER JOIN Cliente C ON P.id_cliente = C.id_cliente
WHERE P.estado_pedido = 'pendiente';

-- Producto más vendido
SELECT PR.categoria AS Categoria, PR.nombre AS Producto, SUM(DP.cantidad) AS Cantidad_vendida
FROM Pedido P
INNER JOIN Detalle_Pedido DP ON P.id_pedido = DP.id_pedido
INNER JOIN Producto PR ON DP.id_producto = PR.id_producto
GROUP BY PR.categoria, PR.nombre
ORDER BY PR.categoria, Cantidad_vendida DESC;

-- Proveedor con más productos suministrados
SELECT PV.nombre AS Proveedor, COUNT(*) AS Cantidad_productos_suministrados
FROM Proveedores PV
INNER JOIN Compras_Proveedor CP ON PV.id_proveedor = CP.id_proveedor
GROUP BY PV.nombre
ORDER BY Cantidad_productos_suministrados DESC;

-- Historial de compras del cliente id=4
SELECT P.id_pedido AS Pedido, P.fecha_pedido AS Fecha_del_pedido, P.estado_pedido AS Estado_del_pedido, SUM(DP.cantidad * DP.precio_unit) AS Total_del_pedido
FROM Pedido P
INNER JOIN Detalle_Pedido DP ON P.id_pedido = DP.id_pedido
WHERE P.id_cliente = 4
GROUP BY P.id_pedido, P.fecha_pedido, P.estado_pedido
ORDER BY P.fecha_pedido DESC;

SELECT * 
FROM Pedido P;
