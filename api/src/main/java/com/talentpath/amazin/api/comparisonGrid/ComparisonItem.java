package com.talentpath.amazin.api.comparisonGrid;

import lombok.*;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import org.hibernate.annotations.DynamicInsert;

@Entity
@Data // Lombok annotation; tells it to create getters and setters
@AllArgsConstructor // lombok annotation to create constructor with all args
@NoArgsConstructor // lombok annotation to create no-args constructor
@DynamicInsert
@Table(name = "items", schema = "public")
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class ComparisonItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column (name="itemid")
    private long itemId;

    @Column (name="itemname")
    private String itemName;

    @Column(name="itemprice", precision = 10, scale = 2)
    private String itemPrice;

    @Column (name="itemdescription")
    private String itemDescription;

    @Column (name="itemrating")
    private String itemRating;

    @Column (name="itemcolor")
    private String itemColor;

    @Column (name="itemsound")
    private String itemSound;

    @Column (name="itemcategory")
    private String category;

    @Column (name="itempower")
    private String itemPower;

    @Column (name="itemcapacity")
    private String itemCapacity;
    
    @Column (name="itemmode")
    private String itemMode;
    
}
