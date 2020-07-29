package com.talentpath.amazin.api.productVariant;

public class Product {
    private Long id;
    private String otherIds;
//    private String seller;
//    private Double rating;
//    private Integer user_rating;
//    private Boolean tag;
//    private String tag_title;
//    private String category;
//    private String category_link;
//    private String similar_item;

    public Product() {
    }

    public Product(long id, String otherIds
//     , String seller, Double rating, Integer user_rating, Boolean tag, String tag_title, String category, String category_link, String similar_item
    ) {
        super();
        this.id = id;
        this.otherIds = otherIds;
//        this.seller = seller;
//        this.rating = rating;
//        this.user_rating = user_rating;
//        this.tag = tag;
//        this.tag_title = tag_title;
//        this.category = category;
//        this.category_link = category_link;
//        this.similar_item = similar_item;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOtherIds() {
        return otherIds;
    }

    public void setOtherIds(String otherIds) {
        this.otherIds = otherIds;
    }

//    public String getSeller() {
//        return seller;
//    }
//
//    public void setSeller(String seller) {
//        this.seller = seller;
//    }
//
//    public Double getRating() {
//        return rating;
//    }
//
//    public void setRating(Double rating) {
//        this.rating = rating;
//    }
//
//    public Integer getUser_rating() {
//        return user_rating;
//    }
//
//    public void setUser_rating(Integer user_rating) {
//        this.user_rating = user_rating;
//    }
//
//    public Boolean getTag() {
//        return tag;
//    }
//
//    public void setTag(Boolean tag) {
//        this.tag = tag;
//    }
//
//    public String getTag_title() {
//        return tag_title;
//    }
//
//    public void setTag_title(String tag_title) {
//        this.tag_title = tag_title;
//    }
//
//    public String getCategory() {
//        return category;
//    }
//
//    public void setCategory(String category) {
//        this.category = category;
//    }
//
//    public String getCategory_link() {
//        return category_link;
//    }
//
//    public void setCategory_link(String category_link) {
//        this.category_link = category_link;
//    }
//
//    public String getSimilar_item() {
//        return similar_item;
//    }
//
//    public void setSimilar_item(String similar_item) {
//        this.similar_item = similar_item;
//    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((otherIds == null) ? 0 : otherIds.hashCode());
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Product other = (Product) obj;
        // id comparison
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        // arrayOfOtherIds comparison
        if (otherIds == null) {
            if (other.otherIds != null)
                return false;
        } else if (!otherIds.equals(other.otherIds))
            return false;
        return true;
    }
}
