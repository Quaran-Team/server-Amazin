package com.talentpath.amazin.api.customerImage;

public class CustomerImage {
    private Long id;
    private String imageLinks;

    public CustomerImage(){

    }

    public CustomerImage(long id, String imageLinks){
        super();
        this.id = id;
        this.imageLinks = imageLinks;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImageLinks() {
        return imageLinks;
    }

    public void setImageLinks(String imageLinks) {
        this.imageLinks = imageLinks;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((imageLinks == null) ? 0 : imageLinks.hashCode());
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        CustomerImage other = (CustomerImage) obj;
        // id comparison
        if (id == null) {
            if (other.id != null) return false;
        }
        else if (!id.equals(other.id)) return false;
        // arrayOfImageLinks comparison
        if (imageLinks == null) {
            if (other.imageLinks != null) return false;
        }
        else if (!imageLinks.equals(other.imageLinks)) return false;
        return true;
    }



}