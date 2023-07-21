--1. Calcular la cantidad total de inventario

CREATE OR REPLACE FUNCTION calcular_total_inventario
  RETURN NUMBER IS
  total_cantidad NUMBER;
BEGIN
  SELECT SUM(cantidad) INTO total_cantidad FROM inventario;
  RETURN total_cantidad;
END;
/









--2. Obtener la descripción de un material basado en el código del material

CREATE OR REPLACE FUNCTION obtener_descripcion_material(codigo_material IN NUMBER)
  RETURN VARCHAR2 IS
  descripcion_material VARCHAR2(50);
BEGIN
  SELECT descripcion INTO descripcion_material FROM materiales WHERE codigo_material = codigo_material;
  RETURN descripcion_material;
END;
/









--3. Obtener el número de empleados

CREATE OR REPLACE FUNCTION obtener_cantidad_empleados
  RETURN NUMBER IS
  cantidad_empleados NUMBER;
BEGIN
  SELECT COUNT(*) INTO cantidad_empleados FROM empleados;
  RETURN cantidad_empleados;
END;
/









--4. Calcular el promedio de la cantidad de inventario

CREATE OR REPLACE FUNCTION calcular_promedio_inventario
  RETURN NUMBER IS
  cantidad_promedio NUMBER;
BEGIN
  SELECT AVG(cantidad) INTO cantidad_promedio FROM inventario;
  RETURN cantidad_promedio;
END;
/










--5. Obtener la fecha de la última solicitud

CREATE OR REPLACE FUNCTION obtener_ultima_fecha_solicitud
  RETURN DATE IS
  ultima_fecha DATE;
BEGIN
  SELECT MAX(fecha) INTO ultima_fecha FROM solicitudes;
  RETURN ultima_fecha;
END;
/









--6. Obtener el nombre de un empleado basado en su ID


CREATE OR REPLACE FUNCTION obtener_nombre_empleado(id_empleado IN NUMBER)
  RETURN VARCHAR2 IS
  nombre_empleado VARCHAR2(50);
BEGIN
  SELECT nombre INTO nombre_empleado FROM empleados WHERE cedula = id_empleado;
  RETURN nombre_empleado;
END;
/









--7. Obtener el número total de racks

CREATE OR REPLACE FUNCTION obtener_cantidad_racks
  RETURN NUMBER IS
  cantidad_racks NUMBER;
BEGIN
  SELECT COUNT(*) INTO cantidad_racks FROM racks;
  RETURN cantidad_racks;
END;
/










--8. Obtener el nombre del rol basado en el ID del rol

CREATE OR REPLACE FUNCTION obtener_nombre_rol(id_rol IN NUMBER)
  RETURN VARCHAR2 IS
  nombre_rol VARCHAR2(20);
BEGIN
  SELECT rol INTO nombre_rol FROM roles_empresa WHERE id_rol = id_rol;
  RETURN nombre_rol;
END;
/










--9. Calcular el número total de materiales

CREATE OR REPLACE FUNCTION calcular_cantidad_materiales
  RETURN NUMBER IS
  cantidad_materiales NUMBER;
BEGIN
  SELECT COUNT(*) INTO cantidad_materiales FROM materiales;
  RETURN cantidad_materiales;
END;
/









--10. Obtener la descripción de un rack basado en el ID del rack

CREATE OR REPLACE FUNCTION obtener_descripcion_rack(id_rack IN NUMBER)
  RETURN VARCHAR2 IS
  descripcion_rack VARCHAR2(50);
BEGIN
  SELECT descripcion INTO descripcion_rack FROM racks WHERE id_rack = id_rack;
  RETURN descripcion_rack;
END;
/









--11. Obtener el número total de usuarios

CREATE OR REPLACE FUNCTION obtener_cantidad_usuarios
  RETURN NUMBER IS
  cantidad_usuarios NUMBER;
BEGIN
  SELECT COUNT(*) INTO cantidad_usuarios FROM usuarios;
  RETURN cantidad_usuarios;
END;
/









--12. Obtener el número total de solicitudes de material

CREATE OR REPLACE FUNCTION obtener_cantidad_solicitudes
  RETURN NUMBER IS
  cantidad_solicitudes NUMBER;
BEGIN
  SELECT COUNT(*) INTO cantidad_solicitudes FROM solicitudes;
  RETURN cantidad_solicitudes;
END;
/









--13. Calcular la cantidad total de un material específico en el inventario

CREATE OR REPLACE FUNCTION calcular_total_material(codigo_material IN NUMBER)
  RETURN NUMBER IS
  total_material NUMBER;
BEGIN
  SELECT SUM(cantidad) INTO total_material FROM inventario WHERE codigo_material = codigo_material;
  RETURN total_material;
END;
/









--14. Obtener el nombre de usuario basado en el ID de usuario

CREATE OR REPLACE FUNCTION obtener_nombre_usuario(id_usuario IN NUMBER)
  RETURN VARCHAR2 IS
  nombre_usuario VARCHAR2(30);
BEGIN
  SELECT nombre INTO nombre_usuario FROM usuarios WHERE id_usuario = id_usuario;
  RETURN nombre_usuario;
END;
/









--15. Obtener el número total de roles diferentes

CREATE OR REPLACE FUNCTION obtener_cantidad_roles
  RETURN NUMBER IS
  cantidad_roles NUMBER;
BEGIN
  SELECT COUNT(*) INTO cantidad_roles FROM roles_empresa;
  RETURN cantidad_roles;
END;
/
