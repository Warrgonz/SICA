
package com.SICA.domain;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name="inventario_aud")
public class logs {
    private static final Long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int idInventario;
    //Otra forma de hacerlo
    private int cantidad;
    private int codigoMaterial;
    private int idRack;
    private char operation;
    private Date tiemstamp;

    public logs(int idInventario, int cantidad, int codigoMaterial, int idRack, char operation, Date tiemstamp) {
        this.idInventario = idInventario;
        this.cantidad = cantidad;
        this.codigoMaterial = codigoMaterial;
        this.idRack = idRack;
        this.operation = operation;
        this.tiemstamp = tiemstamp;
    }

    public logs() {
    }



    
}
