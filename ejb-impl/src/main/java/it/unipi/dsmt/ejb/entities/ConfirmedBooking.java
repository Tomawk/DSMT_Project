package it.unipi.dsmt.ejb.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name="confirmed_booking")
public class ConfirmedBooking implements Serializable {
    @Id
    @Column(name="id_")
    private Integer id;
    @Column(name="petowner_id")
    private String po_id;
    @Column(name="petowner_username")
    private String po_us;
    @Column(name="petsitter_id")
    private String ps_id;
    @Column(name="petsitter_username")
    private String ps_us;
    @Column(name="from_date")
    private String from;
    @Column(name="to_date")
    private String to;
    @Column(name="pet")
    private String pet;
    @Column(name="status")
    private String status;
}
