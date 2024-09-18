package cn.yunhe.travel.controller;

import cn.yunhe.travel.pojo.Product;
import cn.yunhe.travel.service.ProductService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.security.PermitAll;
import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/findAll")
    public String findAllProduct(@RequestParam(name = "page" ,defaultValue = "1") int pageNum,
                                 @RequestParam(name = "size" ,defaultValue = "2") int pageSize,
                                 Model model){
        PageHelper.startPage(pageNum, pageSize);
        List<Product> productList = productService.findAllProduct();
        PageInfo<Product> pageInfo = new PageInfo<>(productList);
        model.addAttribute("pageInfo", pageInfo);

        return "product-list";
    }


    @RequestMapping("/findProductByParam")
    public String findProductByParam(@RequestParam(name = "page" ,defaultValue = "1") int pageNum,
                                 @RequestParam(name = "size" ,defaultValue = "2") int pageSize,
                                 Product product,Model model){
        PageHelper.startPage(pageNum, pageSize);
        List<Product> productList = productService.findAllProductByParam(product);
        PageInfo<Product> pageInfo = new PageInfo<>(productList);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("prod", product);
        return "product-list";
    }
    @GetMapping("/toAdd")
    public String toAdd(){
        return "product-add";
    }
    @RequestMapping("/save")
    public String addProduct(Product product){
        productService.addProduct(product);
        return "redirect:findAll";
    }





}
