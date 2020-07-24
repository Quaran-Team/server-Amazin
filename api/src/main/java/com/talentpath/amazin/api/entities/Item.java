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
@Table(name = "items")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long itemId;

    @NotBlank
    private String itemName;

    @NotNull
    @Column(precision = 10, scale = 2)
    private BigDecimal itemPrice;

    @NotBlank
    private String itemTitle;

    @NotBlank
    private String[] itemAbout;

    @NotBlank
    private String itemDescription;
}