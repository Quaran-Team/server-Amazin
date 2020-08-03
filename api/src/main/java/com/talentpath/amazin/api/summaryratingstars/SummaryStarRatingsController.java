package com.talentpath.amazin.api.summaryratingstars;


import com.talentpath.amazin.api.entities.Item;
import com.talentpath.amazin.api.repositories.ItemsRepository;
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
    private ItemsRepository itemsRepository;

    @GetMapping
    @Query("SELECT * FROM items")
    public List<Item> getAllItems() {
        return itemsRepository.findAll();
    }

    @GetMapping("/{id}")
    public Item getItemById(@PathVariable("id") long id) {
        return itemsRepository.getOne(id);
    }
}
