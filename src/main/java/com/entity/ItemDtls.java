package com.entity;

public class ItemDtls {
	private int itemId;
	private String itemName;
	private String company;
	private String price;
	private String itemCategory;
	private String status;
	private String photoName;
	private String email;

	public ItemDtls() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItemDtls(String itemName, String company, String price, String itemCategory, String status, String photoName,
			String email) {
		super();
		this.itemName = itemName;
		this.company = company;
		this.price = price;
		this.itemCategory = itemCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
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

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "ItemDtls [itemId=" + itemId + ", itemName=" + itemName + ", company=" + company + ", price=" + price
				+ ", itemCategory=" + itemCategory + ", status=" + status + ", photoName=" + photoName + ", email="
				+ email + "]";
	}

}
