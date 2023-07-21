--15 Cursores

--Cursor para seleccionar roles de la tabla roles empresa
DECLARE
    CURSOR c_roles_empresa IS
        SELECT * FROM roles_empresa;
BEGIN
    FOR role IN c_roles_empresa LOOP
        DBMS_OUTPUT.PUT_LINE(role.id_rol || ' - ' || role.rol);
    END LOOP;
END;


--Cursor para seleccionar usuarios de la tabla usuarios

DECLARE
    CURSOR c_usuarios IS
        SELECT * FROM usuarios;
BEGIN
    FOR usuario IN c_usuarios LOOP
        DBMS_OUTPUT.PUT_LINE(usuario.id_usuario || ' - ' || usuario.nombre || ' - ' || usuario.contraseña || ' - ' || usuario.id_rol);
    END LOOP;
END;


--Cursor para seleccionar empleados de la tabla empleados

DECLARE
    CURSOR c_empleados IS
        SELECT * FROM empleados;
BEGIN
    FOR empleado IN c_empleados LOOP
        DBMS_OUTPUT.PUT_LINE(empleado.cedula || ' - ' || empleado.nombre || ' - ' || empleado.apellido1 || ' - ' || empleado.apellido2 || ' - ' || empleado.id_usuario);
    END LOOP;
END;


--Cursor para seleccionar materiales de la tabla materiales

DECLARE
    CURSOR c_materiales IS
        SELECT * FROM materiales;
BEGIN
    FOR material IN c_materiales LOOP
        DBMS_OUTPUT.PUT_LINE(material.codigo_material || ' - ' || material.descripcion);
    END LOOP;
END;


--Cursor para seleccionar estados de la tabla estados

DECLARE
    CURSOR c_estados IS
        SELECT * FROM estados;
BEGIN
    FOR estado IN c_estados LOOP
        DBMS_OUTPUT.PUT_LINE(estado.id_estado || ' - ' || estado.descripcion);
    END LOOP;
END;

--Cursor para seleccionar racks de la tabla racks

DECLARE
    CURSOR c_racks IS
        SELECT * FROM racks;
BEGIN
    FOR rack IN c_racks LOOP
        DBMS_OUTPUT.PUT_LINE(rack.id_rack || ' - ' || rack.descripcion);
    END LOOP;
END;

--Cursor para seleccionar inventario de la tabla inventario

DECLARE
    CURSOR c_inventario IS
        SELECT * FROM inventario;
BEGIN
    FOR invent IN c_inventario LOOP
        DBMS_OUTPUT.PUT_LINE(invent.id_inventario || ' - ' || invent.cantidad || ' - ' || invent.codigo_material || ' - ' || invent.id_rack);
    END LOOP;
END;

--Cursor para seleccionar solicitudes de la tabla solicitudes

DECLARE
    CURSOR c_solicitudes IS
        SELECT * FROM solicitudes;
BEGIN
    FOR solicitud IN c_solicitudes LOOP
        DBMS_OUTPUT.PUT_LINE(solicitud.id_solicitud || ' - ' || solicitud.cedula || ' - ' || solicitud.fecha || ' - ' || solicitud.id_estado);
    END LOOP;
END;