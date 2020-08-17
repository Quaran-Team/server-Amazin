package com.talentpath.amazin.api.prime;

import com.talentpath.amazin.api.prime.Prime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PrimeRepo extends JpaRepository<Prime, Long> {
}