--Creacion de stored procedures

--

/*STORED PROCEDURES PARA TABLA USUARIO*/

--INSERT en tabla usuario
CREATE OR REPLACE PROCEDURE sp_insertar_usuario(
    id_usuario IN INT,
    nombre IN VARCHAR2,
    contraseña IN VARCHAR2
)
IS
BEGIN
    -- Validaciones de campos en insert
    IF id_usuario IS NULL OR nombre IS NULL OR contraseña IS NULL OR nombre = '' OR contraseña = '' THEN
        raise_application_error(-20001, 'Todos los campos son requeridos');
    END IF;

    -- Se inserta el registro
    INSERT INTO usuarios (id_usuario, nombre, contraseña)
    VALUES (id_usuario, nombre, contraseña);
    
    -- Se verifica si el insert fue exitoso
    IF SQL%ROWCOUNT = 0 THEN
        raise_application_error(-20002, 'Error al insertar el registro');
    END IF;
END;
/
--UPDATE en tabla usuarios
CREATE OR REPLACE PROCEDURE sp_modificar_usuario (
    id_usuario_modifica IN INT,
    nombre_modifica    IN VARCHAR2,
    contraseña_modifica IN VARCHAR2
) IS
BEGIN
  -- Validaciones de campos en update
    IF id_usuario_modifica IS NULL OR nombre_modifica IS NULL OR contraseña_modifica IS NULL OR nombre_modifica = '' OR contraseña_modifica = '' THEN
        raise_application_error(-20001, 'Todos los campos son requeridos');
    END IF;

  -- Se modifica el registro
    UPDATE usuarios
    SET
        nombre = nombre_modifica,
        contraseña = contraseña_modifica
    WHERE
        id_usuario = id_usuario_modifica;
    
    -- Se verifica si el update fue exitoso
    IF SQL%rowcount = 0 THEN
        raise_application_error(-20002, 'Error al modificar el registro');
    END IF;
END;
/
--DELETE en tabla usuarios
CREATE OR REPLACE PROCEDURE sp_eliminar_usuario (
    id_usuario_elimina IN INT
) IS
BEGIN
  -- Validación de campo en delete
    IF id_usuario_elimina IS NULL THEN
        raise_application_error(-20001, 'El ID del usuario es requerido');
    END IF;

  -- Se elimina el registro
    DELETE FROM usuarios
    WHERE
        id_usuario = id_usuario_elimina;
    
    -- Se verifica si el delete fue exitoso
    IF SQL%rowcount = 0 THEN
        raise_application_error(-20002, 'Error al eliminar el registro');
    END IF;
END;
/
/*STORED PROCEDURES PARA TABLA EMPLEADOS*/

CREATE OR REPLACE PROCEDURE sp_insertar_empleado(
    cedula IN INT,
    nombre IN VARCHAR2,
    apellido1 IN VARCHAR2,
    apellido2 IN VARCHAR2 DEFAULT NULL,
    id_usuario IN INT DEFAULT NULL
)
IS
BEGIN
    -- Validaciones de campos en insert
    IF cedula IS NULL OR nombre IS NULL OR apellido1 IS NULL OR nombre = '' OR apellido1 = '' THEN
        raise_application_error(-20001, 'Los campos cedula, nombre y apellido1 son requeridos');
    END IF;

    -- Se inserta el registro
    INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario)
    VALUES (cedula, nombre, apellido1, apellido2, id_usuario);
    
    -- Se verifica si el insert fue exitoso
    IF SQL%ROWCOUNT = 0 THEN
        raise_application_error(-20002, 'Error al insertar el registro');
    END IF;
