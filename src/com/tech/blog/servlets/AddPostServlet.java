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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.GetPhotoName;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String pTitle=request.getParameter("pTitle");
		String pContent=request.getParameter("pContent");
		int catId=Integer.parseInt(request.getParameter("cid"));
		String pCode=request.getParameter("pCode");
		String link1=request.getParameter("link1");
		String link2=request.getParameter("link2");
		String link3=request.getParameter("link3");
		Part part=request.getPart("pPic"); 
		String pPic=GetPhotoName.extractFileName(part); 
//		out.println(imageName);
//		out.println(pTitle);
//		out.println(pContent);
		
		//getting user id
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentUser");
		int userId=user.getId();
		
		Post p=new Post(pTitle, pContent, pCode, pPic, null, catId, link1, link2, link3, userId);
		PostDao pdao=new PostDao(ConnectionProvider.getConnection());
		
		if(pdao.savePost(p))
		{
			
			
			@SuppressWarnings("deprecation")
			String path=request.getRealPath("/")+"blog_pics"+File.separator+p.getpPic();
//			out.println(path);
			Helper.saveFile(part.getInputStream(), path);
			out.println("done");
			
		}
		else
		{
			out.println("error");
		}

		
		
		
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
