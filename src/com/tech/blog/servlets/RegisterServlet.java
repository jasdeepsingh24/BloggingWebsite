package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
//		doGet(request, response);
//		out.println("<html>");
//		out.println("<head>");
//		out.println("<title>Servlet RegistrationServlet</title>");
//		out.println("</head>");
//		out.println("<body>");
		String check=request.getParameter("check");
		if(check==null)
		{
			out.println("box not checked");
		}
		else
		{
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String gender=request.getParameter("gender");
			String about=request.getParameter("about");
//			String error="";
//			if(name==null)
//			{
////				out.println("Name is Required");
//				error+="Name,";
//				
//				
//			}
//			else if(email==null)
//			{
//				error+="Email,";			
//				
//			}
//			else if(password==null)
//			{
//				error+="Password,";
//				
//				
//			}
//			else if(gender==null)
//			{
//				error+="Gender is Required";
//				
//				
//			}
			
			
			//create user object
			
				User user=new User(name,email,password,gender,about);
				
				
				//create user dao object
				UserDao dao=new UserDao(ConnectionProvider.getConnection());
				if(dao.saveUser(user)) {
					//saved users...
					out.println("saved");
				}
				else
				{
					
					out.println("Please fill all the boxes carefully..");
//					out.println(error);
				}
			
			
		}
		
//		System.out.println(user_name);
//		out.println("</body>");
//		out.println("</html>");
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
		
//		response.setContentType("text/html");
//		PrintWriter out=response.getWriter();
////		doGet(request, response);
//		out.println("<html>");
//		out.println("<head>");
//		out.println("<title>Servlet RegistrationServlet</title>");
//		out.println("</head>");
//		out.println("<body>");
//		String check=request.getParameter("user_name");
//		out.println(check);
//		
//		System.out.println(check);
//		out.println("</body>");
//		out.println("</html>");
		
	}

}
