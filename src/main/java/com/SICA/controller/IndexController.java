
package com.SICA.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    
    @GetMapping("/inicio")
    public String page(Model model) {
        String mensaje = "Para enviar informacion, se pueden enviar objetos";
        model.addAttribute("MensajeEjemplo", mensaje);
        
        return "index";
    }
    
}
