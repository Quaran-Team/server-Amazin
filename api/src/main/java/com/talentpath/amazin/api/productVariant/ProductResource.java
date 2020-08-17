package com.talentpath.amazin.api.productVariant;

import java.util.List;
import java.util.Optional;

import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


@CrossOrigin(origins = { "http://localhost:3000"})
@RequestMapping("/variant/product")
@RestController
public class ProductResource {

    @Autowired
    private ProductRepo productService;

    @GetMapping("/")
    @Query("SELECT * FROM productv")
    public List<Product> getAllProduct() {
        return (List<Product>) productService.findAll();
    }

    @GetMapping("/{productvid}")
    @Query("SELECT * FROM productv WHERE productvid = :productvid")
    public Optional<Product> getByIdProduct(@PathVariable("productvid") long productvid){
        return productService.findById(productvid);
    }

    @PostMapping("/save")
    @Query("INSERT INTO productv (seller, rating, user_rating, tag, tag_title, category, category_link, similar_item) VALUES (:seller, :rating, :user_rating, :tag, :tag_title, :category, :category_link, :similar_item)")
    public Product createProduct(@RequestBody Product product){
        return productService.save(product);
    }

    @DeleteMapping("/{productvid}")
    @Query("DELETE FROM productv WHERE productvid = :productvid")
    public void deleteByIdProduct(@PathVariable("productvid") long productvid){
        productService.deleteById(productvid);
    }

//    @PutMapping("/{productvid}")
//    @Query("UPDATE productv SET seller = :seller WHERE productvid = :productvid")
//    public Optional<Product> updateProduct(@RequestBody Product newProduct, @PathVariable("productvid") long productvid){
//            return productService.findById(productvid).map( product -> {
//            product.setSeller(newProduct.getSeller());
//            product.setRating(newProduct.getRating());
//            return productService.save(newProduct);
//        });
//    }

    @PutMapping("/{productvid}")
    @Query("UPDATE productv SET seller = :seller, rating = :rating WHERE productvid = :productvid")
    public ResponseEntity<Product> updateProduct(@PathVariable(value = "productvid") Long productvid,
                                                 @Valid @RequestBody Product product) throws ResourceNotFoundException {
        Product newProduct = productService.findById(productvid)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found for this id :: " + productvid));

        product.setSeller(newProduct.getSeller());
        product.setRating(newProduct.getRating());
        final Product updatedProduct = productService.save(product);
        return ResponseEntity.ok(updatedProduct);
    }
}
