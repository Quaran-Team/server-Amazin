package com.talentpath.amazin.api.answers;

import java.util.List;

import com.talentpath.amazin.api.answers.AnswersRepository;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.CrossOrigin;



@CrossOrigin(origins = { "http://localhost:3000" })

@RequestMapping("/answers")
@RestController
public class AnswersResource {

    @Autowired
    private AnswersRepository answersRepository;

    @GetMapping("/")
    @Query("SELECT * FROM answers")
    public List<Answers> getAllAnswers() {
        return (List<Answers>) answersRepository.findAll();
    }


    // @GetMapping("/{questionId}")
    // public Answers getAnswers( @PathVariable long questionId) {
    //     return answersRepository.findById(questionId);
    // }
}