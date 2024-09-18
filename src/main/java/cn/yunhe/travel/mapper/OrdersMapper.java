package cn.yunhe.travel.mapper;

import cn.yunhe.travel.pojo.Orders;

import java.util.List;

public interface OrdersMapper {
    List<Orders> findAllOrders();
    // 根据订单id查询订单详情
    Orders findOrderById( String orderId);
}
