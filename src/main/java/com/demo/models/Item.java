package com.demo.models;

public class Item {
 private Menu menu;
private int quantity ;
public Menu getMenu() {
	return menu;
}
public void setMenu(Menu menu) {
	this.menu = menu;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public Item(Menu menu, int quantity) {
	super();
	this.menu = menu;
	this.menu = menu;
	this.quantity = quantity;
}
public Item() {
	super();
}
 
}
