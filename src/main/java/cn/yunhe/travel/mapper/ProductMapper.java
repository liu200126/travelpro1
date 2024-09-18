package cn.yunhe.travel.mapper;

import cn.yunhe.travel.pojo.Product;

import java.util.List;

public interface ProductMapper {
    List<Product> findAllProduct();
    void addProduct(Product product);

    List<Product> findAllProductByParam(Product product);
}
