package com.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Order;
import com.demo.models.OrderMenu;
import com.demo.models.OrderTable;

@Repository
public interface OrderRepository extends CrudRepository<Order, Integer> {

	@Query(value = "select * from Order order by date desc limit :n", nativeQuery = true)
	public List<Order> limit(@Param("n") int n);

	@Query("from Order where restaurant.id = :id")
	public List<Order> FindallbyRes(@Param("id") int id);
	
	@Query("from Order where restaurant.id = :id and status = false")
	public List<Order> NewOrder(@Param("id") int id);
	
	@Query("from OrderTable where order.id = :id")
	public List<OrderTable> Orderdetail(@Param("id") int id);
	
	@Query("from OrderMenu where order.id = :id")
	public List<OrderMenu> Orderdetail2(@Param("id") int id);
	
//	@Query("from Order where date >= :startDate and date <= endDate")
//	public List<Order> findOrder(@Param("startDate") Date startDate,@Param("endDate") Date endDate);
}
