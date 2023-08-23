
package com.SICA.AccesoDatos;

import com.SICA.domain.Empleado;
import org.springframework.data.repository.CrudRepository;


public interface EmpleadoDao extends CrudRepository<Empleado, Long>{
    
}
