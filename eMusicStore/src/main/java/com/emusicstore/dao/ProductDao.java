package com.emusicstore.dao;

import com.emusicstore.model.Product;

import java.util.List;

/**
 * Created by Santhu Reddy on 5/25/2017.
 */
public interface ProductDao {
    void addProduct(Product product);
    void editProduct(Product product);
    Product getProductById(String id);

    List<Product> getAllProducts();

    void deleteProduct(String id);

}
