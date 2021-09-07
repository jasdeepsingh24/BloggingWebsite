<%@page import="com.sun.tools.jconsole.JConsoleContext.ConnectionState"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%@page import="com.tech.blog.entities.*" %>


<%
	User user=(User)session.getAttribute("currentUser");

%>

<div class="row mt-2">

	<%
	
		PostWithLikesDao pdao=new PostWithLikesDao(ConnectionProvider.getConnection());
		List<PostWithLikes> posts=pdao.getAllPostWithLikes();
		Collections.sort(posts);
		int i=0;
		for(PostWithLikes p:posts)
		{
			if(i>=10)
				break;
			
			i++;
			%>
			
			<div class="col-md-6">
			<div class="card mt-2">
			<%
			
			
			
				String x=p.getpPic();	
				if(x!=null)
				{
				
				%>
				
				<img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="">
				
				<%
				}
				
				%>
			
				<div class="card-body ">
					<b><%=p.getpTitle() %></b>
					<p><%=p.getpContent() %></p>
					<%-- <pre><%=p.getpCode() %></pre> --%>
				</div>
				<div class="card-footer text-center" style="">
				
				<%
						 LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
				String likedClass="btn-outline-dark";
				if(user!=null)
				{
					
				
						boolean isLikedByUser=ldao.isLikedByUser(p.getPid(), user.getId());
						
						if(isLikedByUser)
						{
							likedClass="btn-dark";
						}
						else
						{
							likedClass="btn-outline-dark";
						} 
				}
						
						%>
					<a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-dark">Read more</a>
					
					<%if(user!=null)
					{
						
						
						%>
			 	<a href="" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn <%=likedClass%>"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ldao.countLikesOnPost(p.getPid())%></span></a> 
					<%-- <a href="#" class="btn btn-outline-dark"><i class="fa fa-commenting-o"></i><span class="fb-comments-count" data-href="http://localhost:8090/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid() %>#"></span></a> --%>
					<%}else
						{
						
						%>
				<a href="" onclick="alert('Please Login to like this post')" class="btn <%=likedClass%>"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ldao.countLikesOnPost(p.getPid())%></span></a> 
			 	
			 	<%} %>
				
					<!-- <a href="#" class="btn btn-outline-dark"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
					<a href="#" class="btn btn-outline-dark"><i class="fa fa-commenting-o"></i><span>10</span></a> -->
				</div>
			</div>
		</div>
			
			<%
		}
	
	%>




</div>


<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->