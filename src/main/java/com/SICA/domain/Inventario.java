
package com.SICA.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name="Inventarios")
public class Inventario {
    private static final Long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private long idInventario;
    //Otra forma de hacerlo
    private int cantidad;
    private int codigoMaterial;
    private int idRack;

    public Inventario(long idInventario, int cantidad, int codigoMaterial, int idRack) {
        this.idInventario = idInventario;
        this.cantidad = cantidad;
        this.codigoMaterial = codigoMaterial;
        this.idRack = idRack;
    }

    public Inventario() {
    }

    
}
