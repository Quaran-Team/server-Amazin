package com.talentpath.amazin.api.comparisonGrid;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ComparisonGridService  {

    private static List<ComparisonItem> products = new ArrayList<>();
    private static long idCounter = 0;

    static {
        products.add(new ComparisonItem(idCounter++, "Kindle", 99.99, 4, 1));
        products.add(new ComparisonItem(idCounter++, "Kindle Paperwhite", 199.99, 5, 2));
        products.add(new ComparisonItem(idCounter++, "Kindle Oasis", 299.99, 3, 3));
    }

    public List<ComparisonItem> findAll() {
        return products;
    }

    public ComparisonItem findById(long id) {
        for (ComparisonItem comparisonItem : products) {
            if (comparisonItem.getId() == id) {
                return comparisonItem;
            }
        }
        return null;
    }
}