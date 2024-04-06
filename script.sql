-- Creación de la base de datos
CREATE DATABASE banco_de_sangre;
 
USE  banco_de_sangre;
-- Tabla para Grupo Sanguíneo
CREATE TABLE grupo_sanguineo (
    id_grupo_sanguineo INT NOT NULL PRIMARY KEY,
    tipo_grupo_sanguineo VARCHAR(10) NOT NULL
);

-- Tabla para Tipo de Componente Sanguíneo
CREATE TABLE tipo_componente_sanguineo (
    id_tipo_componente INT NOT NULL PRIMARY KEY,
    nombre_tipo_componente VARCHAR(50) NOT NULL
);

-- Tabla para Estado de Unidades
CREATE TABLE estado_unidades (
    id_estado_unidades INT NOT NULL PRIMARY KEY,
    estado VARCHAR(50) NOT NULL
);

-- Tabla para Destino
CREATE TABLE destino (
    id_destino INT NOT NULL PRIMARY KEY,
    nombre_destino VARCHAR(100) NOT NULL
);

-- Tabla para Donantes
CREATE TABLE donantes(
    id_donante INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    tipo_de_documento VARCHAR(45) NOT NULL,
    grupo_sanguineo_id INT NOT NULL,
    fecha_ultima_donacion VARCHAR(45) NOT NULL,
    CONSTRAINT donantes_grupo_sanguineo_fk FOREIGN KEY (grupo_sanguineo_id) REFERENCES grupo_sanguineo(id_grupo_sanguineo)
);

-- Tabla para Donaciones
CREATE TABLE donaciones(
    id_donacion INT NOT NULL PRIMARY KEY,
    donante INT,
    fecha_de_donacion VARCHAR(45) NOT NULL,
    cantidad_sangre INT,
    tipo_donacion VARCHAR(45) NOT NULL,
    CONSTRAINT donaciones_donantes_fk FOREIGN KEY (donante) REFERENCES donantes(id_donante)
);

-- Tabla para Unidades de Sangre
CREATE TABLE unidades_de_sangre(
    id_unidades_sangre INT NOT NULL PRIMARY KEY,
    donacion INT,
    tipo_componente_sanguineo_id INT NOT NULL,
    estado_unidades_id INT NOT NULL,
    fecha_procesamiento VARCHAR(45) NOT NULL,
    CONSTRAINT unidades_de_sangre_donaciones_fk FOREIGN KEY (donacion) REFERENCES donaciones(id_donacion),
    CONSTRAINT unidades_de_sangre_tipo_componente_sanguineo_fk FOREIGN KEY (tipo_componente_sanguineo_id) REFERENCES tipo_componente_sanguineo(id_tipo_componente),
    CONSTRAINT unidades_de_sangre_estado_unidades_fk FOREIGN KEY (estado_unidades_id) REFERENCES estado_unidades(id_estado_unidades)
);

-- Tabla para Análisis de Sangre
CREATE TABLE analisis_de_sangre(
    id_analisis_de_sangre INT NOT NULL PRIMARY KEY,
    unidad INT,
    fecha_analisis VARCHAR(45) NOT NULL,
    resultado_analisis VARCHAR(45) NOT NULL,
    CONSTRAINT analisis_de_sangre_unidades_de_sangre_fk FOREIGN KEY (unidad) REFERENCES unidades_de_sangre(id_unidades_sangre)
);

-- Tabla para Distribución
CREATE TABLE distribucion(
    id_distribucion INT NOT NULL PRIMARY KEY,
    unidad INT,
    destino_id INT NOT NULL,
    fecha_distribucion VARCHAR(45) NOT NULL,
    CONSTRAINT distribucion_unidades_de_sangre_fk FOREIGN KEY (unidad) REFERENCES unidades_de_sangre(id_unidades_sangre),
    CONSTRAINT distribucion_destino_fk FOREIGN KEY (destino_id) REFERENCES destino(id_destino)
);
