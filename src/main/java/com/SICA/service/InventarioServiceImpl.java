
package com.SICA.service;

import com.SICA.AccesoDatos.InventarioDao;
import com.SICA.domain.Inventario;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class InventarioServiceImpl implements InventarioService {
    
    @Autowired
    InventarioDao inventarioDao;
    
    @Transactional(readOnly = true) //Para manejar de lectura
    @Override
    public List<Inventario> getInventarios() {
        var lista = (List<Inventario>)inventarioDao.findAll();
        return lista;
    }

    @Override
    public void save(Inventario inventario) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Inventario inventario) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Inventario getInventario(Inventario inventario) {
         return inventarioDao.findById(inventario.getIdInventario()).orElse(null);
    }
    
    
    

    
}