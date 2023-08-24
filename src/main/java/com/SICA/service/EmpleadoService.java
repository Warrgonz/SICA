package com.SICA.service;

import com.SICA.domain.Empleado;

import java.util.List;

public interface EmpleadoService {
    List<Empleado> getAllEmpleados();
    void crearEmpleado(int cedula, String nombre, String apellido1, String apellido2, int idUsuario);
    void modificarEmpleado(int cedula, String nombre, String apellido1, String apellido2, int idUsuario);
    void eliminarEmpleado(int cedula);
}