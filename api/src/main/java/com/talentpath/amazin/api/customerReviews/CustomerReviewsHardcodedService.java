package com.talentpath.amazin.api.customerReviews;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CustomerReviewsHardcodedService {

    private static List<CustomerReviews> customerReviews = new ArrayList<>();
    private static long idCounter = 0;

    static {
        customerReviews.add(new CustomerReviews(++idCounter, "bilikis", "happy with my purchase"));
        customerReviews.add(new CustomerReviews(++idCounter, "bilikis", "happy with my purchase"));
    }

    public List<CustomerReviews> findAll() {
        return customerReviews;
    }

    public CustomerReviews findById(long id) {
        for (CustomerReviews customerReviews : customerReviews) {
            if (customerReviews.getId() == id) {
                return customerReviews;
            }
        }
        return null;
    }
}