
package com.SICA.service;

import com.SICA.domain.Inventario;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.SICA.AccesoDatos.InventarioDao2;


@Service
public class InventarioServiceImpl implements InventarioService {
    
    @Autowired
    InventarioDao2 inventarioDao;
    
    @Transactional(readOnly = true) //Para manejar de lectura
    @Override
    public List<Inventario> getInventarios() {
        var lista = (List<Inventario>)inventarioDao.findAll();
        return lista;
    }
    
    
    
    @Override
    public Inventario getInventario(Inventario inventario) {
        return inventarioDao.findById(inventario.getIdInventario()).orElse(null);
    }

    @Override
    public void save(Inventario inventario) {
        inventarioDao.save(inventario);
    }

    @Override
    public void delete(Inventario inventario) {
        inventarioDao.deleteById(inventario.getIdInventario());
    }
    
}