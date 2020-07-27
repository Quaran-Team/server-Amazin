package com.talentpath.amazin.api.customerReviews;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class CustomerReviewsResource {

    @Autowired
    private CustomerReviewsHardcodedService customerReviewsManagementService;

    @GetMapping("/customerReviews")
    public List<CustomerReviews> getAllCustomerReviews() {
        return customerReviewsManagementService.findAll();
    }

    @GetMapping("/customerReviews/{id}")
    public CustomerReviews getCustomerReviews(@PathVariable long id) {
        return customerReviewsManagementService.findById(id);
    }

}

