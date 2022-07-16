package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.ItemDtls;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean addCart(Cart c) {
		boolean f = false;

		try {
			String sql = "insert into cart(iid,uid,itemName,company,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getIid());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getItemName());
			ps.setString(4, c.getCompany());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());

			int i = ps.executeUpdate();

			if (i == 1) 
			{
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Cart> getItemByUser(int userId) {
		List<Cart>list=new ArrayList<Cart>();
		Cart c=null;
		double totalPrice=0.00;
		
		try {
           String sql="select * from cart where uid=?";
           PreparedStatement ps=conn.prepareStatement(sql);
		   ps.setInt(1, userId);
		   
		   ResultSet rs=ps.executeQuery();
		   
		   while(rs.next())
		   {
			   c=new Cart();
			   c.setCid(rs.getInt(1));
			   c.setIid(rs.getInt(2));
			   c.setUserId(rs.getInt(3));
			   c.setItemName(rs.getString(4));
			   c.setCompany(rs.getString(5));
			   c.setPrice(rs.getDouble(6));
			  
			   totalPrice=totalPrice+rs.getDouble(7);
			   c.setTotalPrice(totalPrice);
			   list.add(c);	
			   		       
		   }	   
		   
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public boolean deleteItem(int iid,int uid,int cid) {
		boolean f=false;
		
		try {
			String sql="delete from cart where iid=? and uid=? and cid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, iid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			
			int i =ps.executeUpdate();
			
			if(i==1)
			{
				f=true;	
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

    	
}
