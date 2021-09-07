package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.tech.blog.entities.*;
public class PostDao {
	
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list=new ArrayList<>();
		
		try {
			
			String q="Select * from categories";
			Statement st=con.createStatement();
			ResultSet set=st.executeQuery(q);
			while(set.next())
			{
				int cid=set.getInt("cid");
				String name=set.getString("name");
				String description=set.getString("description");
				Category c=new Category(cid,name,description);
				list.add(c);
				
			}
			
			Collections.sort(list);
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return list;
	}
	public boolean savePost(Post p)
	{
		boolean f=false;
		
		try {
			
			String q="insert into post(pTitle,pContent,pCode,pPic,pDate,catId,link1,link2,link3,userId) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1,p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4,p.getpPic());
			pstmt.setTimestamp(5, p.getpDate());
			pstmt.setInt(6,p.getCatId());
			pstmt.setString(7,p.getLink1());
			pstmt.setString(8, p.getLink2());
			pstmt.setString(9, p.getLink3());
			pstmt.setInt(10, p.getUserId());
			pstmt.executeUpdate();
			f=true;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return f;
	}
	public List<Post> getAllPost()
	{
		List<Post> list=new ArrayList<>();
		
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
				
				Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, link1, link2, link3, userId);
				
				list.add(post);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	public List<Post> getPostByCatId(int catId)
	{
		List<Post> list=new ArrayList<>();
		
		try {
			
			String q="select * from post where catId=?";
			
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, catId);
			ResultSet s=p.executeQuery();
			
			while(s.next())
			{
				int pid=s.getInt("pid");
				String pTitle=s.getString("pTitle");
				String pContent=s.getString("pContent");
				String pCode=s.getString("pCode");
				String pPic=s.getString("pPic");
				Timestamp pDate=s.getTimestamp("pDate");
				
				String link1=s.getString("link1");
				String link2=s.getString("link2");
				String link3=s.getString("link3");
				int userId=s.getInt("userId");
				
				Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, link1, link2, link3, userId);
				
				list.add(post);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}
	public Post getPostByPostId(int pid)
	{
		Post p=null;
		
		try {
			
			String q="select * from post where pid=?";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setInt(1, pid);
			ResultSet s=pstmt.executeQuery();
			while(s.next())
			{
				String pTitle=s.getString("pTitle");
				String pContent=s.getString("pContent");
				String pCode=s.getString("pCode");
				Timestamp pDate=s.getTimestamp("pDate");
				String pPic=s.getString("pPic");
				int catId=s.getInt("catId");
				String link1=s.getString("link1");
				String link2=s.getString("link2");
				String link3=s.getString("link3");
				int userId=s.getInt("userId");
				p=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, link1, link2, link3, userId);
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return p;
	}
	public List<Post> getAllUserPosts(int uid)
	{
		List<Post> l=new ArrayList<>();
		
		try {
			Post p=null;
			String q="select * from post where userId=? order by pDate desc";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setInt(1,uid);
			ResultSet s=pstmt.executeQuery();
			
			while(s.next())
			{
				int pid=s.getInt("pid");
				String pTitle=s.getString("pTitle");
				String pContent=s.getString("pContent");
				String pCode=s.getString("pCode");
				Timestamp pDate=s.getTimestamp("pDate");
				String pPic=s.getString("pPic");
				int catId=s.getInt("catId");
				String link1=s.getString("link1");
				String link2=s.getString("link2");
				String link3=s.getString("link3");
				int userId=s.getInt("userId");
				p=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, link1, link2, link3, userId);
				
				l.add(p);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return l;
	}
	public List<Post> getPostByCategoryIdOfCurrentUser(int catId,int uid)
	{
		List<Post> l=new ArrayList<>();
		
		try {
			
			String q="select * from post where catId=? and userId=? order by pDate desc";
			
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, catId);
			p.setInt(2, uid);
			ResultSet s=p.executeQuery();
			
			while(s.next())
			{
				int pid=s.getInt("pid");
				String pTitle=s.getString("pTitle");
				String pContent=s.getString("pContent");
				String pCode=s.getString("pCode");
				String pPic=s.getString("pPic");
				Timestamp pDate=s.getTimestamp("pDate");
				
				String link1=s.getString("link1");
				String link2=s.getString("link2");
				String link3=s.getString("link3");
				int userId=s.getInt("userId");
				
				Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, link1, link2, link3, userId);
				
				l.add(post);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return l;
	}
}
