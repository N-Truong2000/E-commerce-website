package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Order;
import com.demo.models.OrderMenu;
import com.demo.models.OrderTable;
import com.demo.repository.OrderRepository;

@Service
public class OrderServiceImp implements OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	@Override
	public Iterable<Order> findAll() {
		return orderRepository.findAll();
	}

	@Override
	public List<Order> findAllbyRes(int id) {
		return orderRepository.FindallbyRes(id);
	}
	@Override
	public List<OrderTable> Orderdetail(int id) {
		return orderRepository.Orderdetail(id);
	}
	@Override
	public List<OrderMenu> Orderdetail2(int id) {
		return orderRepository.Orderdetail2(id);
	}

	@Override
	public List<Order> NewOrder(int id) {
		return orderRepository.NewOrder(id);
	}

	@Override
	public Order save(Order order) {
		return orderRepository.save(order);
	}

	

}
