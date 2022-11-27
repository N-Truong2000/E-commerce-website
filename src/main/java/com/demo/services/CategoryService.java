package com.demo.services;


import java.util.List;

import com.demo.models.Category;

public interface CategoryService  {
	
	public Iterable<Category> findAllCategory( );
	
	public List<Category> findAllCate(int id);
	
	public Category save(Category category);
	
	public Category find(int id);
	
	public void deleteCate(int id);
	
}
