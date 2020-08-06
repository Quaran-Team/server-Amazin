package com.talentpath.amazin.api.productVariant;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = { "http://localhost:3000"})
@RequestMapping("/variant/detail")
@RestController
public class DetailResource {

    @Autowired
    private DetailRepo detailService;

    @GetMapping("/")
    @Query("SELECT * from detailv")
    public List<Detail> getAllDetails() {
        return (List<Detail>) detailService.findAll();
    }

    @GetMapping("/{detailvid}")
    @Query("SELECT * FROM detailv WHERE detailvid = :detailvid")
    public Optional<Detail> getByIdDetail(@PathVariable("detailvid") long detailvid){
        return detailService.findById(detailvid);
    }

    @PostMapping("/save")
    @Query("INSERT INTO detailv (selectorid, feature, detail) VALUES (feature, detail)")
    public Detail createDetail(@RequestBody Detail detail){
        return detailService.save(detail);
    }

    @DeleteMapping("/{detailvid}")
    @Query("DELETE FROM detailv WHERE productvid = :detailvid")
    public void deleteByIdDetail(@PathVariable("detailvid") long detailvid){
        detailService.deleteById(detailvid);
    }
}
