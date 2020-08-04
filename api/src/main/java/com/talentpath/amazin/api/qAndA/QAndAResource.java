package com.talentpath.amazin.api.qAndA;

import java.util.List;

import com.talentpath.amazin.api.qAndA.QAndAsRepository;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.CrossOrigin;



@CrossOrigin(origins = { "http://localhost:3000" })

@RequestMapping("/qAndAs")
@RestController
public class QAndAResource {

    @Autowired
    private QAndAsRepository qAndARepository;

    @GetMapping("/")
    @Query("SELECT * FROM questions")
    public List<QAndA> getAllQAndAs() {
        return (List<QAndA>) qAndARepository.findAll();
    }


    // @GetMapping("/{id}")
    // public QAndA getQAndA( @PathVariable long id) {
    //     return qAndARepository.findById(id);
    // }
}