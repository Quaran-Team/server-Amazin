package com.talentpath.amazin.api.customerWhoBoughtAlso;

public class CustomerWhoBoughtAlso {
    private Long id;
    private String otherIds;

    public CustomerWhoBoughtAlso() {

    }

    public CustomerWhoBoughtAlso(long id, String otherIds) {
        super();
        this.id = id;
        this.otherIds = otherIds;
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
        CustomerWhoBoughtAlso other = (CustomerWhoBoughtAlso) obj;
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