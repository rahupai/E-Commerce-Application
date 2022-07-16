package com.DAO;

import java.util.List;

import com.entity.ItemDtls;

public interface ItemDAO {
	public boolean addItems(ItemDtls it);
	
	public List<ItemDtls> getAllItems();
	
	public ItemDtls getItemById(int id);
	
	public boolean updateEditItems(ItemDtls it);
	
	public boolean deleteItems(int id);
	
	public List<ItemDtls> getStationaryItem();
	
	public List<ItemDtls> getNoteBookItem();
	
	public List<ItemDtls> getBookItem();
	
	public List<ItemDtls> getAllStationaryItem();
	
	public List<ItemDtls> getAllNoteBook();
	
	public List<ItemDtls> getAllBook();
}
