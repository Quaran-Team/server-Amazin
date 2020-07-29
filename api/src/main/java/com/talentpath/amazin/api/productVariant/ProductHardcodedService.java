package com.talentpath.amazin.api.productVariant;

import java.util.ArrayList;
import java.util.List;

import com.talentpath.amazin.api.qAndA.QAndA;
import org.springframework.stereotype.Service;

@Service
public class ProductHardcodedService {
    private static List<Product> products = new ArrayList<>();
    private static long idCounter = 0;

//    static {
//        products.add(new Product(++idCounter));
//        products.add(new Product(++idCounter));
//        products.add(new Product(++idCounter));
//    }

    public List<Product> findAll() {
        return products;
    }
}
