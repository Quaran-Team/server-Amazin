package com.talentpath.amazin.api.productVariant;
import java.net.URI;
import java.util.List;

import com.talentpath.amazin.api.qAndA.QAndA;
import com.talentpath.amazin.api.qAndA.QAndAsHardcodedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class DetailResource {
    @Autowired
    private DetailHardcodedService detailService;

    @GetMapping("/variant/detail")
    public List<Detail> getAllDetails() {
        return detailService.findAll();
    }
}
