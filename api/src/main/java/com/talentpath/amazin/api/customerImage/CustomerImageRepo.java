package com.talentpath.amazin.api.customerImage;

import com.talentpath.amazin.api.customerImage.CustomerImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CustomerImageRepo extends JpaRepository<CustomerImage, Long> {
}