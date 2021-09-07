<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>

<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%@page import="com.tech.blog.entities.*" %>
<!--  <script src="js/myjs.js" type="text/javascript"></script>   -->
<%--  <%@page import="js/myjs.js" %> --%>






<%

	User user=(User)session.getAttribute("currentUser"); 
	PostDao pdao=new PostDao(ConnectionProvider.getConnection());

	int cid=Integer.parseInt(request.getParameter("cid"));
	CategoryDao cdao=new CategoryDao(ConnectionProvider.getConnection());
	Category c=null; 
	List<Post> posts=null;
	
	boolean all=false;
	if(cid==0)
	{
		posts=pdao.getAllUserPosts(user.getId());
		all=true;
		
		
	}
	else
	{
		posts=pdao.getPostByCategoryIdOfCurrentUser(cid, user.getId());
		c=cdao.getCategoryById(cid); 
	}
	
%>
	
	<%
		if(cid!=0)
		{
	
	%>
	<h1 class="display-2 "><%=c.getName() %></h1> 
	
	<%}
		else
		{
	
	
	
	%>
	<h1 class="display-2">Latest</h1> 
	
	<%} %>
	
	<%
	
	if(posts.size()==0)
	{
		%>
		<h1>You have not Posted any blog in this category.</h1>
		<%
		
		
	}
	
	%>
	<%
	
	if(posts.size()==0&&all==true)
	{
		%>
		<h1>To post a blog please click on posts option in navigation bar</h1>
		<%
		
		
	}
	
	%>
			 
	<div class="row mt-2">
	
	<%
	
	for(Post p:posts)
	{
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
						boolean isLikedByUser=ldao.isLikedByUser(p.getPid(), user.getId());
						String likedClass;
						if(isLikedByUser)
						{
							likedClass="btn-dark";
						}
						else
						{
							likedClass="btn-outline-dark";
						}
						
						%>
					<a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-dark">Read more</a>
					<a href="" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn <%=likedClass%>"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ldao.countLikesOnPost(p.getPid())%></span></a>
					<%-- <a href="#" class="btn btn-outline-dark"><i class="fa fa-commenting-o"></i><span class="fb-comments-count" data-href="http://localhost:8090/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid() %>#"></span></a> --%>
					
				
				
					<!-- <a href="#" class="btn btn-outline-dark"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
					<a href="#" class="btn btn-outline-dark"><i class="fa fa-commenting-o"></i><span>10</span></a> -->
				</div>
			</div>
		</div>
		
		
		<%
	}






%>

</div>