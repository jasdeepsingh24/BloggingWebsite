package com.tech.blog.entities;

import java.sql.Timestamp;

public class PostWithLikes implements Comparable<PostWithLikes>{
	
	private int pid;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private Timestamp pDate;
	private int catId;
	private String link1;
	private String link2;
	private String link3;
	private int userId;
	private int likes;
	public PostWithLikes(int pid, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId,
			String link1, String link2, String link3, int userId, int likes) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.link1 = link1;
		this.link2 = link2;
		this.link3 = link3;
		this.userId = userId;
		this.likes = likes;
	}
	public PostWithLikes() {
		super();
	}
	public PostWithLikes(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId,
			String link1, String link2, String link3, int userId, int likes) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.link1 = link1;
		this.link2 = link2;
		this.link3 = link3;
		this.userId = userId;
		this.likes = likes;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getLink1() {
		return link1;
	}
	public void setLink1(String link1) {
		this.link1 = link1;
	}
	public String getLink2() {
		return link2;
	}
	public void setLink2(String link2) {
		this.link2 = link2;
	}
	public String getLink3() {
		return link3;
	}
	public void setLink3(String link3) {
		this.link3 = link3;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	@Override
	public int compareTo(PostWithLikes o) {
		// TODO Auto-generated method stub
		if(likes==o.likes)
			return 0;
		else if(likes>o.likes)
			return -1;
		else
			return 1;
	}
	
	
	

}
