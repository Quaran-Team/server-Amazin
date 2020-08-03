package com.talentpath.amazin.api.productVariant;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class ProductResource {

    @Autowired
    private ProductHardcodedService productService;

    @GetMapping("/variant/product")
    public List<Product> getAllProducts() {
        return productService.findAll();
    }
}
