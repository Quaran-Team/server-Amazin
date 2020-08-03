package com.talentpath.amazin.api.summaryratingstars;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;


@Entity
@Data // Lombok annotation; tells it to create getters and setters
@AllArgsConstructor // lombok annotation to create constructor with all args
@NoArgsConstructor // lombok annotation to create no-args constructor
//@Accessors(chain = true)
@DynamicInsert
@Table(name = "bwl01", schema = "public")

public class SummaryStarRatings {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long itemId;

    @NotBlank
    private int overallRating;


    @NotBlank
    private int totalFiveStarRating;

    @NotBlank
    private int totalFourStarRating;

    @NotBlank
    private int totalThreeStarRating;

    @NotBlank
    private int totalTwoStarRating;

    @NotBlank
    private int totalOneStarRating;
}
