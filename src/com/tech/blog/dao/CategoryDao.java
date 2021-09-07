package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.entities.Category;

public class CategoryDao {
	Connection con;

	public CategoryDao(Connection con) {
		super();
		this.con = con;
	}
	public Category getCategoryById(int catId)
	{
		
		Category c=null;
		try {
			
			String q="select * from categories where cid=?";
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, catId);
			ResultSet s=p.executeQuery();
			
			while(s.next())
			{
				c=new Category(catId, s.getString("name"), s.getString("description"));
			}
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return c;
	}

}
