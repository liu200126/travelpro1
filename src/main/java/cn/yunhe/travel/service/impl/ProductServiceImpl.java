package cn.yunhe.travel.service.impl;

import cn.yunhe.travel.mapper.ProductMapper;
import cn.yunhe.travel.pojo.Product;
import cn.yunhe.travel.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductMapper productMapper;
    @Override
    public List<Product> findAllProduct() {
        return productMapper.findAllProduct();
    }

    @Override
    public void addProduct(Product product) {
        productMapper.addProduct(product);
    }

    @Override
    public List<Product> findAllProductByParam(Product product) {
        return productMapper.findAllProductByParam(product);
    }
}
