
DROP TABLE IF EXISTS pedidos CASCADE;
DROP TABLE IF EXISTS productos CASCADE;
DROP TABLE IF EXISTS categorias CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;


CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ============================================================
-- INSERCIÓN DE DATOS DE EJEMPLO POWERED BY CHATGPT
-- ============================================================

INSERT INTO clientes (nombre, ciudad) VALUES
('Juan Pérez', 'San Miguel'),
('María Gómez', 'Concepción'),
('Lucas Torres', 'Yerba Buena'),
('Ana Díaz', 'Concepción'),
('Pedro López', 'Monteros'),
('Sofía Romero', 'San Miguel');

INSERT INTO categorias (nombre) VALUES
('Electrónica'),
('Libros'),
('Ropa'),
('Hogar');

INSERT INTO productos (nombre, precio, id_categoria) VALUES
('Celular Samsung', 250.00, 1),
('Notebook HP', 750.00, 1),
('Camisa Blanca', 45.00, 3),
('Silla de Oficina', 120.00, 4),
('Libro SQL Fácil', 60.00, 2),
('Auriculares Bluetooth', 80.00, 1),
('Mesa de Madera', 300.00, 4),
('Zapatillas Deportivas', 150.00, 3),
('Lámpara LED', 90.00, NULL);  -- producto con categoría inválida

INSERT INTO pedidos (id_cliente, id_producto, cantidad, fecha) VALUES
(1, 1, 1, '2025-10-01'),
(2, 2, 1, '2025-10-02'),
(3, 5, 2, '2025-10-03'),
(2, 3, 3, '2025-10-05'),
(4, 4, 1, '2025-10-06'),
(5, 8, 2, '2025-10-08'),
(1, 6, 1, '2025-10-09');





