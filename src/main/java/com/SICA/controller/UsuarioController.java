package com.SICA.controller;

import com.SICA.service.UsuarioService;
import com.SICA.domain.Usuario;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/usuarios")
    public String listUsers(Model model) {
        // Fetch the list of users from the database
        List<Usuario> usuarios = usuarioService.getAllUsers();

        // Add the list of users to the model
        model.addAttribute("usuarios", usuarios);

        // Return the name of the Thymeleaf template to be used for rendering
        return "usuarios/usuarios";
    }
}