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
    private Long itemid;
    @Column(name="reviewid")
    private Long id;
    @Column(name = "reviewer")
    private String reviewer;
    @Column(name = "reviewtitle")
    private String reviewTitle;
    @Column(name = "reviewtag")
    private String reviewTag;
    @Column(name = "reviewbody")
    private String reviewBody;
    @Column(name = "rating")
    private Float rating;
    @Column(name = "date")
    private String date;

    public CustomerReviews(){
    }

    public CustomerReviews(long id, long itemid, String reviewer, String reviewTitle, String reviewTag, String reviewBody, Float rating, String date){
        super();
        this.id = id;
        this.reviewer = reviewer;
        this.reviewTitle = reviewTitle;
        this.reviewTag = reviewTag;
        this.reviewBody = reviewBody;
        this.rating = rating;
        this.date = date;
        this.itemid = itemid;
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

    public String getReviewTag() {
        return reviewTag;
    }

    public void setReviewTag(String reviewTag) {
        this.reviewTag = reviewTag;
    }

    public String getReviewBody() {
        return reviewBody;
    }

    public void setReviewBody(String reviewBody) {
        this.reviewBody = reviewBody;
    }

    public Float getRating() {
        return rating;
    }

    public void setRating(Float rating) {
        this.rating = rating;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Long getItemid() {
        return itemid;
    }

    public void setItemid(Long itemid) {
        this.itemid = itemid;
    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
//        result = prime * result + ((reviewTitle == null) ? 0 : reviewTitle.hashCode());
        result = prime * result + ((id == null) ? 0 : id.hashCode());
//        result = prime * result + ((reviewer == null) ? 0 : reviewer.hashCode());
//        result = prime * result + ((reviewTag == null) ? 0 : reviewTag.hashCode());
//        result = prime * result + ((reviewBody == null) ? 0 : reviewBody.hashCode());
//        result = prime * result + ((rating == null) ? 0 : rating.hashCode());
//        result = prime * result + ((date == null) ? 0 : date.hashCode());
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