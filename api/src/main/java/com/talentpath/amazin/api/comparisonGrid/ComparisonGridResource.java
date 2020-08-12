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

/*  @GetMapping("/all/products/{itemid}")
  @Query("SELECT * FROM items WHERE itemid = :itemid")
    public Optional<ComparisonItem> getByIdProduct(@PathVariable("itemid") long itemid) {
        return ComparisonGridRepo.findById(itemid);
    }*/
}