END;
/
-- UPDATE en tabla empleados
CREATE OR REPLACE PROCEDURE sp_modificar_empleado(
    cedula_modifica IN INT,
    nombre_modifica IN VARCHAR2,
    apellido1_modifica IN VARCHAR2,
    apellido2_modifica IN VARCHAR2,
    id_usuario_modifica IN INT
)
IS
BEGIN
    -- Validaciones de campos necesarios
    IF cedula_modifica IS NULL OR nombre_modifica IS NULL OR apellido1_modifica IS NULL OR nombre_modifica = '' OR apellido1_modifica = '' THEN
        raise_application_error(-20001, 'Los campos cedula, nombre y apellido1 son requeridos');
    END IF;

    -- Se modifica el registro
    UPDATE empleados SET
        nombre = nombre_modifica,
        apellido1 = apellido1_modifica,
        apellido2 = apellido2_modifica,
        id_usuario = id_usuario_modifica
    WHERE cedula = cedula_modifica;
    
    -- Se verifica si el update fue exitoso
    IF SQL%ROWCOUNT = 0 THEN
        raise_application_error(-20002, 'Error al modificar el registro');
    END IF;
END;
/
-- DELETE en tabla empleados
CREATE OR REPLACE PROCEDURE sp_eliminar_empleado (
    cedula_elimina IN INT
) IS
BEGIN
  -- Validación de campo en delete
    IF cedula_elimina IS NULL THEN
        raise_application_error(-20001, 'La cedula del empleado es requerida');
    END IF;

  -- Se elimina el registro
    DELETE FROM empleados
    WHERE
        cedula = cedula_elimina;
    
    -- Se verifica si el delete fue exitoso
    IF SQL%rowcount = 0 THEN
        raise_application_error(-20002, 'Error al eliminar el registro');
    END IF;
END;
/

/*Stored procedures para tabla materiales*/

CREATE OR REPLACE PROCEDURE sp_insertar_material(
    codigo_material IN INT,
    descripcion IN VARCHAR2
)
IS
BEGIN
    -- Validaciones de campos en insert
    IF codigo_material IS NULL OR descripcion IS NULL OR descripcion = '' THEN 
    raise_application_error(-20001, 'Todos los campos son requeridos');
    END IF;
    
    -- Se inserta el registro
    INSERT INTO materiales (codigo_material, descripcion)
    VALUES (codigo_material, descripcion);
    
    -- Se verifica si el insert fue exitoso
    IF SQL%ROWCOUNT = 0 THEN
        raise_application_error(-20002, 'Error al insertar el registro');
    END IF;
END;
/

--UPDATE en tabla usuarios
CREATE OR REPLACE PROCEDURE sp_modificar_material (
    codigo_material_modifica IN INT,
    descripcion_modifica IN VARCHAR2
) 
IS
BEGIN
  -- Validaciones de campos en update
    IF codigo_material_modifica IS NULL OR descripcion_modifica IS NULL OR descripcion_modifica = '' THEN
        raise_application_error(-20001, 'Todos los campos son requeridos');
    END IF;

  -- Se modifica el registro
    UPDATE materiales
    SET
        descripcion = descripcion_modifica
    WHERE
        codigo_material = codigo_material_modifica;
    
    -- Se verifica si el update fue exitoso
    IF SQL%rowcount = 0 THEN
        raise_application_error(-20002, 'Error al modificar el registro');
    END IF;
END;
/

--DELETE en tabla usuarios
CREATE OR REPLACE PROCEDURE sp_eliminar_material (
    codigo_material_elimina IN INT
) IS
BEGIN
  -- Validación de campo en delete
    IF codigo_material_elimina IS NULL THEN
        raise_application_error(-20001, 'El codigo del material es requerido');
    END IF;

  -- Se elimina el registro
    DELETE FROM materiales
    WHERE
        codigo_material = codigo_material_elimina;
    
    -- Se verifica si el delete fue exitoso
    IF SQL%rowcount = 0 THEN
        raise_application_error(-20002, 'Error al eliminar el registro');
    END IF;
END;
/

--INSERT en tabla solicitudes
CREATE OR REPLACE PROCEDURE sp_insertar_solicitud(
    id_solicitud INT,
    cedula INT,
    fecha DATE DEFAULT SYSDATE,
    id_estado INT DEFAULT 3
)
IS
BEGIN
    -- Validación de campo en delete
    IF id_solicitud IS NULL OR cedula IS NULL THEN
    raise_application_error(-20001, 'Todos los campos son requeridos');
    END IF;
    -- Se inserta el registro
    INSERT INTO solicitudes(id_solicitud, cedula, fecha, id_estado)
    VALUES(id_solicitud, cedula, fecha, id_estado);
    
    -- Se verifica si el insert fue exitoso
    IF SQL%ROWCOUNT = 0 THEN
        raise_application_error(-20002, 'Error al insertar el registro');
    END IF;
