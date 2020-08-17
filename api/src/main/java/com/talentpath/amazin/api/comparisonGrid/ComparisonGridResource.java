package com.talentpath.amazin.api.comparisonGrid;

import org.springframework.data.jpa.repository.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;

import java.util.List;

@CrossOrigin(origins = { "http://localhost:3000", "http://localhost:4200" })
@RestController

public class ComparisonGridResource {

    @Autowired
    private ComparisonGridRepo comparisonGridRepo;

    @GetMapping("/all/products/")
    @Query("SELECT * FROM items")
    public List<ComparisonItem> getAll() {
        return comparisonGridRepo.findAll();
    }

    @GetMapping("/{id}")
    public ComparisonItem getItemById(@PathVariable("id") long id) {
        return comparisonGridRepo.getOne(id);
    }

    @GetMapping("/products/{category}")
    public List<ComparisonItem> getItemById(@PathVariable("category") String category) {
        return comparisonGridRepo.findByCategory(category);
    }

}
