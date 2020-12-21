select * from cliente;

insert into cliente(ID_CLIENTE, NOMBRE_CL, DIRECCION, TELEFONO, EMAIL) values
(1316666777,'Ramon Gonzales','Los Esteros',0995687485,'ramon123@gmail.com'),
(1315555588,'Antonio Barcia','La Fabril',0962541484,'antbar99@gmail.com'),
(1306830521,'Julian Rodriguez','Manta 2000',099584155,'jj1990234@hotmail.com'),
(1316579823,'Monica Arcentales','Los Gavilanes',0996154548,'monica2345@gmail.com'),
(0801554545,'Luis Cedeño','Av. Universitaria',0958844488,'lucho23490@gmail.com'),
(1314201121,'Andres Zambrano','Av. 10 calle 13',0968549595,'andreszam1994@gmail.com'),
(1318745823,'Maria Gomez','Santa Martha',0969145878,'marisolg12@gmail.com'),
(1316820031,'Yolanda Briones','Via San Mateo',0998420147,'yolibriones99@hotmail.com'),
(1315648203,'Jose Perez','Tarqui',0958412211,'jose55555@gmail.com'),
(1314487474,'Yandry Delgado','San Pedro',0995841511,'yandry1996tt@hotmail.com'),
(1314725836,'Ariel Cagua','Calle 12 Av. 25',0994876389,'ariel5593@gmail.com'),
(1316935839,'Yelena Zamora','San Mateo',0965874455,'yelez1995@gmail.com')
(1317696936,'Virginia Bravo','La Fragata',0968582157,'virginia234@gmail.com');

SELECT * FROM TIPO_DE_PAGO;

insert into tipo_de_pago (id_tipopago, nombre_tp) values
(1,'Efectivo'),
(2,'Tarjeta de Credito');

select * from categoria;

insert into categoria(id_categoria, descripcion) values
(1,'Primera necesidad Consumo'),
(2,'Aseo personal'),
(3,'Mantenimiento y limpieza'),
(4,'M. de cocina');

select * from producto;

insert into producto(id_producto, id_categoria, nombre_pro, precio, stock) values
(1,1,'Manzanas',0.25,50),
(2,1,'Peras',0.40,30),
(3,1,'Limones',0.10,500),
(4,1,'Sandias',2.00,20),
(5,1,'Papas xlb',0.50,300),
(6,1,'Tomate xlb',0.50,100),
(7,1,'Cebolla colorada xlb',0.60,100),
(8,1,'Pimiento xlb',0.50,100),
(9,1,'Arroz xlb',0.60,500),
(10,1,'Azucar xlb',0.70,300),
(11,2,'Jabon Palmolive',0.80,50),
(12,2,'Antitranspirante Axe',2.25,30),
(13,2,'Pasta de diente Colgate',1.25,50),
(14,3,'Lava Vajilla Axion',1.25,50),
(15,3,'Cloro Axion',2.25,50),
(16,4,'Cerbilletas 100u',1.25,30),
(17,4,'Vandeja 5ltr',3.00,20);

select * from factura;

insert into factura(id_factura, id_cliente, fecha) values
(1,1315555588,'10/12/2020'),
(2,1316666777,'11/12/2020'),
(3,1316579823,'12/12/2020');

select * from detalle;

insert into detalle(id_detalle, id_factura, id_producto, cantidad, valor_total) values
(1,1,6,2,1),
(2,1,9,5,3),
(3,2,5,1,0.50),
(4,2,10,2,1.40),
(5,3,13,1,1.25);

select * from pago;

insert into pago(id_pago, id_cliente, id_factura, id_tipopago, fecha_pago, monto_pago) values
(1,1315555588,1,1,'10/12/2020',4),
(2,1316666777,2,2,'11/12/2020',1.90),
(3,1316579823,3,1,'12/12/2020',1.25);

select count (*)
from factura;

select nombre_pro from detalle
Inner Join producto
On detalle.id_producto = producto.id_producto
ORDER BY cantidad DESC LIMIT 1;

select nombre_cl from cliente
Inner Join pago
On cliente.id_cliente = pago.id_cliente
Where monto_pago = (Select MAX(monto_pago) from pago);

select fecha_pago, SUM(COALESCE(monto_pago)) as totalventa
from pago
group by fecha_pago
order by fecha_pago;
