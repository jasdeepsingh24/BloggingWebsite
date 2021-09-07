package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.GetPhotoName;
import com.tech.blog.helper.Helper;




/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//fetching data
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String userEmail=request.getParameter("user_email");
		String userName=request.getParameter("user_name");
		String userPassword=request.getParameter("user_password");
		String userAbout=request.getParameter("user_about");
		Part part=request.getPart("image");
//		String imageName=part.get
		String imageName=GetPhotoName.extractFileName(part);
		
		//get user form session
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setAbout(userAbout);
		user.setPassword(userPassword);
		String oldFile=user.getProfile();
		user.setProfile(imageName);
		
		//update in database
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		boolean ans=dao.updateUser(user);
		if(ans)
		{
			
			
			String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			String oldFilePath=request.getRealPath("/")+"pics"+File.separator+oldFile;
			
			//delete
			if(!oldFile.equals("default.png"))
			{
				
			
			Helper.deleteFile(oldFilePath);
			}
			
				if(Helper.saveFile(part.getInputStream(), path))
				{
					out.println("Profile updated to db");
					
					Message msg=new Message("Profile details Updated","success","alert-primary");
					
					
					s.setAttribute("message",msg);
				}else
				{
					out.println("not saved..");
					Message msg=new Message("Something Went Wrong","error","alert-danger");
					s.setAttribute("message",msg);
				}
			
		}
		else
		{
			out.println("not updated"); 
			Message msg=new Message("Something Went Wrong","error","alert-danger");
			s.setAttribute("message",msg);
		}
		response.sendRedirect("profile.jsp");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	

}
