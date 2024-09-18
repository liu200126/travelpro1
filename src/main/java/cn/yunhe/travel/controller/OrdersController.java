package cn.yunhe.travel.controller;

import cn.yunhe.travel.pojo.Orders;
import cn.yunhe.travel.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    @RequestMapping("/findAll")
    public String findAllOrders(Model model){
        List<Orders> orders = ordersService.findAllOrders();
        model.addAttribute("ordersList",orders);
        System.out.println(orders);

        return "orders-list";
    }

    @GetMapping("/findById/{id}")
    public String findById(@PathVariable String id, Model model){
        Orders orders = ordersService.findOrderById(id);
        System.out.println(orders);
        model.addAttribute("orders",orders);
        return "orders-show";
    }


}

