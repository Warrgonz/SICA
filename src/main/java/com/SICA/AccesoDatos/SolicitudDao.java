
package com.SICA.AccesoDatos;

import com.SICA.domain.solicitud;
import org.springframework.data.repository.CrudRepository;


public interface SolicitudDao extends CrudRepository<solicitud, Long>{
    
}
