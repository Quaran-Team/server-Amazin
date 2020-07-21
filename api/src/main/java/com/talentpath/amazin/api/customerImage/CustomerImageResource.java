package com.talentpath.amazin.api.customerImage;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class CustomerImageResource {

    @Autowired
    private CustomerImagesHardcodedService customerImageManagementService;

    @GetMapping("/customerImages")
    public List<CustomerImage> getAllCustomerImages() {
        return customerImageManagementService.findAll();
    }
}