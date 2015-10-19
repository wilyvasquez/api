create table usuarios(
	id_usuario serial primary key not null,
	tipo_usuario varchar(15) not null,
	nip varchar(15) UNIQUE not null,
	password varchar(15) not null 
);

create table bajas(
	id_bajas serial primary key not null,
	causa text,
	fecha_baja date
);

create table inventario(
	id_inventario serial primary key not null,
	tipo varchar(10) not null,
	cantidad smallint check (cantidad > 0),
	marca varchar(20),
	modelo varchar(30),
	status varchar(10) not null,
	fecha_alta date,
	num_fectura integer,
	recurso_prov varchar(15),
	foto_inventario bytea
);

create table procedencia(
	id_procedencia serial primary key not null,
	tipo_proc varchar(20) not null,
	corporacion varchar(30),
	area varchar(30),
	puesto varchar(30)
);

create table equipo (
	id_equipo serial primary key not null,
	num_serie varchar(20) UNIQUE not null,
	sicipo varchar(20),
	rfsi varchar (15),
	ref_inventario serial not null
);

create table piezas(
	id_piezas serial primary key not null,
	tipo_pza varchar(20) not null,
	nombre_pza varchar (20),
	ref_inventario serial not null
);

create table responsable(
	id_responsable serial primary key not null,
	nombre_res varchar(30),
	apellidos varchar(30),
	telefono numeric,
	ref_procedencia serial not null
);

create table radio_base(
	id_instalacionRB serial primary key not null,
	lugar_instalacion varchar(30),
	ref_servicio serial not null
	
);

create table inv_ser(
	id_inv_serv serial primary key not null,
	ref_servicio serial not null,
	ref_inventario serial not null
);

create table servicio(
	id_servicio serial primary key not null,
	tipo_servicio varchar(30) not null,
	fecha_inicio date,
	fecha_fin date,
	status varchar(10) not null,
	folio integer UNIQUE,
	ref_responsable serial not null
);

create table radio_movil(
	id_instalacionRM serial primary key not null,
	tipo_unidad varchar(15),
	num_unidad varchar(10),
	ref_servicio serial not null
);

create table resguardo(
	id_resguardo serial primary key not null,
	tipo_resguardo varchar(15),
	tipo_teclado varchar(15),
	ref_servicio serial not null
);

create table mantenimiento(
	id_mantenimiento serial primary key not null,
	fotografia bytea,
	ref_servicio serial not null
);

create table bloqueos(
	id_bloqueos serial primary key not null,
	causa text,
	ref_servicio serial not null
);

create table equi_baja(
	id_equiBaja serial primary key not null,
	ref_equipo serial not null,
	ref_baja serial not null
);



alter table equipo add constraint ref_inventario foreign key (ref_inventario) references inventario (id_inventario);
alter table piezas add constraint ref_inventario foreign key (ref_inventario) references inventario (id_inventario);
alter table responsable add constraint ref_procedencia foreign key (ref_procedencia) references procedencia (id_procedencia); 	
alter table radio_base add constraint ref_servicio foreign key (ref_servicio) references servicio (id_servicio);
alter table inv_ser add constraint ref_servicio foreign key (ref_servicio) references servicio (id_servicio);
alter table inv_ser add constraint ref_inventario foreign key (ref_inventario) references inventario (id_inventario);
alter table servicio add constraint ref_responsable foreign key (ref_responsable) references responsable (id_responsable);
alter table radio_movil add constraint ref_servicio foreign key (ref_servicio) references servicio (id_servicio);
alter table resguardo add constraint ref_servicio foreign key (ref_servicio) references servicio (id_servicio);
alter table mantenimiento add constraint ref_servicio foreign key (ref_servicio) references servicio (id_servicio);
alter table bloqueos add constraint ref_servicio foreign key (ref_servicio) references servicio (id_servicio);
alter table equi_baja add constraint ref_equipo foreign key (ref_equipo) references equipo (id_equipo);
alter table equi_baja add constraint ref_baja foreign key (ref_baja) references bajas (id_bajas);