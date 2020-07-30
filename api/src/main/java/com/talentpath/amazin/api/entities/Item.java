package com.talentpath.amazin.api.entities;

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
//@Accessors(chain = true)
@DynamicInsert
@Table(name = "items", schema = "public")
// @JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
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
    private String itemAbout;

    @NotBlank
    private String itemDescription;
}