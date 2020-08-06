package com.talentpath.amazin.api.productVariant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = {"http://localhost:3000"})
@RequestMapping("/variant/selector")
@RestController
public class SelectorResource {

    @Autowired
    private SelectorRepo selectorService;

    @GetMapping("/")
    @Query("SELECT * FROM selector")
    public List<Selector> getAllSelectors() {
        return (List<Selector>) selectorService.findAll();
    }

    @GetMapping("/{selectorid}")
    @Query("SELECT * FROM selector WHERE selectorid = :selectorid")
    public Optional<Selector> getByIdSelector(@PathVariable("selectorid") long selectorid){
        return selectorService.findById(selectorid);
    }

    @PostMapping("/save")
    @Query("INSERT INTO selector () VALUES (:)")
    public Selector createSelector(@RequestBody Selector selector){
        return selectorService.save(selector);
    }

    @DeleteMapping("/{selectorid}")
    @Query("DELETE FROM selector WHERE selectorid = :selectorid")
    public void deleteByIdSelector(@PathVariable("selectorid") long selectorid){
        selectorService.deleteById(selectorid);
    }
}
