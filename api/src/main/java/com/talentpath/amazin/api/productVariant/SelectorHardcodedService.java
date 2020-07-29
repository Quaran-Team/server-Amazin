package com.talentpath.amazin.api.productVariant;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class SelectorHardcodedService {
    private static List<Selector> selectors = new ArrayList<>();
    private static long idCounter = 0;

//    static {
//        selectors.add(new Selector(++idCounter, "question0", "answers0", 100));
//        qAndAs.add(new Selector(++idCounter, "question1", "answers1", 10));
//        qAndAs.add(new QAndA(++idCounter, "question2", "answers2", 50));
//    }

    public List<Selector> findAll() {
        return selectors;
    }
}
