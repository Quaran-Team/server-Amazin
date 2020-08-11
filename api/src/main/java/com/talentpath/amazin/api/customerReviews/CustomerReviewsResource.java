package com.talentpath.amazin.api.customerReviews;

import java.util.List;
import java.util.Optional;

import com.talentpath.amazin.api.customerReviews.CustomerReviewsRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = { "http://localhost:3000" })
@RequestMapping("/customerReviews")
@RestController
public class CustomerReviewsResource {

    @Autowired
    private CustomerReviewsRepo customerReviewsRepo;

    @GetMapping("/")
    @Query("SELECT * FROM customerreviews")
    public List<CustomerReviews> getAllCustomerReviews() {
        return (List<CustomerReviews>) customerReviewsRepo.findAll();
    }

    @GetMapping("/{id}")
    @Query("SELECT * FROM id WHERE id = :id")
    public Optional<CustomerReviews> getByIdCustomerReviews(@PathVariable("id") long id){
        return customerReviewsRepo.findById(id);
    }
}
