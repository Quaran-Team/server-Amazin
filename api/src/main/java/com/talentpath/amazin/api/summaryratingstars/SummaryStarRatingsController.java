package com.talentpath.amazin.api.summaryratingstars;


import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.*;




@CrossOrigin(origins = {"http://localhost:3000"})
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
