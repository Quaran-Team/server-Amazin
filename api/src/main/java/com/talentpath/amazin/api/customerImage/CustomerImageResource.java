package com.talentpath.amazin.api.customerImage;

import java.util.List;

import com.talentpath.amazin.api.customerImage.CustomerImageRepo;
import java.util.Optional;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = { "http://localhost:3000" })
@RequestMapping("/customerImages")
@RestController
public class CustomerImageResource {

    @Autowired
    private CustomerImageRepo customerImageRepo;

    @GetMapping("/")
    @Query("SELECT * FROM jca0")
    public List<CustomerImage> getAllCustomerImages() {
        return (List<CustomerImage>) customerImageRepo.findAll();
    }

    @GetMapping("/{itemid}")
    @Query("SELECT * FROM jca0 WHERE itemid = :itemid")
    public Optional<CustomerImage> getCustomerImageById(@PathVariable("itemid") long itemid){
        return customerImageRepo.findById(itemid);
    }

}