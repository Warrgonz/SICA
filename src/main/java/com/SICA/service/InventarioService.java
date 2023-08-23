
package com.SICA.service;

import com.SICA.domain.Inventario;
import java.util.List;


public interface InventarioService {
    public List<Inventario> getInventarios();
    
    public Inventario getInventario(Inventario inventario);
    
    public void save(Inventario inventario); //Tanto para insertar como modificar
    
    public void delete(Inventario inventario);
}
