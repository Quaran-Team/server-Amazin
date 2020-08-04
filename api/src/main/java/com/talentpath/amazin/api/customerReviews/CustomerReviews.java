package com.talentpath.amazin.api.customerReviews;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customerreviews", schema = "public")
public class CustomerReviews {

    @Id
    @Column(name="itemid")
    private Long id;
    @Column(name = "reviewer")
    private String reviewer;
    @Column(name = "reviewTitle")
    private String reviewTitle;

    public CustomerReviews(){
    }

    public CustomerReviews(long id, String reviewer, String reviewTitle){
        super();
        this.id = id;
        this.reviewer = reviewer;
        this.reviewTitle = reviewTitle;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReviewer() {
        return reviewer;
    }

    public void setReviewer(String reviewer) {
        this.reviewer = reviewer;
    }

    public String getReviewTitle() {
        return reviewTitle;
    }

    public void setReviewTitle(String reviewTitle) {
        this.reviewTitle = reviewTitle;
    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((reviewTitle == null) ? 0 : reviewTitle.hashCode());
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((reviewer == null) ? 0 : reviewer.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        CustomerReviews other = (CustomerReviews) obj;
        // id comparison
        if (id == null) {
            if (other.id != null) return false;
        }
        else if (!id.equals(other.id)) return false;
        // arrayOfOtherIds comparison
        if (reviewer == null) {
            if (other.reviewer != null) return false;
        }
        else if (!reviewTitle.equals(other.reviewTitle)) return false;
        return true;
    }
}