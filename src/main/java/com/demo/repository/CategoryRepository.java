package com.demo.repository;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.demo.models.Category;

public interface CategoryRepository extends CrudRepository<Category, Integer> {
	
	@Query("from Category where restaurant.id = :id")
	public List<Category> findAllCate(@Param("id") int id);
}
