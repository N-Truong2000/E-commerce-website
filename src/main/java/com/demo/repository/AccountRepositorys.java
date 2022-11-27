package com.demo.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Account;

@Repository
public interface AccountRepositorys extends CrudRepository<Account, String> {

	@Query("from Account where username = :username")
	public Account findByUsername(@Param("username") String username);
}
