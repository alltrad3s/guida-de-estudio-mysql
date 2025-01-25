-- Base de datos para la tienda de ropa

CREATE DATABASE tienda_ropa;
USE tienda_ropa;

-- Tabla para almacenar información sobre los productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2) NOT NULL,
    talla VARCHAR(10) NOT NULL,
    color VARCHAR(50),
    cantidad_stock INT NOT NULL
);

-- Tabla para almacenar información sobre los clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo_electronico VARCHAR(100) UNIQUE
);

-- Tabla para almacenar información sobre los empleados
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo_electronico VARCHAR(100) UNIQUE,
    cargo VARCHAR(50)
);

-- Tabla para almacenar información sobre las ventas y suss las relaciones
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    cliente_id INT NOT NULL,
    empleado_id INT NOT NULL,
    precio_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id) ON DELETE CASCADE
);

-- Tabla para manejar multiple prductos por venta
CREATE TABLE detalle_venta (
    venta_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES ventas(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    PRIMARY KEY (venta_id, producto_id)
);
