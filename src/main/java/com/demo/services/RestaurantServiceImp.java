package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Category;
import com.demo.models.Menu;
import com.demo.models.Photo;
import com.demo.models.Restaurant;
import com.demo.models.Tables;
import com.demo.repository.CategoryRepository;
import com.demo.repository.PhotoRepository;
import com.demo.repository.RestaurantRepository;

@Service
public class RestaurantServiceImp implements RestaurantService {

	@Autowired
	private RestaurantRepository restaurantRepository;
	
	@Autowired
	private PhotoRepository photoRepository;

	@Override
	public int countMenu(int id) {
		return restaurantRepository.countMenu(id);
	}

	@Override
	public List<Menu> findAllMenu(int res_id) {
		return restaurantRepository.findAllMenu(res_id);
	}

	@Override
	public Iterable<Restaurant> findall() {
		return restaurantRepository.findAll();
	}

	@Override
	public int countOrder(int id) {
		return restaurantRepository.countOrder(id);
	}

	@Override
	public Double sumTotal(int id) {
		return restaurantRepository.sumTotal(id);
	}

	@Override
	public Restaurant Find(int id) {
		return restaurantRepository.findById(id).get();
	}

	@Override
	public List<Tables> findAllTable(int res_id) {
		return restaurantRepository.findAllTables(res_id);
	}

	@Override
	public Restaurant save(Restaurant restaurant) {
		return restaurantRepository.save(restaurant);
	}

	@Override
	public Photo savePhoto(Photo photo) {
		return photoRepository.save(photo);
	}

	@Override
	public Restaurant Update(Restaurant restaurant) {
		return restaurantRepository.save(restaurant);
	}

	@Override
	public void deleteRes(int id) {
		restaurantRepository.deleteById(id);
		
	}
	

}
