package it.unipi.dsmt.ejb.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name="review")
public class Reviews implements Serializable {
    @Id
    @Column(name="review_id")
    private Integer id;
    @Column(name="owner")
    private String owner;
    @Column(name="pet_sitter")
    private String petsitter;
    @Column(name="text")
    private String text;
    @Column(name="rating")
    private Integer rating;
    @Column(name="timestamp")
    private Timestamp timestamp;
}
