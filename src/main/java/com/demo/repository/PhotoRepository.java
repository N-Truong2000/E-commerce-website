package com.demo.repository;

import org.springframework.data.repository.CrudRepository;

import com.demo.models.Photo;

public interface PhotoRepository extends CrudRepository<Photo, Integer> {

}
