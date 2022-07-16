package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ItemDtls;

public class ItemDAOImpl implements ItemDAO {

	private Connection conn;

	public ItemDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addItems(ItemDtls it) {
		boolean f = false;

		try {
			String sql = "insert into item_dtls(itemname,company,price,itemCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, it.getItemName());
			ps.setString(2, it.getCompany());
			ps.setString(3, it.getPrice());
			ps.setString(4, it.getItemCategory());
			ps.setString(5, it.getStatus());
			ps.setString(6, it.getPhotoName());
			ps.setString(7, it.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<ItemDtls> getAllItems() {
		List<ItemDtls> list = new ArrayList<ItemDtls>();
		ItemDtls it = null;

		try {
			String sql = "select * from item_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				it = new ItemDtls();
				it.setItemId(rs.getInt(1));
				it.setItemName(rs.getString(2));
				it.setCompany(rs.getString(3));
				it.setPrice(rs.getString(4));
				it.setItemCategory(rs.getString(5));
				it.setStatus(rs.getString(6));
				it.setPhotoName(rs.getString(7));
				it.setEmail(rs.getString(8));
				list.add(it);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public ItemDtls getItemById(int id) {
		ItemDtls it = null;

		try {
			String sql = "select * from item_dtls where itemId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				it = new ItemDtls();
				it.setItemId(rs.getInt(1));
				it.setItemName(rs.getString(2));
				it.setCompany(rs.getString(3));
				it.setPrice(rs.getString(4));
				it.setItemCategory(rs.getString(5));
				it.setStatus(rs.getString(6));
				it.setPhotoName(rs.getString(7));
				it.setEmail(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return it;
	}

	public boolean updateEditItems(ItemDtls it) {
		boolean f = false;

		try {
			String sql = "update item_dtls set itemname=?,company=?,price=?,status=? where itemId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, it.getItemName());
			ps.setString(2, it.getCompany());
			ps.setString(3, it.getPrice());
			ps.setString(4, it.getStatus());
			ps.setInt(5, it.getItemId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteItems(int id) {
		boolean f = false;

		try {
			String sql = "delete from item_dtls where itemId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<ItemDtls> getStationaryItem() {
		List<ItemDtls> list = new ArrayList<ItemDtls>();
		ItemDtls it = null;

		try {
			String sql = "select * from item_dtls where itemCategory=? and status=? order by itemId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Stationary");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				it = new ItemDtls();
				it.setItemId(rs.getInt(1));
				it.setItemName(rs.getString(2));
				it.setCompany(rs.getString(3));
				it.setPrice(rs.getString(4));
				it.setItemCategory(rs.getString(5));
				it.setStatus(rs.getString(6));
				it.setPhotoName(rs.getString(7));
				it.setEmail(rs.getString(8));
                list.add(it);
                i++;	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<ItemDtls> getNoteBookItem() {
		List<ItemDtls> list = new ArrayList<ItemDtls>();
		ItemDtls it = null;

		try {
			String sql = "select * from item_dtls where itemCategory=? and status=? order by itemId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Notebook");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				it = new ItemDtls();
				it.setItemId(rs.getInt(1));
				it.setItemName(rs.getString(2));
				it.setCompany(rs.getString(3));
				it.setPrice(rs.getString(4));
				it.setItemCategory(rs.getString(5));
				it.setStatus(rs.getString(6));
				it.setPhotoName(rs.getString(7));
				it.setEmail(rs.getString(8));
                list.add(it);
                i++;	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	   	
	}

	public List<ItemDtls> getBookItem() {
		List<ItemDtls> list = new ArrayList<ItemDtls>();
		ItemDtls it = null;

		try {
			String sql = "select * from item_dtls where itemCategory=? and status=? order by itemId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Book");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				it = new ItemDtls();
				it.setItemId(rs.getInt(1));
				it.setItemName(rs.getString(2));
				it.setCompany(rs.getString(3));
				it.setPrice(rs.getString(4));
				it.setItemCategory(rs.getString(5));
				it.setStatus(rs.getString(6));
				it.setPhotoName(rs.getString(7));
				it.setEmail(rs.getString(8));
                list.add(it);
                i++;	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
		
	}

	public List<ItemDtls> getAllStationaryItem() {
		List<ItemDtls> list = new ArrayList<ItemDtls>();
		ItemDtls it = null;

		try {
			String sql = "select * from item_dtls where itemCategory=? and status=? order by itemId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Stationary");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				it = new ItemDtls();
				it.setItemId(rs.getInt(1));
				it.setItemName(rs.getString(2));
				it.setCompany(rs.getString(3));
				it.setPrice(rs.getString(4));
				it.setItemCategory(rs.getString(5));
				it.setStatus(rs.getString(6));
				it.setPhotoName(rs.getString(7));
				it.setEmail(rs.getString(8));
                list.add(it);	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<ItemDtls> getAllNoteBook() {
		List<ItemDtls> list = new ArrayList<ItemDtls>();
		ItemDtls it = null;

		try {
			String sql = "select * from item_dtls where itemCategory=? and status=? order by itemId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Notebook");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				it = new ItemDtls();
				it.setItemId(rs.getInt(1));
				it.setItemName(rs.getString(2));
				it.setCompany(rs.getString(3));
				it.setPrice(rs.getString(4));
				it.setItemCategory(rs.getString(5));
				it.setStatus(rs.getString(6));
				it.setPhotoName(rs.getString(7));
				it.setEmail(rs.getString(8));
                list.add(it);	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<ItemDtls> getAllBook() {
		List<ItemDtls> list = new ArrayList<ItemDtls>();
		ItemDtls it = null;

		try {
			String sql = "select * from item_dtls where itemCategory=? and status=? order by itemId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Book");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				it = new ItemDtls();
				it.setItemId(rs.getInt(1));
				it.setItemName(rs.getString(2));
				it.setCompany(rs.getString(3));
				it.setPrice(rs.getString(4));
				it.setItemCategory(rs.getString(5));
				it.setStatus(rs.getString(6));
				it.setPhotoName(rs.getString(7));
				it.setEmail(rs.getString(8));
                list.add(it);	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
   	

}
