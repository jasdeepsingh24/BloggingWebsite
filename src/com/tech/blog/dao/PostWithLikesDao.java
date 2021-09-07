package com.tech.blog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.*;
import com.tech.blog.dao.*;

public class PostWithLikesDao {
	
	Connection con;

	public PostWithLikesDao(Connection con) {
		super();
		this.con = con;
	}
	
	public List<PostWithLikes> getAllPostWithLikes()
	{
		List<PostWithLikes> list=new ArrayList<>();
		
		try {
			
			String q="select * from post order by pDate desc";
			PreparedStatement p=con.prepareStatement(q);
			ResultSet s=p.executeQuery();
			
			while(s.next())
			{
				int pid=s.getInt("pid");
				String pTitle=s.getString("pTitle");
				String pContent=s.getString("pContent");
				String pCode=s.getString("pCode");
				String pPic=s.getString("pPic");
				Timestamp pDate=s.getTimestamp("pDate");
				int catId=s.getInt("catId");
				String link1=s.getString("link1");
				String link2=s.getString("link2");
				String link3=s.getString("link3");
				int userId=s.getInt("userId");
				LikeDao ldao=new LikeDao(con);
				int likes=ldao.countLikesOnPost(pid);
				
				PostWithLikes post=new PostWithLikes(pid, pTitle, pContent, pCode, pPic, pDate, catId, link1, link2, link3, userId, likes);
				
				list.add(post);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	

}
