package com.talentpath.amazin.api.productVariant;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepo extends JpaRepository<Product, Long> {

}
