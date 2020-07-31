package com.talentpath.amazin.api.qAndA;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.CrossOrigin;



@CrossOrigin(origins = { "http://localhost:3000" })
@RestController
public class QAndAResource {

    @Autowired
    private QAndAsHardcodedService qAndAManagementService;

    @GetMapping("/qAndA")
    public List<QAndA> getAllQAndAs() {
        return qAndAManagementService.findAll();
    }

    @GetMapping("/qAndA/{id}")
    public QAndA getQAndA( @PathVariable long id) {
        return qAndAManagementService.findById(id);
    }
}