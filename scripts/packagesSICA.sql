
--  Packages  --

 
--1.  Este paquete contiene funciones relacionadas con el inventario de la empresa.
CREATE OR REPLACE PACKAGE pkg_inventario AS
  FUNCTION calcular_total_inventario RETURN NUMBER;
  FUNCTION obtener_descripcion_material(codigo_material IN NUMBER) RETURN VARCHAR2;
  FUNCTION obtener_cantidad_empleados RETURN NUMBER;
  FUNCTION calcular_promedio_inventario RETURN NUMBER;
  FUNCTION obtener_ultima_fecha_solicitud RETURN DATE;
  FUNCTION obtener_nombre_empleado(id_empleado IN NUMBER) RETURN VARCHAR2;
  FUNCTION obtener_cantidad_racks RETURN NUMBER;
  FUNCTION obtener_nombre_rol(id_rol IN NUMBER) RETURN VARCHAR2;
  FUNCTION calcular_cantidad_materiales RETURN NUMBER;
  FUNCTION obtener_descripcion_rack(id_rack IN NUMBER) RETURN VARCHAR2;
END pkg_inventario;
/






--2. Este paquete contiene procedimientos relacionados con la gestión de usuarios en la empresa.


CREATE OR REPLACE PACKAGE pkg_usuarios AS
  PROCEDURE sp_insertar_usuario(id_usuario IN INT, nombre IN VARCHAR2, contraseña IN VARCHAR2);
  PROCEDURE sp_modificar_usuario(id_usuario_modifica IN INT, nombre_modifica IN VARCHAR2, contraseña_modifica IN VARCHAR2);
  PROCEDURE sp_eliminar_usuario(id_usuario_elimina IN INT);
END pkg_usuarios;
/





--3. Este paquete contiene procedimientos relacionados con la gestión de empleados en la empresa.

CREATE OR REPLACE PACKAGE pkg_empleados AS
  PROCEDURE sp_insertar_empleado(cedula IN INT, nombre IN VARCHAR2, apellido1 IN VARCHAR2, apellido2 IN VARCHAR2 DEFAULT NULL, id_usuario IN INT DEFAULT NULL);
  PROCEDURE sp_modificar_empleado(cedula_modifica IN INT, nombre_modifica IN VARCHAR2, apellido1_modifica IN VARCHAR2, apellido2_modifica IN VARCHAR2, id_usuario_modifica IN INT);
  PROCEDURE sp_eliminar_empleado(cedula_elimina IN INT);
END pkg_empleados;
/





--4. Este paquete contiene procedimientos relacionados con la gestión de materiales en la empresa.


CREATE OR REPLACE PACKAGE pkg_materiales AS
  PROCEDURE sp_insertar_material(codigo_material IN INT, descripcion IN VARCHAR2);
  PROCEDURE sp_modificar_material(codigo_material_modifica IN INT, descripcion_modifica IN VARCHAR2);
  PROCEDURE sp_eliminar_material(codigo_material_elimina IN INT);
END pkg_materiales;
/








--5. Este paquete contiene procedimientos relacionados con la gestión de solicitudes de material en la empresa.


CREATE OR REPLACE PACKAGE pkg_solicitudes AS
  PROCEDURE sp_insertar_solicitud(id_solicitud INT, cedula INT, fecha DATE DEFAULT SYSDATE, id_estado INT DEFAULT 3);
  PROCEDURE sp_modificar_solicitud(id_solicitud_modifica INT, id_estado_modifica INT);
  PROCEDURE sp_eliminar_solicitud(id_solicitud_elimina INT);
  PROCEDURE sp_insertar_detalle_solicitud(id_detalle INT, cantidad INT, id_inventario INT, id_solicitud INT);
  
END pkg_solicitudes;
/







--6. Obtiene información sobre inventario y cantidad de racks para un material o rack específico.

CREATE OR REPLACE PACKAGE pkg_racks AS
  FUNCTION obtener_cantidad_racks_por_material(codigo_material IN NUMBER) RETURN NUMBER;
  FUNCTION obtener_inventario_rack(id_rack IN NUMBER) RETURN NUMBER;
END pkg_racks;
/





--7.  Permite obtener el ID de un rol por su nombre y lista de todos los roles disponibles.

CREATE OR REPLACE PACKAGE pkg_roles_empresa AS
  FUNCTION obtener_id_rol_por_nombre(nombre_rol IN VARCHAR2) RETURN NUMBER;
  FUNCTION obtener_lista_roles RETURN SYS_REFCURSOR;
END pkg_roles_empresa;
/







--8. Proporciona auditoría de cambios en la tabla "usuarios" por fecha u operación.

CREATE OR REPLACE PACKAGE pkg_usuarios_auditoria AS
  FUNCTION obtener_cambios_usuarios_por_fecha(fecha_desde IN DATE, fecha_hasta IN DATE) RETURN SYS_REFCURSOR;
  FUNCTION obtener_cambios_usuarios_por_operacion(operacion IN CHAR) RETURN SYS_REFCURSOR;
END pkg_usuarios_auditoria;
/






--9. Realiza auditoría de cambios en la tabla "solicitudes" por fecha u operación.

CREATE OR REPLACE PACKAGE pkg_solicitudes_auditoria AS
  FUNCTION obtener_cambios_solicitudes_por_fecha(fecha_desde IN DATE, fecha_hasta IN DATE) RETURN SYS_REFCURSOR;
  FUNCTION obtener_cambios_solicitudes_por_operacion(operacion IN CHAR) RETURN SYS_REFCURSOR;
END pkg_solicitudes_auditoria;
/






--10. Permite auditar cambios en la tabla "inventario" por fecha u operación.

CREATE OR REPLACE PACKAGE pkg_inventario_auditoria AS
  FUNCTION obtener_cambios_inventario_por_fecha(fecha_desde IN DATE, fecha_hasta IN DATE) RETURN SYS_REFCURSOR;
  FUNCTION obtener_cambios_inventario_por_operacion(operacion IN CHAR) RETURN SYS_REFCURSOR;
END pkg_inventario_auditoria;
/