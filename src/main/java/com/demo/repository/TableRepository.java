package com.demo.repository;

import org.springframework.data.repository.CrudRepository;

import com.demo.models.Tables;

public interface TableRepository extends CrudRepository<Tables, Integer> {

}
