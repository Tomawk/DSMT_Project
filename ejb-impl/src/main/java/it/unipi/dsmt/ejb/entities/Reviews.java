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


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getPetsitter() {
        return petsitter;
    }

    public void setPetsitter(String petsitter) {
        this.petsitter = petsitter;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}
