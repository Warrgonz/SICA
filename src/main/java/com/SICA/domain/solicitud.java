
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
@Table(name="solicitudes")
public class solicitud {
    private static final Long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int idSolicitud;
    //Otra forma de hacerlo
    private int cedula;
    private Date Fecha;
    private int idEstado;

    public solicitud(int idSolicitud, int cedula, Date Fecha, int idEstado) {
        this.idSolicitud = idSolicitud;
        this.cedula = cedula;
        this.Fecha = Fecha;
        this.idEstado = idEstado;
    }

    public solicitud() {
    }



    
}
