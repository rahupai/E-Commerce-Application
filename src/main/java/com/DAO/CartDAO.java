package com.DAO;

import java.util.List;

import com.entity.Cart;
import com.entity.ItemDtls;

public interface CartDAO {
     
	public boolean addCart(Cart c);
	
	public List<Cart> getItemByUser(int userId);
	
	public boolean deleteItem(int iid,int uid,int cid);
}
