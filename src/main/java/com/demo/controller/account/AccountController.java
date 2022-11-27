package com.demo.controller.account;

import java.util.HashSet;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Account;
import com.demo.models.Role;
import com.demo.services.AccountService;
import com.demo.validator.AccountValidator;

@Controller
@RequestMapping(value = { "", "account" })
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountValidator accountValidator;
	
	@RequestMapping(value = { "", "login" }, method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap modelMap)
	{
		if(error != null) {
			modelMap.put("msg","Invalid");
		}
		if(logout != null) {
			modelMap.put("msg","Logout successfully");
		}
		return "account/login";
	}

	@RequestMapping(value = { "register2" }, method = RequestMethod.GET)
	public String register2(ModelMap modelMap) {
		modelMap.put("account", new Account());
		return "account/register2";
	}

	
	@RequestMapping(value = { "register" }, method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("account", new Account());
		return "account/register";
	}

	@RequestMapping(value = { "register" }, method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid Account account,BindingResult bindingResult) {
		accountValidator.validate(account, bindingResult);
		if(bindingResult.hasErrors()) {
			return "account/register";
		}else {
		String hash = new BCryptPasswordEncoder().encode(account.getPassword());
		Set<Role> roles = new HashSet<>();
		Role role = accountService.findRole(1);
		roles.add(role);
		account.setRoles(roles);
		account.setPassword(hash);
		accountService.save(account);
		return "redirect:/account/login";
		}
	}
	
	@RequestMapping(value = { "register2" }, method = RequestMethod.POST)
	public String register2(@ModelAttribute("account") @Valid Account account,BindingResult bindingResult) {
		accountValidator.validate(account, bindingResult);
		if(bindingResult.hasErrors()) {
			return "account/register2";
		}else {
		String hash = new BCryptPasswordEncoder().encode(account.getPassword());
		Set<Role> roles = new HashSet<>();
		Role role = accountService.findRole(3);
		
		roles.add(role);
		account.setRoles(roles);
		account.setPassword(hash);
		accountService.save(account);
		return "redirect:/account/login";
		}
	}
	
	@RequestMapping(value = { "accessDenied" }, method = RequestMethod.GET)
	public String accessDenied() {
		return "account/accessDenied";
	}
}
