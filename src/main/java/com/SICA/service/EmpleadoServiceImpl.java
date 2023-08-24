package com.SICA.service;

import com.SICA.domain.Empleado;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpleadoServiceImpl implements EmpleadoService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Empleado> getAllEmpleados() {
        String query = "SELECT * FROM empleados";

        return jdbcTemplate.query(query, (rs, rowNum) -> {
            Empleado empleado = new Empleado();
            empleado.setCedula(rs.getInt("cedula"));
            empleado.setNombre(rs.getString("nombre"));
            empleado.setApellido1(rs.getString("apellido1"));
            empleado.setApellido2(rs.getString("apellido2"));
            empleado.setIdUsuario(rs.getInt("id_usuario"));
            return empleado;
        });
    }

    @Override
    public void crearEmpleado(int cedula, String nombre, String apellido1, String apellido2, int idUsuario) {
        String storedProcedure = "CALL sp_insertar_empleado(?, ?, ?, ?, ?)";
        jdbcTemplate.update(storedProcedure, cedula, nombre, apellido1, apellido2, idUsuario);
    }

    @Override
    public void modificarEmpleado(int cedula, String nombre, String apellido1, String apellido2, int idUsuario) {
        String storedProcedure = "CALL sp_modificar_empleado(?, ?, ?, ?, ?)";
        jdbcTemplate.update(storedProcedure, cedula, nombre, apellido1, apellido2, idUsuario);
    }

    @Override
    public void eliminarEmpleado(int cedula) {
        String storedProcedure = "CALL sp_eliminar_empleado(?)";
        jdbcTemplate.update(storedProcedure, cedula);
    }
}
