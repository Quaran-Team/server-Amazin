package com.talentpath.amazin.api.repositories;

import com.talentpath.amazin.api.entities.Item;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ItemsRepository extends JpaRepository<Item, Long> {

    // @Query("SELECT i FROM items i where i.itemId = :id")
    // public Item getItemById(long id);

}