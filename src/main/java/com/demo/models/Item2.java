package com.demo.models;


public class Item2 {
 private Tables tables;
private int quantity ;

public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public Tables getTables() {
	return tables;
}
public void setTables(Tables tables) {
	this.tables = tables;
}

public Item2(Tables tables, int quantity) {
	super();
	this.tables = tables;
	this.quantity = quantity;
}
public Item2() {
	super();
}

 
}
