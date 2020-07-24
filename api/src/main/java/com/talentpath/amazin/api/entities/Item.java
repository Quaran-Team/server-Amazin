package com.talentpath.amazin.api.entities;

import lombok.*;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.vladmihalcea.hibernate.type.array.ListArrayType;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

@Entity
@Data // Lombok annotation; tells it to create getters and setters
@AllArgsConstructor // lombok annotation to create constructor with all args
@NoArgsConstructor // lombok annotation to create no-args constructor
@DynamicInsert
@TypeDef(name = "list-array", typeClass = ListArrayType.class)
@Table(name = "items")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long itemId;

    @NotBlank
    private String itemName;

    @NotNull
    @ColumnDefault("1.00")
    @Column(precision = 10, scale = 2)
    private BigDecimal itemPrice;

    @NotBlank
    @ColumnDefault("long(er) product title/name")
    private String itemTitle;

    @NotBlank
    @Type(type = "list-array")
    @Column(name = "item_about", columnDefinition = "text[]")
    private String[] itemAbout;

    @NotBlank
    @ColumnDefault("This is a product, etc., etc.")
    private String itemDescription;
}