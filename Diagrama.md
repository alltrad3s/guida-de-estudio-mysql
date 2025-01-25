# Tienda de Ropa - Diagrama Entidad-Relación (ERD)

```mermaid
erDiagram
    productos {
        INT id PK
        VARCHAR nombre
        VARCHAR descripcion
        DECIMAL precio
        VARCHAR talla
        VARCHAR color
        INT cantidad_stock
    }
    clientes {
        INT id PK
        VARCHAR nombre
        VARCHAR direccion
        VARCHAR telefono
        VARCHAR correo_electronico
    }
    empleados {
        INT id PK
        VARCHAR nombre
        VARCHAR direccion
        VARCHAR telefono
        VARCHAR correo_electronico
        VARCHAR cargo
    }
    ventas {
        INT id PK
        DATE fecha
        INT cliente_id FK
        INT empleado_id FK
        DECIMAL precio_total
    }
    detalle_venta {
        INT venta_id PK,FK
        INT producto_id PK,FK
        INT cantidad
        DECIMAL precio_unitario
    }
    productos ||--o{ detalle_venta : "tiene"
    ventas ||--|{ detalle_venta : "contiene"
    clientes ||--o{ ventas : "realiza"
    empleados ||--o{ ventas : "gestiona"
