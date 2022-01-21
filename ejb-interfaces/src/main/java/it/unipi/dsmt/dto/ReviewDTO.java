package it.unipi.dsmt.dto;

import java.io.Serializable;
import java.sql.Timestamp;

public class ReviewDTO implements Serializable {
    private int review_id;
    public String owner;
    public String ownerUsername;
    public String pet_sitter;
    public String text;
    public int rating;
    public Timestamp timestamp;

    public ReviewDTO(int review_id, String owner, String owner_username, String pet_sitter, String text, int rating, Timestamp timestamp) {
        this.review_id = review_id;
        this.owner = owner;
        this.ownerUsername = owner_username;
        this.pet_sitter = pet_sitter;
        this.text = text;
        this.rating = rating;
        this.timestamp = timestamp;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getOwnerUsername() {
        return ownerUsername;
    }

    public void setOwnerUsername(String ownerUsername) {
        this.ownerUsername = ownerUsername;
    }

    public String getPet_sitter() {
        return pet_sitter;
    }

    public void setPet_sitter(String pet_sitter) {
        this.pet_sitter = pet_sitter;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "ReviewDTO{" +
                "review_id=" + review_id +
                ", owner='" + owner + '\'' +
                ", ownerUsername='" + ownerUsername + '\'' +
                ", pet_sitter='" + pet_sitter + '\'' +
                ", text='" + text + '\'' +
                ", rating=" + rating +
                ", timestamp=" + timestamp +
                '}';
    }
}
