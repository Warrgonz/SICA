--5 Triggers de proyecto

--Trigger para tabla roles empresa

CREATE TABLE roles_empresa_aud(
    id_rol INT,
    rol VARCHAR2(20),
    operation CHAR(1), 
    timestamp DATE
);

CREATE OR REPLACE TRIGGER tr_roles_empresa
AFTER INSERT OR DELETE OR UPDATE ON roles_empresa
FOR EACH ROW
DECLARE
    v_operation CHAR(1);
BEGIN
    IF INSERTING THEN
        v_operation := 'I';
    ELSIF DELETING THEN
        v_operation := 'D';
    ELSIF UPDATING THEN
        v_operation := 'U';
    END IF;

    INSERT INTO roles_empresa_aud (id_rol, rol, operation, timestamp)
    VALUES (:NEW.id_rol, :NEW.rol, v_operation, SYSDATE);
END;


--Triggers para tabla usuarios

CREATE TABLE usuarios_aud(
    id_usuario INT,
    nombre VARCHAR2(30),
    contraseña VARCHAR2(30),
    id_rol INT,
    operation CHAR(1),
    timestamp DATE
);

CREATE OR REPLACE TRIGGER tr_usuarios
AFTER INSERT OR DELETE OR UPDATE ON usuarios
FOR EACH ROW
DECLARE
    v_operation CHAR(1);
BEGIN
    IF INSERTING THEN
        v_operation := 'I';
    ELSIF DELETING THEN
        v_operation := 'D';
    ELSIF UPDATING THEN
        v_operation := 'U';
    END IF;

    INSERT INTO usuarios_aud (id_usuario, nombre, contraseña, id_rol, operation, timestamp)
    VALUES (:NEW.id_usuario, :NEW.nombre, :NEW.contraseña, :NEW.id_rol, v_operation, SYSDATE);
END;


--Trigger para tabla empleados

CREATE TABLE empleados_aud(
    cedula INT,
    nombre VARCHAR2(20),
    apellido1 VARCHAR2(20),
    apellido2 VARCHAR2(20),
    id_usuario INT,
    operation CHAR(1),
    timestamp DATE
);

CREATE OR REPLACE TRIGGER tr_empleados
AFTER INSERT OR DELETE OR UPDATE ON empleados
FOR EACH ROW
DECLARE
    v_operation CHAR(1);
BEGIN
    IF INSERTING THEN
        v_operation := 'I';
    ELSIF DELETING THEN
        v_operation := 'D';
    ELSIF UPDATING THEN
        v_operation := 'U';
    END IF;

    INSERT INTO empleados_aud (cedula, nombre, apellido1, apellido2, id_usuario, operation, timestamp)
    VALUES (:NEW.cedula, :NEW.nombre, :NEW.apellido1, :NEW.apellido2, :NEW.id_usuario, v_operation, SYSDATE);
END;


--Trigger para tabla materiales

CREATE TABLE materiales_aud(
    codigo_material INT,
    descripcion VARCHAR2(50),
    operation CHAR(1),
    timestamp DATE
);

CREATE OR REPLACE TRIGGER tr_materiales
AFTER INSERT OR DELETE OR UPDATE ON materiales
FOR EACH ROW
DECLARE
    v_operation CHAR(1);
BEGIN
    IF INSERTING THEN
        v_operation := 'I';
    ELSIF DELETING THEN
        v_operation := 'D';
    ELSIF UPDATING THEN
        v_operation := 'U';
    END IF;

    INSERT INTO materiales_aud (codigo_material, descripcion, operation, timestamp)
    VALUES (:NEW.codigo_material, :NEW.descripcion, v_operation, SYSDATE);
END;


--Trigger para tabla inventario

CREATE TABLE inventario_aud(
    id_inventario INT,
    cantidad INT,
    codigo_material INT,
    id_rack INT,
    operation CHAR(1),
    timestamp DATE
);

CREATE OR REPLACE TRIGGER tr_inventario
AFTER INSERT OR DELETE OR UPDATE ON inventario
FOR EACH ROW
DECLARE
    v_operation CHAR(1);
BEGIN
    IF INSERTING THEN
        v_operation := 'I';
    ELSIF DELETING THEN
        v_operation := 'D';
    ELSIF UPDATING THEN
        v_operation := 'U';
    END IF;

    INSERT INTO inventario_aud (id_inventario, cantidad, codigo_material, id_rack, operation, timestamp)
    VALUES (:NEW.id_inventario, :NEW.cantidad, :NEW.codigo_material, :NEW.id_rack, v_operation, SYSDATE);
END;
