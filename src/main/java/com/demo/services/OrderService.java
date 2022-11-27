package com.demo.services;

import java.util.List;

import com.demo.models.Order;
import com.demo.models.OrderMenu;
import com.demo.models.OrderTable;

public interface OrderService {

	public Iterable<Order> findAll();
	
	public List<Order> findAllbyRes(int id);
	
	public List<OrderMenu> Orderdetail2(int id);
	
	public List<OrderTable> Orderdetail(int id);
	
	public List<Order> NewOrder(int id);
	public Order save(Order order);
}
