package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {
	Connection con;
	
	
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}


	public boolean insertLike(int pid,int uid)
	{
		boolean f=false;
		try {
			
			String q="insert into likes (pid,uid) values (?,?)";
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			f=true;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	public int countLikesOnPost(int pid)
	{
		int count=0;
		
		try {
			
			String q="select count(*) from likes where pid=?";
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1,pid);
			ResultSet s=p.executeQuery();
			if(s.next())
			{
				count=s.getInt(1);
				
				//s.getInt("count(*)");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return count;
	}
	
	public boolean isLikedByUser(int pid,int uid)
	{
		boolean f=false;
		
		try {
			
			PreparedStatement p=con.prepareStatement("select * from likes where pid=? and uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			ResultSet s=p.executeQuery();
			if(s.next())
			{
				f=true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return f;
	}
	public boolean deleteLike(int pid,int uid)
	{
		boolean f=false;
		
		try {
			String q="delete from likes where pid=? and uid=?";
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return f;
	}

}
