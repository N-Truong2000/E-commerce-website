package com.demo.repository;

import org.springframework.data.repository.CrudRepository;

import com.demo.models.Discount;

public interface DiscountRepository extends CrudRepository<Discount, Integer> {

}
