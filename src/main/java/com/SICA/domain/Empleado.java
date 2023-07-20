
package com.SICA.domain;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class Empleado {
    @Id
    private Long cedula;
    private String nombre;
    private String apellid1;
    private String apellido2;
    private String idUsuario;
}
