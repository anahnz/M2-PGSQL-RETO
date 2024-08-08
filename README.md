# Reto final PostgreSQL
## Objetivo

Evaluar la comprensión y aplicación de los conocimientos adquiridos sobre PostgreSQL.

## Entrega

Se debe subir un archivo .sql con el script que da solución a lo siguiente:
- Creación de tablas, relaciones y cheks.
- 5 consultas que aporten valor al negocio.
- 5 procedimientos almacenados que aporten valor al negocio.
- 5 funciones que aporten valor al negocio.

## Enunciado

XYZ Store es una tienda en línea especializada en la venta de productos electrónicos y de consumo. La plataforma permite a los clientes navegar por una amplia gama de productos, realizar pedidos y gestionar sus cuentas de usuario. La base de datos de XYZ Store debe manejar información detallada sobre los productos, los clientes, los pedidos y las transacciones.

En XYZ Store, cada cliente tiene un perfil con su información personal, incluyendo nombre, apellido, dirección, teléfono, correo electrónico y fecha de registro. Los clientes pueden explorar el catálogo de productos, añadir productos a su carrito de compras, y realizar pedidos. Cada producto en el catálogo tiene atributos como el identificador del producto, nombre, descripción, precio, stock y categoría.

Cuando un cliente desea realizar una compra, selecciona productos y los añade a su carrito de compras. Al confirmar la compra, se genera un pedido que contiene información sobre los productos comprados, las cantidades, el precio total, y el estado del pedido (por ejemplo, procesando, enviado, entregado). Cada pedido está asociado a un cliente y puede contener múltiples productos. Los pedidos registran la fecha y hora en que se realizaron.

Los clientes pueden revisar sus pedidos pasados y realizar búsquedas de pedidos realizados en un periodo específico. La plataforma también permite a los clientes dejar reseñas y calificaciones para los productos que han comprado, proporcionando feedback a otros clientes y a la tienda. Cada reseña incluye la calificación, un comentario y la fecha en que se realizó.

Además, XYZ Store maneja una lista de deseos donde los clientes pueden guardar productos que les interesan para futuras compras. La lista de deseos de cada cliente puede contener múltiples productos y se actualiza según las preferencias del cliente.

La gestión del inventario es crucial para XYZ Store. Cuando se realiza una venta, el stock de los productos vendidos se actualiza automáticamente. Los clientes pueden consultar el stock actual de un producto antes de realizar una compra, y la tienda debe asegurarse de que la información de stock sea precisa y actualizada para evitar problemas de sobreventa.

XYZ Store valora la opinión de sus clientes y utiliza las calificaciones y comentarios dejados por los clientes para mejorar su servicio y la selección de productos. Los clientes pueden consultar las reseñas y calificaciones de un producto específico antes de tomar una decisión de compra, lo que les ayuda a tomar decisiones informadas basadas en las experiencias de otros usuarios.
