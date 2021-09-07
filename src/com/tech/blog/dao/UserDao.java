package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;

public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	//method to insert user to databse
	
	public boolean saveUser(User user) {
		boolean f=false;
		try {
			String query="insert into users(name,email,password,gender,about) values (?,?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			
			pstmt.executeUpdate();
			f=true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	//get User by email and password
	public User getUserByEmailAndPassword(String email,String password)
	{
		User user=null;
		try {
			
			String query="select * from users where email=? and password=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet set=pstmt.executeQuery();
			if(set.next())
			{
				user=new User();
				String name=set.getString("name");
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}
	public boolean updateUser(User user)
	{
		boolean f=false;
		try {
			String query="update users set name=?,email=?, password=?, gender=?,about=?,profile=? where id=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getAbout());
			p.setString(6,user.getProfile());
			p.setInt(7,user.getId());
			
			p.executeUpdate();
			f=true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public User getUserById(int id)
	{
		User user=null;
		
		try {
			
			String q="select * from users where id=?";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setInt(1, id);
			ResultSet s=pstmt.executeQuery();
			while(s.next())
			{
				user=new User(id, s.getString("name"),s.getString("email"),s.getString("password"),s.getString("gender"),s.getString("about"), s.getTimestamp("rDate"),s.getString("profile"));
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return user;
	}

}