package com.talentpath.amazin.api.productVariant;

public class Selector {
    private Long id;
    private String otherIds;
//    private Long productID;
//    private String title;
//    private String type_selector;
//    private Integer selector_num;
//    private Double price;
//    private Boolean shipping;
//    private Double ship_price;
//    private Boolean discount;
//    private Double discount_price;
//    private String about_item;
//    private String selector_text;
//    private String selector_img;
//    private Boolean isDefault;
//    private Integer inStock;

    public Selector() {
    }

    public Selector(long id, String otherIds
//    , Long productID, String title, String type_selector, Integer selector_num, Double price, Boolean shipping, Double ship_price, Boolean discount, Double discount_price, String about_item, String selector_text, String selector_img, Boolean isDefault, Integer inStock
    ) {
        super();
        this.id = id;
        this.otherIds = otherIds;
//        this.productID = productID;
//        this.title = title;
//        this.type_selector = type_selector;
//        this.selector_num = selector_num;
//        this.price = price;
//        this.shipping = shipping;
//        this.ship_price = ship_price;
//        this.discount = discount;
//        this.discount_price = discount_price;
//        this.about_item = about_item;
//        this.selector_text = selector_text;
//        this.selector_img = selector_img;
//        this.isDefault = isDefault;
//        this.inStock = inStock;

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

//    public void setOtherIds(String otherIds) {
//        this.otherIds = otherIds;
//    }
//
//    public Long getProductID() {
//        return productID;
//    }
//
//    public void setProductID(Long productID) {
//        this.productID = productID;
//    }
//
//    public String getTitle() {
//        return title;
//    }
//
//    public void setTitle(String title) {
//        this.title = title;
//    }
//
//    public String getType_selector() {
//        return type_selector;
//    }
//
//    public void setType_selector(String type_selector) {
//        this.type_selector = type_selector;
//    }
//
//    public Integer getSelector_num() {
//        return selector_num;
//    }
//
//    public void setSelector_num(Integer selector_num) {
//        this.selector_num = selector_num;
//    }
//
//    public Double getPrice() {
//        return price;
//    }
//
//    public void setPrice(Double price) {
//        this.price = price;
//    }
//
//    public Boolean getShipping() {
//        return shipping;
//    }
//
//    public void setShipping(Boolean shipping) {
//        this.shipping = shipping;
//    }
//
//    public Double getShip_price() {
//        return ship_price;
//    }
//
//    public void setShip_price(Double ship_price) {
//        this.ship_price = ship_price;
//    }
//
//    public Boolean getDiscount() {
//        return discount;
//    }
//
//    public void setDiscount(Boolean discount) {
//        this.discount = discount;
//    }
//
//    public Double getDiscount_price() {
//        return discount_price;
//    }
//
//    public void setDiscount_price(Double discount_price) {
//        this.discount_price = discount_price;
//    }
//
//    public String getAbout_item() {
//        return about_item;
//    }
//
//    public void setAbout_item(String about_item) {
//        this.about_item = about_item;
//    }
//
//    public String getSelector_text() {
//        return selector_text;
//    }
//
//    public void setSelector_text(String selector_text) {
//        this.selector_text = selector_text;
//    }
//
//    public String getSelector_img() {
//        return selector_img;
//    }
//
//    public void setSelector_img(String selector_img) {
//        this.selector_img = selector_img;
//    }
//
//    public Boolean getDefault() {
//        return isDefault;
//    }
//
//    public void setDefault(Boolean aDefault) {
//        isDefault = aDefault;
//    }
//
//    public Boolean getInStock() {
//        return inStock;
//    }
//
//    public void setInStock(Boolean inStock) {
//        this.inStock = inStock;
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
        Selector other = (Selector) obj;
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
