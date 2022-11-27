package com.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.models.Contact;

@Repository
public interface ContactRepository extends CrudRepository<Contact, Integer> {
	@Query("from Contact where status = false")
	public List<Contact> newContact();
	
	@Query("select count(id) from Contact where status = false")
	public int CountCOntact();
}
