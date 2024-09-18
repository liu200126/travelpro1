package cn.yunhe.travel.service;

import cn.yunhe.travel.pojo.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAllProduct();
    void addProduct(Product product);

    List<Product> findAllProductByParam(Product product);
}
