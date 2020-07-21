package com.talentpath.amazin.api.customerWhoBoughtAlso;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class CustomerWhoBoughtAlsoResource {

    @Autowired
    private CustomerWhoBoughtAlsosHardcodedService customerWhoBoughtAlsoManagementService;

    @GetMapping("/customerWhoBoughtAlso")
    public List<CustomerWhoBoughtAlso> getAllCustomerWhoBoughtAlsos() {
        return customerWhoBoughtAlsoManagementService.findAll();
    }
}