create database zoologico;

use zoologico,


create TABLE animal(
id_animal int not null primary key,
nombre varchar(45) not null,
especie varchar(45) not null,
edad int not null,
ubicacion_zoologico varchar(45)
constraint alimentacion_animal_fk foreign key (id_animal) REFERENCES animal(id_animal)
);


create TABLE areas_zoologico(
id_areas_zoologico int not null primary key,
capacidad_maxima varchar(45) not null,
nombre varchar(45) not null);

create TABLE cuidadores(
id_cuidadores int not null primary KEY,
nombre varchar(45) not null,
edad int not null,
especialidad int,
constraint alimentacion_cuidadores_fk foreign key (id_cuidadores) REFERENCES cuidadores(id_cuidadores)

