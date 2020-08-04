package com.talentpath.amazin.api.comparisonGrid;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "items", schema = "public")
public class ComparisonItem {

    @Id

    @Column(name = "itemid")
    private Long id;
    @Column(name = "itemname")
    private String name;
    @Column(name = "itemprice")
    private Long price;
    @Column(name = "itemtitle")
    private String title;
    @Column(name = "itemabout")
    private String about;
    @Column(name = "itemdescription")
    private String description;

    public ComparisonItem() {

    }

    public ComparisonItem(Long id, String name, Long price, String rating, String modes, String description){
        super();
        this.id = id;
        this.name = name;
        this.price = price;
        this.title = rating;
        this.about = modes;
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getRating() {
        return title;
    }

    public void setRating(String title) {
        this.title = title;
    }

    public String getModes() {
        return about;
    }

    public void setModes(String about) {
        this.about = about;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
