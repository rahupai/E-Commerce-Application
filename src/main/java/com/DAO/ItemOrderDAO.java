package com.DAO;

import java.util.List;

import com.entity.Item_Order;

public interface ItemOrderDAO {
	
	public boolean saveOrder(List<Item_Order> i);
	
	public List<Item_Order> getItem(String email);
	
	public List<Item_Order> getAllOrder();
	
}
