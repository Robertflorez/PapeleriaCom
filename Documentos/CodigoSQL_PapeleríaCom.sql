create database papeleria;
use papeleria;
create table cliente(
    idCliente int not null auto_increment,
    nombre varchar(45) not null,
    email varchar(45),
    telefono varchar(45),
    primary key(idCliente)
);

create table empleado(
	idEmpleado int not null auto_increment,
    nombre varchar(45) not null,
    telefono varchar(45) not null,
    direccion varchar(45),
    salario double,
    cargo varchar(45),
    primary key(idEmpleado)
);

create table proveedor(
	idProveedor int not null auto_increment,
    nombre varchar(45) not null,
    telefono varchar(45),
    direccion varchar(45),
    primary key(idProveedor)
);
create table tipoProducto(
	cod_tipoproducto int not null,
    nombre_tipo varchar(45),
    primary key(cod_tipoproducto)
);

create table producto(
	idProducto int not null auto_increment,
    descripcion varchar(50),
    valor double not null,
    tipo_producto int not null,
    primary key(idProducto),
    foreign key (tipo_producto) references tipoProducto(cod_tipoproducto)
);

create table detalle_venta(
	id_Venta int not null,
    idProducto int not null,
    cantidad int,
    primary key(id_Venta),
    foreign key (idProducto) references producto(idProducto)
);

create table venta(
	idVenta int not null,
    idEmpleado int not null,
    idCliente int not null,
    idProducto int not null,
    fecha_venta varchar(45) not null,
    primary key (idVenta),
    foreign key (idCliente) references cliente(idCliente),
    foreign key (idEmpleado) references empleado(idEmpleado),
    foreign key (idProducto) references producto(idProducto),
    foreign key (idVenta) references detalle_venta(id_Venta)
);

create table almacen(
    idProducto int not null,
    fecha_compra int not null,
    cantidad int not null,
    idProveedor int not null,
    foreign key (idProducto) references producto(idProducto),
    foreign key (idProveedor) references proveedor(idProveedor)
);






