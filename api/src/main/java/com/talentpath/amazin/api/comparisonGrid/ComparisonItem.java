package com.talentpath.amazin.api.comparisonGrid;

public class ComparisonItem {

    private long id;
    private String name;
    private Double price;
    private int rating;
    private int modes;

    public ComparisonItem() {

    }

    public ComparisonItem(long id, String name, Double price, int rating, int modes){
        super();
        this.id = id;
        this.name = name;
        this.price = price;
        this.rating = rating;
        this.modes = modes;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getModes() {
        return modes;
    }

    public void setModes(int modes) {
        this.modes = modes;
    }
}
