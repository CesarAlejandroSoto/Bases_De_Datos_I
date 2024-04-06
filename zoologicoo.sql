create database zoologico;

use zoologico;

CREATE TABLE animales(
id_animal int NOT NULL PRIMARY KEY,
nombre_animal VARCHAR(45) NOT NULL,
especie VARCHAR(45) NOT NULL,
areas int NOT NULL,
CONSTRAINT animales_area_fk FOREIGN KEY(areas) REFERENCES area(id_area)
);

CREATE TABLE cuidadores(
id_cuidador int NOT NULL PRIMARY KEY,
nombre_cuidador varchar(45) NOT NULL,
edad int NOT NULL,
especialidad int NOT NULL,
CONSTRAINT cuidadores_especialidades_fk FOREIGN KEY(especialidad) REFERENCES especialidad(id_especialidad)
);

CREATE TABLE alimentacion(
id_alimentacion int NOT NULL PRIMARY KEY,
id_animal int NOT NULL,
id_cuidador int NOT NULL,
CONSTRAINT cuidadores_alimentacion_fk FOREIGN KEY(id_cuidador) REFERENCES cuidadores(id_cuidador),
CONSTRAINT alimentacion_animales_fk FOREIGN KEY (id_animal) REFERENCES animales(id_animal)
);

CREATE TABLE especialidad(
id_especialidad int NOT NULL PRIMARY KEY,
nombre varchar(45) NOT NULL,
descripccion varchar(45) NOT NULL
);

CREATE TABLE area(
id_area int NOT NULL PRIMARY KEY,
nombre_area varchar(45) NOT NULL,
capacidad int NOT NULL
);