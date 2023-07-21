--Script proyecto SICA

--IMPORTANTE: hacer esta seccion como sys
--Creacion de tablespace especifico para el usuario
CREATE TABLESPACE tbs_sica
	DATAFILE 'tbs_sica.dbf'
	SIZE 300m
	AUTOEXTEND ON
	MAXSIZE 2G;
    
--Creacion del usuario que vamos a usar para el schema    
CREATE USER c##sica IDENTIFIED BY 123456;
GRANT CONNECT TO c##sica;
GRANT DBA TO c##sica;

ALTER USER c##sica
DEFAULT TABLESPACE tbs_sica;

--IMPORTANTE: Hacer esta seccion como c##sica 

-- Creacion de tabla roles empresa
CREATE TABLE roles_empresa(
    id_rol INT PRIMARY KEY,
    rol VARCHAR2(20)
    );

-- Creacion de tabla usuarios
CREATE TABLE usuarios(
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR2(30),
    contraseña VARCHAR2(30),
    id_rol INT,
    CONSTRAINT fk_id_rol FOREIGN KEY(id_rol) REFERENCES roles_empresa(id_rol)   
);

 
 
-- Creacion de tabla empleados    
CREATE TABLE empleados(
    cedula INT PRIMARY KEY,
    nombre VARCHAR2(20),
    apellido1 VARCHAR2(20),
    apellido2 VARCHAR2(20),
    id_usuario int,
    CONSTRAINT fk_usuarios FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- Creacion de tabla materiales
CREATE TABLE materiales(
    codigo_material INT PRIMARY KEY,
    descripcion VARCHAR2(50)
);

-- Creacion de tabla estados
CREATE TABLE estados(
    id_estado INT PRIMARY KEY,
    descripcion VARCHAR2(50)
);

--Creacion de tabla racks
CREATE TABLE racks(
    id_rack INT PRIMARY KEY,
    descripcion VARCHAR2(50)
);

--Creacion de tabla inventario
CREATE TABLE inventario(
    id_inventario INT PRIMARY KEY,
    cantidad INT,
    codigo_material INT,
    id_rack INT,
    CONSTRAINT fk_codigo_material FOREIGN KEY(codigo_material) REFERENCES materiales(codigo_material),
    CONSTRAINT fk_id_rack FOREIGN KEY(id_rack) REFERENCES racks(id_rack)
);

--Creacion de tabla solicitudes
CREATE TABLE solicitudes(
    id_solicitud INT PRIMARY KEY,
    cedula INT,
    fecha DATE,
    id_estado INT,
    CONSTRAINT fk_id_estado FOREIGN KEY(id_estado) REFERENCES estados(id_estado)
);

--Creacion de tabla detalles_solicitud
CREATE TABLE detalles_solicitud(
    id_detalle INT PRIMARY KEY,
    cantidad INT,
    id_inventario INT,
    id_solicitud  INT,
    CONSTRAINT fk_id_inventario FOREIGN KEY(id_inventario) REFERENCES inventario(id_inventario),
    CONSTRAINT fk_id_solicitud FOREIGN KEY(id_solicitud) REFERENCES solicitudes(id_solicitud)
);

DROP TABLE SOLICITUDES;
DROP TABLE DETALLES_SOLICITUD;
DROP TABLE USUARIOS;
DROP TABLE EMPLEADOS;
DROP TABLE ROLES_EMPRESA;
DROP TABLE RACKS;
DROP TABLE ESTADOS;
DROP TABLE MATERIALES;
DROP TABLE INVENTARIO;



