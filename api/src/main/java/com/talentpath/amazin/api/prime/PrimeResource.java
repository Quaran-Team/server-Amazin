package com.talentpath.amazin.api.prime;

import java.util.List;

import com.talentpath.amazin.api.prime.Prime;
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
@RequestMapping("/prime")
@RestController
public class PrimeResource {

    @Autowired
    private PrimeRepo primeRepo;

    @GetMapping("/")
    @Query("SELECT * FROM jca2")
    public List<Prime> getAllPrimes() {
        return (List<Prime>) primeRepo.findAll();
    }

    @GetMapping("/{itemid}")
    @Query("SELECT * FROM jca2 WHERE itemid = :itemid")
    public Optional<Prime> getPrimeById(@PathVariable("itemid") long itemid){
        return primeRepo.findById(itemid);
    }

}