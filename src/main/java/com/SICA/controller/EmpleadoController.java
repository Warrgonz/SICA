package com.SICA.controller;

import com.SICA.service.EmpleadoService;
import com.SICA.domain.Empleado;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class EmpleadoController {

    @Autowired
    private EmpleadoService empleadoService;

    @GetMapping("/empleados")
    public String listEmpleados(Model model) {
        // Fetch the list of employees from the database
        List<Empleado> empleados = empleadoService.getAllEmpleados();

        // Add the list of employees to the model
        model.addAttribute("empleados", empleados);

        // Return the name of the Thymeleaf template to be used for rendering
        return "empleados/empleados";
    }
    
    @GetMapping("/crear-empleado")
    public String showCrearEmpleadoForm(Model model) {
        model.addAttribute("empleado", new Empleado()); // Add an empty employee to the model
        return "empleados/crear-empleado";
    }

    @PostMapping("/crear-empleado")
    public String crearEmpleado(@ModelAttribute Empleado empleado) {
        empleadoService.crearEmpleado(empleado.getCedula(), empleado.getNombre(), empleado.getApellido1(),
                empleado.getApellido2(), empleado.getIdUsuario());
        return "redirect:/empleados"; // Redirect back to the employees list page
    }

    @GetMapping("/eliminar-empleado/{cedula}")
    public String eliminarEmpleado(@PathVariable int cedula) {
        empleadoService.eliminarEmpleado(cedula);
        return "redirect:/empleados"; // Redirect back to the employees list page after deletion
    }
    
    
    
}