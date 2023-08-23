
package com.SICA.AccesoDatos;

import com.SICA.domain.Inventario;
import org.springframework.data.repository.CrudRepository;


public interface InventarioDao extends CrudRepository<Inventario, Long>{
    
}
