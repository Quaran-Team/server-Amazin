package com.talentpath.amazin.api.summaryratingstars;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/totalstars")

public class SummaryStarRatingsController {

    @Autowired
    private StarRepo starRepo;

    @GetMapping
    @Query("SELECT * FROM bwl01")
    public List<SummaryStarRatings> getAllItems() {
        return starRepo.findAll();
    }

    @GetMapping("/{id}")
    public SummaryStarRatings getItemById(@PathVariable("id") long id) {
        return starRepo.getOne(id);
    }
}
