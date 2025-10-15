--nombre del cliente y id de los pedidos
 
SELECT c.nombre, p.id_pedido FROM clientes AS c
JOIN pedidos AS p ON c.id_cliente = p.id_cliente;

--nombre de productos y nombre de su categoria

SELECT pr.nombre AS producto, ca.nombre AS categoria FROM productos AS pr
JOIN categorias AS ca ON pr.id_categoria = ca.id_categoria;

--nombre del cliente, producto y cantidad para clientes de concepcion

SELECT c.nombre, pr.nombre AS producto, p.cantidad
FROM pedidos AS p
JOIN clientes AS c ON p.id_cliente = c.id_cliente
JOIN productos AS pr ON p.id_producto = pr.id_producto
WHERE c.ciudad = 'Concepción';

-- productos con precio mayor a 100 y su categoria

SELECT pr.nombre AS producto, ca.nombre AS categoria
FROM productos AS pr
JOIN categorias AS ca ON pr.id_categoria = ca.id_categoria
WHERE pr.precio > 100;

--todos los clientes y la fecha de su primer pedido 

SELECT c.nombre, MIN(p.fecha) AS primer_pedido
FROM clientes as c
LEFT JOIN pedidos as p ON c.id_cliente = p.id_cliente
GROUP BY c.nombre
ORDER BY primer_pedido;

--todas las categorías y los productos de ellas

SELECT ca.nombre AS categoria, pr.nombre AS producto
FROM categorias AS ca
LEFT JOIN productos pr ON ca.id_categoria = pr.id_categoria;

--cantidad de pedidos realizados por cliente 

SELECT c.nombre, COUNT(p.id_pedido) AS total_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id_cliente = p.id_cliente
GROUP BY c.nombre;

--nombre de todos los productos, precio y categoría

FROM productos AS pr
LEFT JOIN categorias AS ca ON pr.id_categoria = ca.id_categoria;

--clientes sin pedidos

SELECT c.nombre
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

-- productos sin categoria

SELECT pr.nombre, pr.id_categoria
FROM productos AS pr
LEFT JOIN categorias AS ca ON pr.id_categoria = ca.id_categoria
WHERE pr.id_categoria IS NOT NULL AND ca.id_categoria IS NULL;

--pedidos con la ciudad de cada uno de ellos

SELECT p.id_pedido, c.ciudad
FROM pedidos AS p
LEFT JOIN clientes AS c ON p.id_cliente = c.id_cliente;

--todas las categorias con sus productos

SELECT ca.nombre AS categoria, pr.nombre AS producto
FROM categorias AS ca
LEFT JOIN productos AS pr ON ca.id_categoria = pr.id_categoria;