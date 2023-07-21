--

-- Inserts para la tabla roles_empresa
INSERT INTO roles_empresa (id_rol, rol) VALUES (1, 'administrador');
INSERT INTO roles_empresa (id_rol, rol) VALUES (2, 'proveeduria');
INSERT INTO roles_empresa (id_rol, rol) VALUES (3, 'empleado');

-- Inserts para la tabla usuarios
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (1, 'Juan', '123456', 1);
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (2, 'María', 'abcdef', 2);
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (3, 'Carlos', 'qwerty', 3);
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (4, 'Ana', 'zxcvbn', 1);
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (5, 'Pedro', 'asdfgh', 2);
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (6, 'Laura', 'uiop', 3);
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (7, 'Miguel', '123abc', 1);
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (8, 'Luisa', 'xyz789', 2);
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (9, 'Diego', 'qazwsx', 3);
INSERT INTO usuarios (id_usuario, nombre, contraseña, id_rol) VALUES (10, 'Sofía', 'edcrfv', 1);

-- Inserts para la tabla empleados
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1001, 'Pedro', 'González', 'López', 1);
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1002, 'Ana', 'Martínez', 'Pérez', 2);
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1003, 'María', 'López', 'García', 3);
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1004, 'Carlos', 'Sánchez', 'Fernández', 4);
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1005, 'Laura', 'Torres', 'Mendoza', 5);
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1006, 'Miguel', 'Hernández', 'Ramírez', 6);
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1007, 'Luisa', 'Ortega', 'Vargas', 7);
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1008, 'Diego', 'Gómez', 'Jiménez', 8);
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1009, 'Sofía', 'Navarro', 'Rojas', 9);
INSERT INTO empleados (cedula, nombre, apellido1, apellido2, id_usuario) VALUES (1010, 'Lucas', 'Pérez', 'Gutiérrez', 10);

-- Inserts para la tabla materiales
INSERT INTO materiales (codigo_material, descripcion) VALUES (1, 'Cemento');
INSERT INTO materiales (codigo_material, descripcion) VALUES (2, 'Ladrillos');
INSERT INTO materiales (codigo_material, descripcion) VALUES (3, 'Arena');
INSERT INTO materiales (codigo_material, descripcion) VALUES (4, 'Grava');
INSERT INTO materiales (codigo_material, descripcion) VALUES (5, 'Varillas de Acero');
INSERT INTO materiales (codigo_material, descripcion) VALUES (6, 'Madera');
INSERT INTO materiales (codigo_material, descripcion) VALUES (7, 'Pintura');
INSERT INTO materiales (codigo_material, descripcion) VALUES (8, 'Adhesivo para Azulejos');
INSERT INTO materiales (codigo_material, descripcion) VALUES (9, 'Tubos de PVC');
INSERT INTO materiales (codigo_material, descripcion) VALUES (10, 'Cables Eléctricos');


-- Inserts para la tabla estados
INSERT INTO estados (id_estado, descripcion) VALUES (1, 'Aprobada');
INSERT INTO estados (id_estado, descripcion) VALUES (2, 'En espera');
INSERT INTO estados (id_estado, descripcion) VALUES (3, 'Rechazada');

-- Inserts para la tabla racks
INSERT INTO racks (id_rack, descripcion) VALUES (1, 'Rack 1');
INSERT INTO racks (id_rack, descripcion) VALUES (2, 'Rack 2');
INSERT INTO racks (id_rack, descripcion) VALUES (3, 'Rack 3');
INSERT INTO racks (id_rack, descripcion) VALUES (4, 'Rack 4');
INSERT INTO racks (id_rack, descripcion) VALUES (5, 'Rack 5');
INSERT INTO racks (id_rack, descripcion) VALUES (6, 'Rack 6');
INSERT INTO racks (id_rack, descripcion) VALUES (7, 'Rack 7');
INSERT INTO racks (id_rack, descripcion) VALUES (8, 'Rack 8');
INSERT INTO racks (id_rack, descripcion) VALUES (9, 'Rack 9');
INSERT INTO racks (id_rack, descripcion) VALUES (10, 'Rack 10');

-- Inserts para la tabla inventario
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (1, 10, 1, 1);
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (2, 5, 2, 2);
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (3, 8, 3, 3);
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (4, 12, 4, 4);
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (5, 3, 5, 5);
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (6, 7, 6, 6);
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (7, 14, 7, 7);
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (8, 9, 8, 8);
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (9, 6, 9, 9);
INSERT INTO inventario (id_inventario, cantidad, codigo_material, id_rack) VALUES (10, 11, 10, 10);

-- Inserts para la tabla solicitudes
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (1, 1001, TO_DATE('2023-07-01', 'YYYY-MM-DD'), 1);
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (2, 1002, TO_DATE('2023-07-02', 'YYYY-MM-DD'), 2);
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (3, 1003, TO_DATE('2023-07-03', 'YYYY-MM-DD'), 3);
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (4, 1004, TO_DATE('2023-07-04', 'YYYY-MM-DD'), 1);
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (5, 1005, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 2);
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (6, 1006, TO_DATE('2023-07-06', 'YYYY-MM-DD'), 3);
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (7, 1007, TO_DATE('2023-07-07', 'YYYY-MM-DD'), 1);
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (8, 1008, TO_DATE('2023-07-08', 'YYYY-MM-DD'), 2);
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (9, 1009, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 3);
INSERT INTO solicitudes (id_solicitud, cedula, fecha, id_estado) VALUES (10, 1010, TO_DATE('2023-07-10', 'YYYY-MM-DD'), 1);

-- Inserts para la tabla detalles_solicitud
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (1, 2, 1, 1);
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (2, 3, 2, 2);
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (3, 4, 3, 3);
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (4, 1, 4, 4);
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (5, 6, 5, 5);
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (6, 5, 6, 6);
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (7, 3, 7, 7);
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (8, 2, 8, 8);
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (9, 7, 9, 9);
INSERT INTO detalles_solicitud (id_detalle, cantidad, id_inventario, id_solicitud) VALUES (10, 4, 10, 10);

