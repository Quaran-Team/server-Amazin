package com.talentpath.amazin.api.customerWhoBoughtAlso;

import com.talentpath.amazin.api.customerWhoBoughtAlso.CustomerWhoBoughtAlso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CustomerWhoBoughtAlsoRepo extends JpaRepository<CustomerWhoBoughtAlso, Long> {
}