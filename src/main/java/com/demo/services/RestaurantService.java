package com.demo.services;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.demo.models.Category;
import com.demo.models.Menu;
import com.demo.models.Photo;
import com.demo.models.Restaurant;
import com.demo.models.Tables;

public interface RestaurantService {
	
	public Photo savePhoto (Photo photo);
	
	public int countMenu(int id);
	
	public int countOrder(int id);

	public List<Menu> findAllMenu(int res_id);
	
	public List<Tables> findAllTable(int res_id);
	
	public Double sumTotal( int id);
	
	public Restaurant save(Restaurant restaurant);

	public Iterable<Restaurant> findall();
	
	public Restaurant Find(int id);
	
	public Restaurant Update(Restaurant restaurant);
	
	public void deleteRes(int id);
	
	
}
