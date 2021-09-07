<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home</title>



<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <style>
	.banner-background{
		clip-path: polygon(100% 0, 100% 21%, 100% 51%, 100% 94%, 75% 89%, 53% 100%, 26% 92%, 0 100%, 0% 35%, 0 0);
	}
</style> -->


</head>
<body>
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
	
	
	<div class="contianer-fluid parallax ">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to Tech Blog</h3>
				
				<p>Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended to let application developers write once, run anywhere (WORA),[17] meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.[18] Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them. The Java runtime provides dynamic capabilities (such as reflection and runtime code modification) that are typically not available in traditional compiled languages. As of 2019, Java was one of the most popular programming languages in use according to GitHub,[19][20] particularly for client-server web applications, with a reported 9 million developers</p>
				<br>
				<a href="register_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-plus"> </span>Start for free</a>
				<a href="login_page.jsp"class="btn btn-outline-light"><span class="fa fa-user-circle-o fa-spin"> </span> Login</a>
			</div>
		</div>
	</div>
	
	
	
	<div class="container">
	
	<h1 class="display-1"><b>Latest</b></h1>
	
	<div>
		<jsp:include page="latestblogshomepage.jsp" />
	</div>
	
	<br>
	<hr>
	
	<br>
	
	<h1 class="display-1"><b>Most Liked</b></h1>
	
	<div>
		<jsp:include page="mostlikedhomepage.jsp" />
	</div>
	
	<br>
	
	
	<br>
	
	
	<%-- 
		<div class="text-center container-fluid">
			<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <label class="input-group-text" for="inputGroupSelect01">Category</label>
	  </div>
	  <select class="custom-select" id="inputCategory">
	    <option selected>All</option>
	    <%
	    	
	    	PostDao pdao=new PostDao(ConnectionProvider.getConnection());
	    	List<Category> categories=pdao.getAllCategories();
    		for(Category c:categories)
    		{
	    %>
	    <option value="<%=c.getCid()%>"><%=c.getName() %></option>
	    
	    <%} %>
	    
	  </select>
	</div>
	<!-- <div class="container-fluid" id="post-container">
								
								</div> -->
		</div>
	 --%>
	
	</div>
	<br>
	
	
	
	<!-- cards -->
	
	<!-- <div class="container ">
		<div class="row">
		
			<div class="col-md-4">
				<div class="card m-10" style="width:400px">
			  <img class="card-img-top" src="img_avatar1.png" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">Java Programming</h4>
			    <p class="card-text">Some example text.</p>
			    <a href="#" class="btn primary-background text-white">Read More</a>
			  </div>
			</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" style="width:400px">
			  <img class="card-img-top" src="img_avatar1.png" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">Java Programming</h4>
			    <p class="card-text">Some example text.</p>
			    <a href="#" class="btn primary-background text-white">Read More</a>
			  </div>
			</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" style="width:400px">
			  <img class="card-img-top" src="img_avatar1.png" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">Java Programming</h4>
			    <p class="card-text">Some example text.</p>
			    <a href="#" class="btn primary-background text-white">Read More</a>
			  </div>
			</div>
			</div>
			
				
		</div>
		
		
		<div class="row mb-10">
		
			<div class="col-md-4">
				<div class="card" style="width:400px">
			  <img class="card-img-top" src="img_avatar1.png" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">Java Programming</h4>
			    <p class="card-text">Some example text.</p>
			    <a href="#" class="btn primary-background text-white">Read More</a>
			  </div>
			</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" style="width:400px">
			  <img class="card-img-top" src="img_avatar1.png" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">Java Programming</h4>
			    <p class="card-text">Some example text.</p>
			    <a href="#" class="btn primary-background text-white">Read More</a>
			  </div>
			</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" style="width:400px">
			  <img class="card-img-top" src="img_avatar1.png" alt="Card image">
			  <div class="card-body">
			    <h4 class="card-title">Java Programming</h4>
			    <p class="card-text">Some example text.</p>
			    <a href="#" class="btn primary-background text-white">Read More</a>
			  </div>
			</div>
			</div>
			
				
		</div>
		
		
		
	</div> -->
	


	<%
		Connection con=ConnectionProvider.getConnection();
	
	%>
	
	<%-- <h1><%= con %></h1> --%>
	
	
	
	
	
	<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


 <script src="js/myjs.js" type="text/javascript"></script> 
 
 
 <script>
	/* $(document).ready(function(){
		
		let editStatus=false;
		
		
		/* var x=$('#inputCategory').val();
		alert(x); */
		 
         
         $('#inputCategory').click(function(){
        	 
        	 var selectedText = $("#inputCategory").find("option:selected").text();
             var selectedValue = $("#inputCategory").val();
             
           /*  alert(selectedValue); */
            
            getPost(selectedValue)
         
        	 
         });
         
		
		
			
			
		
	});
	
	function getPost(catId)
	{
		$('#loader').show();
		$('#post-container').hide();
		
		$('.c-link').removeClass('active');
		
		$.ajax({
			url:"load_posts.jsp",
			data: {cid:catId},
			success:function(data,textStatus,jqXHR)
			{
				console.log(data);
				$('#loader').hide();
				$('#post-container').show();
				$('#post-container').html(data);
				$(temp).addClass('active');
			},
			/* error:function(jqXHR,) */
		});
	} */
		
</script>

<!-- <<script>
	$(document).ready(function(){
		alert("document loaded");
	});
</script>  -->
</body>
</html>