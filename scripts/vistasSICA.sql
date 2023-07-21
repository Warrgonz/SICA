-- 1. Mostrar reporte de todos los movimientos que se han efectuado en la base de datos.

CREATE OR REPLACE VIEW vista_control_movimientos_empleado AS
SELECT
    e.cedula,
    e.nombre || ' ' || e.apellido1 || ' ' || e.apellido2 AS nombre_empleado,
    s.id_solicitud AS numero_solicitud,
    s.fecha AS fecha_solicitud,
    es.descripcion AS estado_solicitud
FROM empleados e
LEFT JOIN solicitudes s ON e.cedula = s.cedula
LEFT JOIN estados es ON s.id_estado = es.id_estado
WHERE es.descripcion = 'Aprobada';

-- 2. Muestra todos los empleados y solicitudes

CREATE OR REPLACE VIEW vista_empleados_con_solicitudes AS
SELECT
    e.cedula,
    e.nombre || ' ' || e.apellido1 || ' ' || e.apellido2 AS nombre_completo,
    s.id_solicitud,
    s.fecha AS fecha_solicitud,
    est.descripcion AS estado_solicitud
FROM empleados e
LEFT JOIN solicitudes s ON e.cedula = s.cedula
LEFT JOIN estados est ON s.id_estado = est.id_estado;

-- 3. Mostrar todas los detalles solicitudes que han generado los usuarios.

CREATE OR REPLACE VIEW vista_detalle_solicitudes AS
SELECT
    d.id_solicitud,
    m.descripcion AS material,
    d.cantidad,
    r.descripcion AS descripcion_rack
FROM detalles_solicitud d
LEFT JOIN inventario i ON d.id_inventario = i.id_inventario
LEFT JOIN materiales m ON i.codigo_material = m.codigo_material
LEFT JOIN racks r ON i.id_rack = r.id_rack;

-- 4. Solicitudes de proyectos pendientes de aprobación para el rol de proveeduría.

CREATE OR REPLACE VIEW vista_solicitudes_pendientes_empleado AS
SELECT
    e.cedula,
    e.nombre || ' ' || e.apellido1 || ' ' || e.apellido2 AS nombre_empleado,
    s.id_solicitud,
    s.fecha AS fecha_solicitud,
    es.descripcion AS estado_solicitud
FROM empleados e
JOIN solicitudes s ON e.cedula = s.cedula
JOIN estados es ON s.id_estado = es.id_estado
WHERE s.id_estado = (
    SELECT id_estado
    FROM estados
    WHERE descripcion = 'En espera'
);

-- 5. Administrar accesos de los empleados - Administrador

CREATE OR REPLACE VIEW vista_empleados_usuarios AS
SELECT
    e.cedula,
    e.nombre || ' ' || e.apellido1 || ' ' || e.apellido2 AS nombre_usuario,
    u.id_usuario,
    u.nombre AS nombre_usuario_rol,
    u.contraseña,
    r.rol AS rol_usuario
FROM empleados e
LEFT JOIN usuarios u ON e.id_usuario = u.id_usuario
LEFT JOIN roles_empresa r ON u.id_rol = r.id_rol;
