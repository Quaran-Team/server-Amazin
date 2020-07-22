package com.talentpath.amazin.api.qAndA;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class QAndA {

    @Autowired
    private QAndAsHardcodedService qAndAManagementService;

    @GetMapping("/qAndA")
    public List<QAndA> getAllQAndAs() {
        return qAndAManagementService.findAll();
    }
}