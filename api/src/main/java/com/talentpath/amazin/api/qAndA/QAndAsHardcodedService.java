package com.talentpath.amazin.api.qAndA;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class QAndAsHardcodedService {

    private static List<QAndA> qAndAs = new ArrayList<>();
    private static long idCounter = 0;

    static {
        qAndAs.add(new QAndA(++idCounter, "5L"));
        qAndAs.add(new QAndA(++idCounter, "10L"));
        qAndAs.add(new QAndA(++idCounter, "15L"));
    }

    public List<QAndA> findAll() {
        return qAndAs;
    }
}