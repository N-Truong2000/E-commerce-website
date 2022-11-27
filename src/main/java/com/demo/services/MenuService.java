package com.demo.services;

import java.util.Date;
import java.util.List;

import com.demo.models.Menu;
import com.demo.models.Tables;

public interface MenuService {
	public Iterable<Menu> findAll();

	public Menu find(int id);

	public Tables FindTable(int id);

	public List<Menu> finAllCategory(int id);

	public Menu save(Menu menu);

	public void deleteMenu(int id);
	
	public Tables saveTable(Tables tables);
	
	public void deleteTable(int id);

	// public int countTable(Date timeIn, Date timeOut);

}
