
package com.SICA.controller;

import com.SICA.domain.Inventario;
import com.SICA.service.InventarioService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class InventarioController {
    
    @Autowired
    InventarioService inventarioService;
    
    
    @GetMapping("/inventarios/listado")
    public String inicio(Model model) {
        var articulos = inventarioService.getInventarios();
        //var articulo = Arrays.asList();
        model.addAttribute("articulo", articulos);
        return "/inventarios/listado";
    }
    
    @PostMapping("/inventarios/guardar")
    public String guardarInventario(Inventario inventario){
        inventarioService.save(inventario);
        return "redirect:/inventarios/listado";
    }
    
    @GetMapping("/inventarios/modificar/{idInventario}")
    public String modificarInventario(Inventario inventario, Model model){
        inventario = inventarioService.getInventario(inventario);
        model.addAttribute("inventario", inventario);
        return "inventario/modificar";
    }
    @GetMapping("/inventario/eliminar/{idInventario}")
    public String eliminarInventario(Inventario inventario){
        inventarioService.delete(inventario);
        return "redirect:/articulo/listado";
    }
    
}

