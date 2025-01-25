# Base de Datos para Tienda de Ropa

## Estructura de la Base de Datos
La base de datos se compone de cinco tablas principales:

1. **Productos**:
   * Almacena información sobre los productos (nombre, descripción, precio, talla, color y cantidad en stock)

2. **Clientes**:
   * Contiene datos sobre los clientes (nombre, dirección, teléfono y correo electrónico)

3. **Empleados**:
   * Guarda información sobre los empleados (nombre, dirección, teléfono, correo electrónico y cargo)

4. **Ventas**:
   * Registra las ventas realizadas (fecha, cliente, empleado y precio total)

5. **Detalle_Venta**:
   * Almacena los productos incluidos en cada venta (producto, cantidad y precio unitario)

## Justificación del Diseño

* **Relaciones**:
   * Cada venta está vinculada a un cliente y un empleado que la gestiona
   * Se implementó una tabla `detalle_venta` para permitir múltiples productos por venta
   * Esta estructura permite un seguimiento detallado de cada transacción

* **Integridad Referencial**:
   * Uso de claves foráneas con `ON DELETE CASCADE` para mantener la consistencia de datos
   * La tabla `detalle_venta` usa una clave primaria compuesta para evitar duplicados

* **Mejoras**:
   * Se agregó la relación con empleados para rastrear quién gestiona cada venta
   * La separación entre `ventas` y `detalle_venta` permite un mejor manejo del inventario y reportes de ventas
