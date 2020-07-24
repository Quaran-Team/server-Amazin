package com.talentpath.amazin.api.repositories;

import com.talentpath.amazin.api.entities.Item;
import org.springframework.data.repository.CrudRepository;

public interface ItemsRepository extends CrudRepository<Item, Long> {

}