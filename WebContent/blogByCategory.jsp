<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%@page import="com.tech.blog.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%
	
		
		int cid=Integer.parseInt(request.getParameter("cid"));	
		CategoryDao cdao=new CategoryDao(ConnectionProvider.getConnection());
		Category cl=cdao.getCategoryById(cid);
	%>
	
	
	
	
	<%
	User user=(User)session.getAttribute("currentUser");
	if(user==null)
	{
	%>
	<%@include file="normal_navbar.jsp" %>
	<%
	}else
	{
		%>
		
		<nav class="navbar navbar-expand-lg navbar-dark  bg-dark">
  <a class="navbar-brand" href="#"><span class="fa fa-apple"></span> Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active ">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      
      <li class="nav-item ">
         <a class="nav-link" href="profile.jsp"><span></span>My Posts</a>
      </li>
      
      
      <li class="nav-item">
         <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-plus-square-o"> </span>Post</a>
      </li>
      
      
     <!--  <li class="nav-item">
        <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-circle-o fa-spin"> </span>Logout</a>
      </li> -->
      
      <!-- <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li> -->
    </ul>
    <ul class="navbar-nav mr-right">
    
    <li class="nav-item">
        <img class="navbarImg" alt="" src="pics/<%=user.getProfile() %>">
      </li>
    	<li class="nav-item">
        <a class="nav-link text-white" data-toggle="modal" href="#" data-target="#exampleModal"><span class=""> </span><%=user.getName() %></a>
      </li>
    	<li class="nav-item ">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-circle "> </span>Logout</a>
      </li>
    	
    </ul>
    <!-- <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form> -->
  </div>
</nav> 
		<%
	}
	
	
	%>
	
	
	<div class="container">
	
		<h1 class="display-1"><%=cl.getName() %></h1>
		
		
		<div class="row mt-2">
		
			<%
	
		PostDao pdao=new PostDao(ConnectionProvider.getConnection());
		List<Post> postList=pdao.getPostByCatId(cid);
		
		int i=0;
		for(Post p:postList)
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
	
	</div>

</body>
</html>