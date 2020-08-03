package com.talentpath.amazin.api.productVariant;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class DetailHardcodedService {
    private static List<Detail> details = new ArrayList<>();
    private static long idCounter = 0;

//    static {
//        qAndAs.add(new QAndA(++idCounter, "question0", "answers0", 100));
//        qAndAs.add(new QAndA(++idCounter, "question1", "answers1", 10));
//        qAndAs.add(new QAndA(++idCounter, "question2", "answers2", 50));
//    }

    public List<Detail> findAll() {
        return details;
    }
}
