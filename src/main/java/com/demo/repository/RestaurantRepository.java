package com.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Category;
import com.demo.models.Menu;
import com.demo.models.Restaurant;
import com.demo.models.Tables;

@Repository
public interface RestaurantRepository extends CrudRepository<Restaurant, Integer> {

	@Query("from Menu where restaurant.id = :id")
	public List<Menu> findAllMenu(@Param("id") int id);
	
	@Query("from Tables where restaurant.id = :id")
	public List<Tables> findAllTables(@Param("id") int id);

	@Query("select count(id) from Menu where restaurant.id = :id")
	public int countMenu(@Param("id") int id);
	
	@Query("select sum(total) from Order where restaurant.id = :id")
	public Double sumTotal(@Param("id") int id);
	
	@Query("select count(id) from Order where restaurant.id = :id")
	public int countOrder(@Param("id") int id);

	@Query("from Restaurant where fullname like %:fullname%")
	public List<Restaurant> findByName(@Param("fullname") String fullname);

}
