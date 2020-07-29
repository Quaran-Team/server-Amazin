package com.talentpath.amazin.api.productVariant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

public class SelectorResource {
    @Autowired
    private SelectorHardcodedService selectorService;

    @GetMapping("/variant/selector")
    public List<Selector> getAllSelectors() {
        return selectorService.findAll();
    }
}
