package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Category;
import com.demo.repository.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public Iterable<Category> findAllCategory() {
		return categoryRepository.findAll();
	}

	@Override
	public List<Category> findAllCate(int id) {
		return categoryRepository.findAllCate(id);
	}

	@Override
	public Category save(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public Category find(int id) {
		return categoryRepository.findById(id).get();
	}

	@Override
	public void deleteCate(int id) {
		categoryRepository.deleteById(id);
	}

}
