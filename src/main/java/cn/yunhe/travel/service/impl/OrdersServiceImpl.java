package cn.yunhe.travel.service.impl;

import cn.yunhe.travel.mapper.OrdersMapper;
import cn.yunhe.travel.pojo.Orders;
import cn.yunhe.travel.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersMapper ordersMapper;

    @Override
    public List<Orders> findAllOrders() {
        return ordersMapper.findAllOrders();
    }

    @Override
    public Orders findOrderById(String orderId) {
        return ordersMapper.findOrderById(orderId);
    }
}
