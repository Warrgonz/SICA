
package com.SICA.service;

import com.SICA.AccesoDatos.UsuarioDao;
import com.SICA.domain.Rol;
import com.SICA.domain.Usuario;

import java.util.ArrayList;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
@Slf4j
public class UsuarioService implements UserDetailsService{
    @Autowired
    private UsuarioDao usuarioDao;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Override
    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = usuarioDao.findByUsername(username);
        
        //Validacion
        if(usuario == null){
            throw new UsernameNotFoundException(username);
        }
        
        //Crea lista
        var roles = new ArrayList<GrantedAuthority>();
        
        return new User(usuario.getUsername(), usuario.getPassword(), roles);
    }
    
    
    

    
    public void crearUsuario(int idUsuario, String nombre, String contraseña, int idRol) {
        String storedProcedure = "CALL sp_insertar_usuario(?, ?, ?, ?)";
        jdbcTemplate.update(storedProcedure, idUsuario, nombre, contraseña, idRol);
    }

    public void modificarUsuario(int idUsuario, String nombre, String contraseña, int idRol) {
        String storedProcedure = "CALL sp_modificar_usuario(?, ?, ?, ?)";
        jdbcTemplate.update(storedProcedure, idUsuario, nombre, contraseña, idRol);
    }

    public void eliminarUsuario(int idUsuario) {
        String storedProcedure = "CALL sp_eliminar_usuario(?)";
        jdbcTemplate.update(storedProcedure, idUsuario);
    }

    public List<Usuario> getAllUsers() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
    
}
