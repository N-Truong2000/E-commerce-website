package com.demo.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.models.Account;

@Component("accountValidator")
public class AccountValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Account.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		 Account account= (Account) target;
		 if(account.getUsername().equalsIgnoreCase(account.getUsername())) {
		 }
		 ;
	}
	

}