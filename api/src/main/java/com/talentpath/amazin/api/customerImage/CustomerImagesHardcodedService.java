package com.talentpath.amazin.api.customerImage;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CustomerImagesHardcodedService {

    private static List<CustomerImage> customerImages = new ArrayList<>();
    private static long idCounter = 0;

    static {
        customerImages.add(new CustomerImage(++idCounter, "Primary"));
        customerImages.add(new CustomerImage(++idCounter, "Secondary"));
        customerImages.add(new CustomerImage(++idCounter, "Tertiary"));
    }

    public List<CustomerImage> findAll() {
        return customerImages;
    }

    public CustomerImage findById(long id) {
        for (CustomerImage customerImage : customerImages) {
            if (customerImage.getId() == id) {
                return customerImage;
            }
        }
        return null;
    }
}