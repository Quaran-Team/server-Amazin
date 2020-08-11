package com.talentpath.amazin.api.customerWhoBoughtAlso;

import java.util.List;

import com.talentpath.amazin.api.customerWhoBoughtAlso.CustomerWhoBoughtAlsoRepo;
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
@RequestMapping("/customerWhoBoughtAlso")
@RestController
public class CustomerWhoBoughtAlsoResource {

    @Autowired
    private CustomerWhoBoughtAlsoRepo customerWhoBoughtAlsoRepo;

    @GetMapping("/")
    @Query("SELECT * FROM jca1")
    public List<CustomerWhoBoughtAlso> getAllCustomerWhoBoughtAlsos() {
        return (List<CustomerWhoBoughtAlso>) customerWhoBoughtAlsoRepo.findAll();
    }

    @GetMapping("/{itemid}")
    @Query("SELECT * FROM jca1 WHERE itemid = :itemid")
    public Optional<CustomerWhoBoughtAlso> getCustomerWhoBoughtAlsoById(@PathVariable("itemid") long itemid){
        return customerWhoBoughtAlsoRepo.findById(itemid);
    }

}