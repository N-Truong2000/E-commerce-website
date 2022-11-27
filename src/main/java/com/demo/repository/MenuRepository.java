package com.demo.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Menu;

@Repository
public interface MenuRepository  extends CrudRepository<Menu, Integer>{
	   @Query("from Menu where category.id = :id")
		public List<Menu> findByCategoryId(@Param("id") int id);
	   
	   
	   
//	   @Query("select count(id) from Tables where timeIn <= :timeIn and timeOut = : timeOut")
//		public int countTable(@Param("timeIn") Date timeIn,@Param("timeOut") Date timeOut);
  
  
}
