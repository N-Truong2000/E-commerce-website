package com.demo.services;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Menu;
import com.demo.models.Tables;
import com.demo.repository.MenuRepository;
import com.demo.repository.TableRepository;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuRepository menuRepository;

	@Autowired
	private TableRepository tableRepository;

	@Override
	public Menu find(int id) {
		return menuRepository.findById(id).get();
	}

	@Override
	public Iterable<Menu> findAll() {
		return menuRepository.findAll();
	}

	@Override
	public List<Menu> finAllCategory(int id) {
		return menuRepository.findByCategoryId(id);
	}

	@Override
	public Tables FindTable(int id) {
		return tableRepository.findById(id).get();
	}

	@Override
	public Menu save(Menu menu) {

		return menuRepository.save(menu);
	}

	@Override
	public void deleteMenu(int id) {
		menuRepository.deleteById(id);

	}

	@Override
	public Tables saveTable(Tables tables) {
		return tableRepository.save(tables);
	}

	@Override
	public void deleteTable(int id) {
		tableRepository.deleteById(id);
	}

//	@Override
//	public int countTable(Date timeIn, Date timeOut) {
//		return menuRepository.countTable(timeIn, timeOut);
//	}

}
