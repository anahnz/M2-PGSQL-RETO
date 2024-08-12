-- Creacion de tablas
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    categoria VARCHAR(50)
);


CREATE TABLE carroCompras_productos (
    carrocompras_id SERIAL PRIMARY KEY,
	id_cliente INTEGER REFERENCES Clientes(cliente_id) NOT NULL,
    id_producto INTEGER REFERENCES productos(producto_id) NOT NULL,
    cantidad INT NOT NULL
);

CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES Clientes(cliente_id) NOT NULL,
    id_producto INTEGER REFERENCES productos(producto_id) NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);

CREATE TABLE reseñas (
    reseña_id SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES Clientes(cliente_id) NOT NULL,
    id_producto INTEGER REFERENCES productos(producto_id) NOT NULL,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lista_deseos (
    lista_id SERIAL PRIMARY KEY,
	id_cliente INTEGER REFERENCES Clientes(cliente_id) NOT NULL,
    id_producto INTEGER REFERENCES productos(producto_id) NOT NULL    
);
   
-- creacion de consultas

--Consultar el total de ventas por producto en un rango de fechas
SELECT p.nombre AS producto,
       SUM(pe.cantidad) AS cantidad_vendida,
       SUM(pe.precio * pe.cantidad) AS total_ventas
FROM pedidos pe
JOIN productos p ON pe.id_producto = p.producto_id
WHERE pe.fecha BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY p.nombre
ORDER BY total_ventas DESC;

--Obtener los productos con bajo stock
SELECT nombre AS producto,stock
FROM productos
WHERE stock < 10
ORDER BY stock ASC;

--Consultar el total de ingresos por estado del pedido
SELECT p.estado,SUM(p.precio * p.cantidad) AS ingresos_totales
FROM pedidos p
GROUP BY p.estado
ORDER BY ingresos_totales DESC;

-- PROCEDIMIENTOS
-- Procedimiento para Actualizar el Stock de un Producto

CREATE OR REPLACE function actualizar_stock(
    p_producto_id INT,
    p_cantidad INT
) returns void
AS $$
BEGIN
    UPDATE productos
    SET stock = stock + p_cantidad
    WHERE producto_id = p_producto_id;
    
    RAISE NOTICE 'Stock del producto % actualizado a %', p_producto_id, stock;
END;
$$ language plpgsql;

-- Procedimiento para Eliminar un Producto del Stock

CREATE OR REPLACE FUNCTION eliminar_producto(
    p_id_producto INT
) RETURNS VOID

AS $$
BEGIN
    DELETE FROM productos
    WHERE producto_id = p_id_producto;

    RAISE NOTICE 'Producto con ID % eliminado.', p_id_producto;
END;
$$ LANGUAGE plpgsql;

--FUNCIONES
-- Función para Calcular el Promedio de Calificaciones de un Producto

CREATE OR REPLACE FUNCTION promedio_calificacion_producto(
    p_id_producto INT
)
RETURNS DECIMAL(3, 2) AS $$
DECLARE
    v_promedio DECIMAL(3, 2);
BEGIN
    SELECT COALESCE(AVG(calificacion), 0)
    INTO v_promedio
    FROM reseñas
    WHERE id_producto = p_id_producto;

    RETURN v_promedio;
END;
$$ LANGUAGE plpgsql;

-- Función para Obtener el Stock Disponible de un Producto

CREATE OR REPLACE FUNCTION stock_disponible_producto(
    p_id_producto INT
)
RETURNS INT 
AS $$
DECLARE
    v_stock INT;
BEGIN
    SELECT COALESCE(stock, 0)
    INTO v_stock
    FROM productos
    WHERE producto_id = p_id_producto;

    RETURN v_stock;
END;
$$ LANGUAGE plpgsql;
