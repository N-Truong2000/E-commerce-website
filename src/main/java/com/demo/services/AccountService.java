package com.demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.models.Restaurant;
import com.demo.models.Role;
import com.demo.models.Account;
import com.demo.models.Discount;

public interface AccountService extends UserDetailsService {
	
	public Account Find(String username);

	public Iterable<Restaurant> findAllRes();

	public Account save(Account account);

	public Iterable<Role> findAllRole();
	
	public Role findRole(int id);

	public List<Restaurant> findResByname(String name);

	public Account findByUsername(String username);

	public Iterable<Account> findAllAccount();

	public void deleteUser(String username);

	public Role save(Role role);
	
	public Iterable<Discount> findAllDiscount();
}
