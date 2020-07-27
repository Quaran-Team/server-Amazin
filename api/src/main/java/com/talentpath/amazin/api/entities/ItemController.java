package com.talentpath.amazin.api.entities;

import com.talentpath.amazin.api.repositories.ItemsRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ItemController {
    @Autowired
    private ItemsRepository itemsRepository;

    @GetMapping("/items")
    public Iterable<Item> getAllItems() {
        return itemsRepository.findAll();
    }
}