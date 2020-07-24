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

import org.hibernate.annotations.ColumnDefault;

@Entity
@Data // Lombok annotation; tells it to create getters and setters
@AllArgsConstructor // lombok annotation to create constructor with all args
@NoArgsConstructor // lombok annotation to create no-args constructor
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
    @ColumnDefault("this is a great product, it looks great")
    private String itemAbout;

    @NotBlank
    @ColumnDefault("This is a product, etc., etc.")
    private String itemDescription;
}