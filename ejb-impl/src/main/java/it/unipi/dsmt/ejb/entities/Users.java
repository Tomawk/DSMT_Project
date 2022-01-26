package it.unipi.dsmt.ejb.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name="users")
public class Users implements Serializable {
    @Id
    @Column(name="user_id")
    private String user_id;
    @Column(name="name")
    private String name;
    @Column(name="surname")
    private String surname;
    @Column(name="username")
    private String username;
    @Column(name="email")
    private String email;
    @Column(name="city")
    private String city;
    @Column(name="postal_code")
    private String postal_code;
    @Column(name="description")
    private String description;
    @Column(name="petsitter")
    private Boolean petsitter;
    @Column(name="male")
    private Boolean male;
    @Column(name="password")
    private String password;
}
