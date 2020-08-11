package com.talentpath.amazin.api.productVariant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = { "http://localhost:3000" })
@RequestMapping("/variant/feature")
@RestController
public class FeatureResource {

    @Autowired
    private FeatureRepo featureService;

    @GetMapping("/")
    @Query("SELECT * FROM featurev")
    public List<Feature> getAllFeatures() {
        return (List<Feature>) featureService.findAll();
    }

    @GetMapping("/{featureid}")
    @Query("SELECT * FROM featurev WHERE featureid = :featureid")
    public Optional<Feature> getByIdFeature(@PathVariable("featureid") long featureid){
        return featureService.findById(featureid);
    }

    @PostMapping("/save")
    @Query("INSERT INTO featurev (title, rating, user_rating ) VALUES (:title, :rating, :user_rating)")
    public Feature createFeature(@RequestBody Feature feature){
        return featureService.save(feature);
    }

    @DeleteMapping("/{featureid}")
    @Query("DELETE FROM featurev WHERE featureid = :featureid")
    public void deleteByIdFeature(@PathVariable("featureid") long featureid){
        featureService.deleteById(featureid);
    }
}
