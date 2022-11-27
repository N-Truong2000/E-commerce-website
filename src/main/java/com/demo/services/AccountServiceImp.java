package com.demo.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.models.Account;
import com.demo.models.Discount;
import com.demo.models.Restaurant;
import com.demo.models.Role;
import com.demo.repository.RestaurantRepository;
import com.demo.repository.RoleRepository;

import com.demo.repository.AccountRepositorys;
import com.demo.repository.DiscountRepository;
@Service
public class AccountServiceImp implements AccountService {
	@Autowired
	private AccountRepositorys accountRepositorys;

	@Autowired
	private DiscountRepository discountRepository;

	@Autowired
	private RestaurantRepository restaurantRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Override
	public Iterable<Restaurant> findAllRes() {
		return restaurantRepository.findAll();
	}

	@Override
	public List<Restaurant> findResByname(String name) {
		return restaurantRepository.findByName(name);
	}

	@Override
	public Iterable<Role> findAllRole() {
		return roleRepository.findAll();
	}

	@Override
	public Account save(Account account) {
		return accountRepositorys.save(account);
	}

	@Override
	public Account findByUsername(String username) {
		return accountRepositorys.findByUsername(username);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account user = accountRepositorys.findByUsername(username);
		if(user == null) {
			throw new UsernameNotFoundException("Username Not Found");
		} else {
			List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
			for(Role role : user.getRoles()) {
				grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
			}
			return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthorities);
		}
	}

	@Override
	public Account Find(String username) {
		return accountRepositorys.findById(username).get();
	}

	@Override
	public Iterable<Account> findAllAccount() {
		return accountRepositorys.findAll();
	}

	@Override
	public void deleteUser(String username) {
		accountRepositorys.deleteById(username);
		
	}

	@Override
	public Role save(Role role) {
		return roleRepository.save(role);
	}
	
	@Override
	public Iterable<Discount> findAllDiscount() {
		return discountRepository.findAll();
	}

	@Override
	public Role findRole(int id) {
		return roleRepository.findById(id).get();
	}
	

}
