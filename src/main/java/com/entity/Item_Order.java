package com.entity;

public class Item_Order {
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phno;
	private String fulladd;
	private String itemName;
	private String company;
	private String price;

	private String paymentType;

	public Item_Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getFulladd() {
		return fulladd;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "Item_Order [id=" + id + ", userName=" + userName + ", email=" + email + ", phno=" + phno + ", fulladd="
				+ fulladd + ", paymentType=" + paymentType + "]";
	}

}
