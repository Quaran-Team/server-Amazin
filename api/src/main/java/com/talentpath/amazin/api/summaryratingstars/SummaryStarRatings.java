package com.talentpath.amazin.api.summaryratingstars;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity // JPA - annotation used to indicate that the class is a JPA entity class!
@Data // Lombok annotation tells it to create all getters and setters
@AllArgsConstructor // Lombok annotation to create constructor with all args
@NoArgsConstructor // Lombok annotation to create no-args constructor
@DynamicInsert // JPA - when the insert object is generated, generate a dynamic insert statement
@Table(name = "bwl01", schema = "public") // provided by JPA to specify more details about the table associated to the class.

public class SummaryStarRatings {

    @Id
    @Column(name = "ratingid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long ratingId;

    @Column(name = "overallrating")
    @NotBlank
    private float overallRating;

    @Column(name = "totalfivestarrating")
    @NotBlank
    private int totalFiveStarRating;

    @Column(name = "totalfourstarrating")
    @NotBlank
    private int totalFourStarRating;

    @Column(name = "totalthreestarrating")
    @NotBlank
    private int totalThreeStarRating;

    @Column(name = "totaltwostarrating")
    @NotBlank
    private int totalTwoStarRating;

    @Column(name = "totalonestarrating")
    @NotBlank
    private int totalOneStarRating;
}
