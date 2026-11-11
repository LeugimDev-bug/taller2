/* INT e INTEGER son lo mismo*/

show databases;

create database MareaAlta;

use MareaAlta;

create table hogar(
    id_hogar int auto_increment primary key,
    persona_contacto varchar(100) not null,
    cantidad_personas int not null,
    condicion_prioridad varchar(255),
    tipo_zona varchar(20) not null,
    division_territorial varchar(100) not null,
    referencia_ubicacion varchar (255)
);

create table necesidad(
    id_necesidad int auto_increment primary key,
    categoria varchar(50) not null unique
);

create table reporte_necesidad(
    id_reporte_necesidad int auto_increment primary key,
    id_hogar int,
    foreign key (id_hogar) references hogar(id_hogar),
    id_necesidad int,
    foreign key (id_necesidad) references necesidad(id_necesidad),
    urgencia varchar (20) not null,
    cantidad_estimada int,
    estado varchar(20) not null, 
    observacion varchar (255),
    fecha_reporte deltatime not null
);

create table punto_atencion(
    id_punto_atencion int auto_increment primary key,
    nombre varchar (100) not null,
    tipo_zona varchar (50) not null
);

create table tipo_ayuda(
    id_tipo_ayuda int auto_increment primary key,
    nombre varchar(100), 
    cantidad_estimada varchar (50) not null
);

create table inventario(
    id_inventario int auto_increment primary key,
    id_tipo_ayuda int,
    foreign key (id_tipo_ayuda) references tipo_ayuda(id_tipo_ayuda),
    cantidad_stock int not null
);

create table donador(
    id_donador int auto_increment primary key,
    nombre varhcar(100) not null,
    numero_identificacion varchar (50),
    tipo_donante varchar(50) not null
);

create table donacion(
    id_donacion int auto_increment primary key,
    id_donador int,
    foreign key (id_donador) references donador(id_donador),
    categoria_donacion varchar (100),
    fecha_recepcion datetime not null
);

create table detalle_donacion(
    id_detalle_donacion int auto_increment primary key,
    id_donacion int,
    foreign key (id_donacion) references donacion(id_donacion),
    id_tipo_ayuda int,
    foreign key(id_tipo_ayuda) references tipo_ayuda (id_tipo_ayuda),
    cantidad_recibida int not null
);

/* INT e INTEGER son lo mismo*/

create table usuario(
    id_usuario int auto_increment primary key,
    nombre varchar(100) not null,
    correo varchar(100) not null
);

create table funcion(
    id_funcion int auto_increment primary key,
    nombre_funcion varchar(50) not null unique
);

create table usuario_funcion(
    id_usuario_funcion int auto_increment primary key,
    id_usuario int,
    foreign key (id_usuario) references usuario(id_usuario),
    id_funcion int,
    foreign key(id_funcion) references funcion(id_funcion),
    fecha_inicio deltatime not null,
    fecha_fin detatime,
    activo boolean not null
);

create table entrega(
    id_entrega int auto_increment primary key not null,
    id_hogar int,
    foreign key (id_hogar) references hogar(id_hogar),
    id_punto_atencion int,
    foreign key(id_punto_atencion) references punto_atencion(id_punto_atencion),
    registro_usuario int,
    foreign key(registro_usuario) references usuario(id_usuario),
    fecha_entrega datetime not null, fecha_registro datetime not null
);

create table detalle_entrega(
    id_detalle_entrega int auto_increment primary key not null,
    id_entrega int,
    foreign key (id_entrega) references entrega(id_entrega),
    id_tipo_ayuda int,
    foreign key (id_tipo_entrega) references tipo_entrega(id_tipo_entrega),
    id_tipo_ayuda int,
    foreign key (id_tipo_entrega) references tipo_entrega(id_tipo_entrega),
    cantidad_entegada int not null
);

