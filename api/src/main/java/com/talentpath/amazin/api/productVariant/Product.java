package com.talentpath.amazin.api.productVariant;

import javax.persistence.*;

@Entity
@Table(name="productv", schema = "public")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="productvid")
    private Long productvid;
    @Column(name="seller")
    private String seller;
    @Column(name="rating")
    private Double rating;
    @Column(name="user_rating")
    private Integer user_rating;
    @Column(name="tag")
    private Boolean tag;
    @Column(name="tag_title")
    private String tag_title;
    @Column(name="category")
    private String category;
    @Column(name="category_link")
    private String category_link;
    @Column(name="similar_item")
    private String similar_item;

    public Product() {
    }

    public Product(long productvid
     , String seller, Double rating, Integer user_rating, Boolean tag, String tag_title, String category, String category_link, String similar_item
    ) {
        super();
        this.productvid = productvid;
        this.seller = seller;
        this.rating = rating;
        this.user_rating = user_rating;
        this.tag = tag;
        this.tag_title = tag_title;
        this.category = category;
        this.category_link = category_link;
        this.similar_item = similar_item;
    }

    public Long getId() {
        return productvid;
    }

    public void setId(Long productvid) {
        this.productvid = productvid;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public Integer getUser_rating() {
        return user_rating;
    }

    public void setUser_rating(Integer user_rating) {
        this.user_rating = user_rating;
    }

    public Boolean getTag() {
        return tag;
    }

    public void setTag(Boolean tag) {
        this.tag = tag;
    }

    public String getTag_title() {
        return tag_title;
    }

    public void setTag_title(String tag_title) {
        this.tag_title = tag_title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory_link() {
        return category_link;
    }

    public void setCategory_link(String category_link) {
        this.category_link = category_link;
    }

    public String getSimilar_item() {
        return similar_item;
    }

    public void setSimilar_item(String similar_item) {
        this.similar_item = similar_item;
    }
}
