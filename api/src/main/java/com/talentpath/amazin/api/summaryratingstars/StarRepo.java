package com.talentpath.amazin.api.summaryratingstars;



import com.talentpath.amazin.api.summaryratingstars.SummaryStarRatings;
import org.springframework.data.jpa.repository.JpaRepository;


public interface StarRepo extends JpaRepository<SummaryStarRatings, Long> {
}
