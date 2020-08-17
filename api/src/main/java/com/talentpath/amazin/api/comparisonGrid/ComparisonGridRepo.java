package com.talentpath.amazin.api.comparisonGrid;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ComparisonGridRepo extends JpaRepository<ComparisonItem, Long> {

    List<ComparisonItem> findByCategory(String itemCategory);
}
