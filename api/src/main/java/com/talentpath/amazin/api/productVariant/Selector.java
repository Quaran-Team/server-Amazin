package com.talentpath.amazin.api.productVariant;

import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.*;

@Entity
@Table(name="selector", schema = "public")
public class Selector {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "selectorid")
    private Long id;;
    @Column(name = "productvid")
    private Long productvid;
    @Column(name = "title")
    private String title;
    @Column(name = "type_selector")
    private Integer type_selector;
    @Column(name = "selector_num")
    private Integer selector_num;
    @Column(name = "price")
    private Double price;
    @Column(name = "shipping")
    private Boolean shipping;
    @Column(name = "ship_price")
    private Double ship_price;
    @Column(name = "discount")
    private Boolean discount;
    @Column(name = "about_item")
    private String about_item;
    @Column(name = "selector_text")
    private String selector_text;
    @Column(name = "selector_img")
    private String selector_img;
    @Column(name = "isdefault")
    private Boolean isdefault;
    @Column(name = "instock")
    private Integer instock;
    @Column(name = "list_price")
    private Double list_price;
    @Column(name = "message")
    private String message;
    @Column(name = "lowstock_message")
    private String lowstock_message;
    @Column(name = "shipping_message")
    private String shipping_message;
    @Column(name = "type_title")
    private String type_title;

    public Selector() {
    }

    public Selector(long id
    , Long productvid, String title, Integer type_selector, Integer selector_num, Double price, Boolean shipping, Double ship_price, Boolean discount, String about_item, String selector_text, String selector_img, Boolean isdefault, Integer instock, Double list_price, String message, String lowstock_message, String shipping_message, String type_title
    ) {
        super();
        this.id = id;
        this.productvid = productvid;
        this.title = title;
        this.type_selector = type_selector;
        this.selector_num = selector_num;
        this.price = price;
        this.shipping = shipping;
        this.ship_price = ship_price;
        this.discount = discount;
        this.about_item = about_item;
        this.selector_text = selector_text;
        this.selector_img = selector_img;
        this.isdefault = isdefault;
        this.instock = instock;
        this.list_price = list_price;
        this.message = message;
        this.lowstock_message = lowstock_message;
        this.shipping_message = shipping_message;
        this.type_title = type_title;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProductID() {
        return productvid;
    }

    public void setProductID(Long productvid) {
        this.productvid = productvid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getType_selector() {
        return type_selector;
    }

    public void setType_selector(Integer type_selector) {
        this.type_selector = type_selector;
    }

    public Integer getSelector_num() {
        return selector_num;
    }

    public void setSelector_num(Integer selector_num) {
        this.selector_num = selector_num;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Boolean getShipping() {
        return shipping;
    }

    public void setShipping(Boolean shipping) {
        this.shipping = shipping;
    }

    public Double getShip_price() {
        return ship_price;
    }

    public void setShip_price(Double ship_price) {
        this.ship_price = ship_price;
    }

    public Boolean getDiscount() {
        return discount;
    }

    public void setDiscount(Boolean discount) {
        this.discount = discount;
    }

    public String getAbout_item() {
        return about_item;
    }

    public void setAbout_item(String about_item) {
        this.about_item = about_item;
    }

    public String getSelector_text() {
        return selector_text;
    }

    public void setSelector_text(String selector_text) {
        this.selector_text = selector_text;
    }

    public String getSelector_img() {
        return selector_img;
    }

    public void setSelector_img(String selector_img) {
        this.selector_img = selector_img;
    }

    public Boolean getIsdefault() {
        return isdefault;
    }

    public void setIsdefault(Boolean isdefault) {
        this.isdefault = isdefault;
    }

    public Integer getInstock() {
        return instock;
    }

    public void setInstock(Integer instock) {
        this.instock = instock;
    }

    public Double getList_price() {
        return list_price;
    }

    public void setList_price(Double list_price) {
        this.list_price = list_price;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getLowstock_message() {
        return lowstock_message;
    }

    public void setLowstock_message(String lowstock_message) {
        this.lowstock_message = lowstock_message;
    }

    public String getShipping_message() {
        return shipping_message;
    }

    public void setShipping_message(String shipping_message) {
        this.shipping_message = shipping_message;
    }

    public String getType_title() {
        return type_title;
    }

    public void setType_title(String type_title) {
        this.type_title = type_title;
    }
}
