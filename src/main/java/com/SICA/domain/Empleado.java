
package com.SICA.domain;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name="empleados")
public class Empleado implements Serializable{
    private static final Long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int cedula;
    //Otra forma de hacerlo
    private String nombre;
    private String apellido1;
    private String apellido2;
    private int idUsuario;

    public Empleado(int cedula, String nombre, String apellido1, String apellido2, int idUsuario) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.idUsuario = idUsuario;
    }

    public Empleado() {
    }



    
}
