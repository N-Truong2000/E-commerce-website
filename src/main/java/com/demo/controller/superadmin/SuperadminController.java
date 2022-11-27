package com.demo.controller.superadmin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.models.Account;
import com.demo.models.Restaurant;
import com.demo.services.AccountService;
import com.demo.services.ContactService;
import com.demo.services.RestaurantService;



@Controller
@RequestMapping("superadmin")
public class SuperadminController {
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private ContactService contactService;

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = {"", "dashboard" }, method = RequestMethod.GET)
	public String dashboard(ModelMap modelMap) {
		modelMap.put("accounts", accountService.findAllAccount());
		return "superadmin/dashboard";
	}
	
	@RequestMapping(value = {"role" }, method = RequestMethod.GET)
	public String role(ModelMap modelMap) {
		modelMap.put("roles", accountService.findAllRole());
		return "superadmin/dashboard";
	}

	@RequestMapping(value = {"contact" }, method = RequestMethod.GET)
	public String newcontact(ModelMap modelMap) {
		modelMap.put("countContact", contactService.CountCOntact());
		modelMap.put("contacts", contactService.newContact());
		return "superadmin/contact";
	}

	
	@RequestMapping(value = { "order" }, method = RequestMethod.GET)
	public String order() {
		return "superadmin/findallorder";
	}
	@RequestMapping(value = { "restaurant" }, method = RequestMethod.GET)
	public String restaurant(ModelMap modelMap) {
		modelMap.put("restaurants", accountService.findAllRes());
		return "superadmin/findallrestaurant";
	}
	@RequestMapping(value = { "discount" }, method = RequestMethod.GET)
	public String discount() {
		return "superadmin/findalldiscount";
	}
//	
//	@RequestMapping(value = { "contact" }, method = RequestMethod.GET)
//	public String contact(ModelMap modelMap) {
//		modelMap.put("contacts",contactService.newContact());
//		return "superadmin/contact";
//	}
//	@RequestMapping(value = { "user" }, method = RequestMethod.GET)
//	public String user(ModelMap modelMap) {
//		modelMap.put("users", userservice.findAll());
//		return "superadmin/findalluser";
//	}
//
//	@RequestMapping(value = { "edit/{username}" }, method = RequestMethod.GET)
//	public String edit(ModelMap modelMap, @ModelAttribute("user") User user,
//			@PathVariable("username") String username) {
//		modelMap.put("user", userservice.find(username));
//		return "superadmin/edituser";
//	}
//
//	@RequestMapping(value = { "edit" }, method = RequestMethod.POST)
//	public String edit(@ModelAttribute("user") User user, BindingResult bindingResult) {
//		if (bindingResult.hasErrors()) {
//			return "superadmin/edituse";
//		} else {
//			userservice.save(user);
//			return "redirect:/superadmin/findalluser";
//		}
//	}
//
//	@RequestMapping(value = { "remove" }, method = RequestMethod.GET)
//	public String remove(@RequestParam("username") String username) {
//		userservice.remove(username);
//		return "redirect:/superadmin/findalluser";
//	}
//
//	@RequestMapping(value = { "craeate" }, method = RequestMethod.GET)
//	public String craeate() {
//		return "superadmin/careateuser";
//	}
	@RequestMapping(value = { "createAccount" }, method = RequestMethod.GET)
	public String createAccount(ModelMap modelMap) {
		Account account = new Account();
		modelMap.put("account", account);
		modelMap.put("roles", accountService.findAllRole());
		return "superadmin/createAccount";		
}
	@RequestMapping(value = { "createAccount" }, method = RequestMethod.POST)
	public String createAccount(@ModelAttribute("account") Account account) {
		account.setPassword(BCrypt.hashpw(account.getPassword(), BCrypt.gensalt()));
		accountService.save(account);		
		return "redirect:/superadmin/dashboard";		
		}
	
	@RequestMapping(value = { "editAccount/{username}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable("username") String username, ModelMap modelMap) {
		modelMap.put("account", accountService.findByUsername(username));
		modelMap.put("roles", accountService.findAllRole());
		return "superadmin/editAccount";		
		}
	
	@RequestMapping(value = { "editAccount" }, method = RequestMethod.POST)
	public String editUser(@ModelAttribute("account") Account account) {
		Account current = accountService.findByUsername(account.getUsername());
		if(!account.getPassword().isEmpty()) {
			account.setPassword(BCrypt.hashpw(account.getPassword(), BCrypt.gensalt()));
		}else {
			account.setPassword(current.getPassword());
		}
		accountService.save(account);
		return "redirect:/superadmin/dashboard";		
		}
	
	@RequestMapping(value = { "deleteAccount/{username}" }, method = RequestMethod.GET)
	public String deleteAccount(@PathVariable("username") String username, ModelMap modelMap) {
		try {
			accountService.deleteUser(username);
			return "redirect:/superadmin/dashboard";
		}catch (Exception e) {
			modelMap.put("msg", "Can not delete");
			modelMap.put("accounts", accountService.findAllAccount());
			return "superadmin/dashboard";
			
		}		
				
		}
	
}