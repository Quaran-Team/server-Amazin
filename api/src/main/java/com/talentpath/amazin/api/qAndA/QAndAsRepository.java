package com.talentpath.amazin.api.qAndA;

import com.talentpath.amazin.api.qAndA.QAndA;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface QAndAsRepository extends JpaRepository<QAndA, Long> {
}