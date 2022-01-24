package it.unipi.dsmt.dto;

import java.util.ArrayList;

public class BookingDTO {

    private String review_id;
    public String po_username;
    public String ps_username;
    public String date_from;
    public String date_to;
    public String pet;

    public BookingDTO(String po_username, String ps_username, String date_from, String date_to, String pet) {
        this.po_username = po_username;
        this.ps_username = ps_username;
        this.date_from = date_from;
        this.date_to = date_to;
        this.pet = pet;
    }

    @Override
    public String toString() {
        return "BookingDTO{" +
                "po_username='" + po_username + '\'' +
                ", ps_username='" + ps_username + '\'' +
                ", date_from='" + date_from + '\'' +
                ", date_to='" + date_to + '\'' +
                ", pet='" + pet + '\'' +
                '}';
    }


    public String getPo_username() {
        return po_username;
    }

    public String getPs_username() {
        return ps_username;
    }

    public String getDate_from() {
        return date_from;
    }

    public String getDate_to() {
        return date_to;
    }

    public String getPet() {
        return pet;
    }
}
