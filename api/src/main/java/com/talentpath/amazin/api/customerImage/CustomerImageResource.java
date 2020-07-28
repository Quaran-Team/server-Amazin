package com.talentpath.amazin.api.customerImage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = { "http://localhost:3000" })
@RestController
public class CustomerImageResource {

    @Autowired
    private CustomerImagesHardcodedService customerImageManagementService;

    @GetMapping("/customerImages")
    public List<CustomerImage> getAllCustomerImages() {
        return customerImageManagementService.findAll();
    }

    @GetMapping("/customerImages/{id}")
    public CustomerImage getCustomerImage( @PathVariable long id) {
        return customerImageManagementService.findById(id);
    }
}