create database banco_de_sangre;

create table donantes(
id_donante int not null primary key,
nombre varchar(45) not null,
apellido varchar(45) not null,
tipo_de_documento varchar(45) not null,
grupo_sanguineo varchar(45) not null,
fecha_ultima_donacion varchar(45) not null
);

create table donaciones(
id_donacion int not null primary key,
donante int,
fecha_de_donacion varchar(45) not null,
cantidad_sangre int,
tipo_donacion varchar(45) not null,
CONSTRAINT donaciones_donantes_fk FOREIGN KEY (donante) REFERENCES donantes(id_donante)
);

create table unidades_de_sangre(
id_unidades_sangre int not null primary key,
donacion int,
tipo_componente_sanguineo varchar(45) not null,
estado_unidades varchar(45) not null,
fecha_procesamiento varchar(45) not null,
CONSTRAINT unidades_de_sangre_donaciones_fk FOREIGN KEY (donacion) REFERENCES donaciones(id_donacion)
);

create table analisis_de_sangre(
id_analisis_de_sangre int not null primary key,
unidad int,
fecha_analisis varchar(45) not null,
resultado_analisis varchar(45) not null,
CONSTRAINT analisis_de_sangre_unidades_de_sangre_fk FOREIGN KEY (unidad) REFERENCES unidades_de_sangre(id_unidades_sangre)
);

create table distribucion(
id_distribucion int not null primary key,
unidad int,
destino varchar(45) not null,
fecha_distribucion varchar(45) not null,
CONSTRAINT distribucion_unidades_de_sangre_fk FOREIGN KEY (unidad) REFERENCES unidades_de_sangre(id_unidades_sangre)
);
