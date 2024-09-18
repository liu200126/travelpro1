package cn.yunhe.travel.service;

import cn.yunhe.travel.pojo.Orders;

import java.util.List;

public interface OrdersService {
    List<Orders> findAllOrders();
    Orders findOrderById(String orderId);
}
