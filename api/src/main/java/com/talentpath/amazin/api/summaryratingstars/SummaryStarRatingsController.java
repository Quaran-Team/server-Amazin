package com.talentpath.amazin.api.summaryratingstars;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/api/v1")

public class SummaryStarRatingsController {

    @Autowired
    private StarRepo starRepo;

    @GetMapping(value="/totalstars")
    @Query("SELECT * FROM bwl01")
    public List<SummaryStarRatings> getAllItems() {
        return starRepo.findAll();
    }

    @GetMapping(value="/totalstars/{ratingId}")
    @Query("SELECT * FROM bwl01 WHERE ratingId = :ratingId")
    public Optional<SummaryStarRatings> getItemById(@PathVariable("ratingId") long ratingId) {

        return starRepo.findById(ratingId);
    }
}
