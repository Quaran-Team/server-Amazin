package com.talentpath.amazin.api.customerWhoBoughtAlso;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CustomerWhoBoughtAlsosHardcodedService {

    private static List<CustomerWhoBoughtAlso> customerWhoBoughtAlsos = new ArrayList<>();
    private static long idCounter = 0;

    static {
        customerWhoBoughtAlsos.add(new CustomerWhoBoughtAlso(++idCounter, "5L"));
        customerWhoBoughtAlsos.add(new CustomerWhoBoughtAlso(++idCounter, "10L"));
        customerWhoBoughtAlsos.add(new CustomerWhoBoughtAlso(++idCounter, "15L"));
    }

    public List<CustomerWhoBoughtAlso> findAll() {
        return customerWhoBoughtAlsos;
    }
}