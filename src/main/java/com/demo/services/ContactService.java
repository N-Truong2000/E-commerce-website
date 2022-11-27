package com.demo.services;

import java.util.List;

import com.demo.models.Contact;

public interface ContactService {

	public Contact save(Contact contact);
	
	public List<Contact> newContact();
	
	public int CountCOntact();
}