END;
/

--UPDATE en tabla solicitudes
CREATE OR REPLACE PROCEDURE sp_modificar_solicitud(
    id_solicitud_modifica INT,
    id_estado_modifica INT
)
IS 
BEGIN
    --Validaciones de campos en update
    IF id_solicitud_modifica IS NULL OR id_estado_modifica IS NULL THEN
    raise_application_error(-20001, 'Todos los campos son requeridos');
    END IF;
    
    --Se modifica el registro
    UPDATE solicitudes
    SET 
        id_estado = id_estado_modifica
    WHERE 
        id_solicitud = id_solicitud_modifica;
    
    --Se verifica si el update fue exitoso   
    IF SQL%ROWCOUNT = 0 THEN
        raise_application_error(-20002, 'Error al modificar el registro');
    END IF;
END;
/

--DELETE en tabla solicitudes

CREATE OR REPLACE PROCEDURE sp_eliminar_solicitud(
    id_solicitud_elimina INT
)
IS
BEGIN
    -- Validacion de campo en delete
    IF id_solicitud_elimina IS NULL THEN
        raise_application_error(-20001, 'El campo es requerido');
    END IF;
    
    -- Se elimina el registro
    DELETE FROM solicitudes
    WHERE
        id_solicitud = id_solicitud_elimina;
    
    -- Se verifica si el delete fue exitoso
    IF SQL%ROWCOUNT = 0 THEN
        raise_application_error(-20002, 'Error al eliminar el registro');
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE sp_insertar_detalle_solicitud(
    id_detalle INT,
    cantidad INT,
    id_inventario INT,
    id_solicitud  INT
)
IS 
BEGIN
    -- Validaciones de campos en insert
    IF id_detalle IS NULL OR cantidad IS NULL OR id_inventario IS NULL OR id_solicitud IS NULL THEN
        raise_application_error(-20001, 'Todos los campos son requeridos');
    END IF;
    
    -- Se inserta el registro
    INSERT INTO detalles_solicitud(id_detalle, cantidad, id_inventario, id_solicitud)
    VALUES(id_detalle, cantidad, id_inventario, id_solicitud);
    
    -- Se verifica si el insert fue exitoso
    IF SQL%ROWCOUNT = 0 THEN
        raise_application_error(-20002, 'Error al insertar el registro');
    END IF;
END;
/

--Van 13 SP, faltan los update y delete de detalles_solicitud + otros


--Generar script para ver todos los stored procedures
select 'DROP PROCEDURE ' || object_name || ';'
FROM user_objects
WHERE object_type = 'PROCEDURE';


-- Revisar stored procedures existentes
SELECT object_name, object_type
FROM user_objects
WHERE object_type = 'PROCEDURE';


DROP PROCEDURE SP_INSERTAR_USUARIO;
DROP PROCEDURE SP_MODIFICAR_USUARIO;
DROP PROCEDURE SP_ELIMINAR_USUARIO;
DROP PROCEDURE SP_INSERTAR_EMPLEADO;
DROP PROCEDURE SP_MODIFICAR_EMPLEADO;
DROP PROCEDURE SP_ELIMINAR_EMPLEADO;
DROP PROCEDURE SP_INSERTAR_MATERIAL;
DROP PROCEDURE SP_MODIFICAR_MATERIAL;
DROP PROCEDURE SP_ELIMINAR_MATERIAL;
DROP PROCEDURE SP_INSERTAR_SOLICITUD;
DROP PROCEDURE SP_MODIFICAR_SOLICITUD;
DROP PROCEDURE SP_ELIMINAR_SOLICITUD;
DROP PROCEDURE SP_INSERTAR_DETALLE_SOLICITUD;
