package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Contact;
import com.demo.repository.ContactRepository;

@Service
public class COntactServiceIml implements ContactService {
	@Autowired
	private ContactRepository contactRepository;

	@Override
	public Contact save(Contact contact) {
		return contactRepository.save(contact);
	}

	@Override
	public List<Contact> newContact() {
		return contactRepository.newContact();
	}

	@Override
	public int CountCOntact() {
		return contactRepository.CountCOntact();
	}

}
