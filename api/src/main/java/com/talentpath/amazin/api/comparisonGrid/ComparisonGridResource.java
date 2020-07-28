package com.talentpath.amazin.api.comparisonGrid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin(origins = { "http://localhost:3000", "http://localhost:4200" })
@RestController
public class ComparisonGridResource {

    @Autowired
    private ComparisonGridService ComparisonGridManagementService;

    @GetMapping("/all/products")
    public List<ComparisonItem> getAll() {
        return ComparisonGridManagementService.findAll();
    }

    @GetMapping("/all/products/{id}")
    public ComparisonItem getAll(@PathVariable long id) {
        return ComparisonGridManagementService.findById(id);
    }
}
