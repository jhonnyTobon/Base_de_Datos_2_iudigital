
-- create database

CREATE DATABASE jardineria_stg

--  definition tables

CREATE TABLE jardineria_stg.cliente_stg (
  ID_cliente int NOT NULL,
  nombre_cliente varchar(50) NOT NULL,
  nombre_contacto varchar(30) DEFAULT NULL,
  apellido_contacto varchar(30) DEFAULT NULL,
  telefono varchar(15) NOT NULL,
  linea_direccion1 varchar(50) NOT NULL,
  ciudad varchar(50) NOT NULL,
  pais varchar(50) DEFAULT NULL,
  codigo_postal varchar(10) DEFAULT NULL,
  PRIMARY KEY (ID_cliente)
);


CREATE TABLE jardineria_stg.pago_stg (
  ID_pago int NOT NULL,
  ID_cliente int NOT NULL,
  forma_pago varchar(40) NOT NULL,
  id_transaccion varchar(50) NOT NULL,
  fecha_pago date NOT NULL,
  total decimal(15,2) NOT NULL,
  PRIMARY KEY (ID_pago),
  CONSTRAINT pago_stg_ibfk_1 FOREIGN KEY (ID_cliente) REFERENCES cliente_stg (ID_cliente)
);



CREATE TABLE jardineria_stg.pedido_stg (
  ID_pedido int NOT NULL,
  fecha_pedido date NOT NULL,
  ID_cliente int NOT NULL,
  PRIMARY KEY (ID_pedido),
  CONSTRAINT pedido_stg_ibfk_1 FOREIGN KEY (ID_cliente) REFERENCES cliente_stg (ID_cliente)
);



CREATE TABLE jardineria_stg.producto_stg (
  ID_producto int NOT NULL,
  CodigoProducto varchar(15) NOT NULL,
  nombre varchar(70) NOT NULL,
  descripcion text,
  cantidad_en_stock smallint NOT NULL,
  precio_venta decimal(15,2) NOT NULL,
  precio_proveedor decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (ID_producto)
);

CREATE TABLE jardineria_stg.detalle_pedido_stg (
  ID_detalle_pedido int NOT NULL,
  ID_pedido int NOT NULL,
  ID_producto int NOT NULL,
  cantidad int NOT NULL,
  precio_unidad decimal(15,2) NOT NULL,
  PRIMARY KEY (ID_detalle_pedido),
  CONSTRAINT detalle_pedido_stg_ibfk_1 FOREIGN KEY (ID_pedido) REFERENCES pedido_stg (ID_pedido),
  CONSTRAINT detalle_pedido_stg_ibfk_2 FOREIGN KEY (ID_producto) REFERENCES producto_stg (ID_producto)
);


insert into jardineria_stg.cliente_stg (ID_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, linea_direccion1, ciudad,  pais, codigo_postal)
SELECT ID_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, linea_direccion1, ciudad,  pais, codigo_postal
FROM jardineria.cliente;

insert into jardineria_stg.pago_stg (ID_pago, ID_cliente, forma_pago, id_transaccion, fecha_pago, total)
SELECT ID_pago, ID_cliente, forma_pago, id_transaccion, fecha_pago, total
FROM jardineria.pago;

insert into jardineria_stg.pedido_stg (ID_pedido, fecha_pedido,ID_cliente)
SELECT ID_pedido, fecha_pedido,ID_cliente
FROM jardineria.pedido;

insert into jardineria_stg.producto_stg (ID_producto, CodigoProducto, nombre, descripcion, cantidad_en_stock, precio_venta, precio_proveedor)
SELECT ID_producto, CodigoProducto, nombre, descripcion, cantidad_en_stock, precio_venta, precio_proveedor
FROM jardineria.producto;

insert into jardineria_stg.detalle_pedido_stg (ID_detalle_pedido, ID_pedido, ID_producto, cantidad, precio_unidad)
SELECT ID_detalle_pedido, ID_pedido, ID_producto, cantidad, precio_unidad
FROM jardineria.detalle_pedido;

select COUNT(0) from jardineria_stg.pedido_stg 
select COUNT(0) from jardineria.pedido

select count(0) from jardineria_stg.cliente_stg
select count(0) from jardineria.cliente

select count(0) from jardineria_stg.pago_stg
select count(0) from jardineria.pago

select count(0) from jardineria_stg.producto_stg
select count(0) from jardineria.producto

select count(0) from jardineria_stg.detalle_pedido_stg
select count(0) from jardineria.detalle_pedido



