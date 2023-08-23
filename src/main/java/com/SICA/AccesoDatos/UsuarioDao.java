
package com.SICA.AccesoDatos;

import com.SICA.domain.Usuario;
import org.springframework.data.repository.CrudRepository;


public interface UsuarioDao extends CrudRepository<Usuario, Long>{
    
}
