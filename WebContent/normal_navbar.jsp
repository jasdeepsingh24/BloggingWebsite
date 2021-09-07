<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.CategoryDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<nav class="navbar navbar-expand-lg navbar-dark  primary-background">
  <a class="navbar-brand" href="#"><span class="fa fa-apple"></span> Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      
      <li class="nav-item ">
         <a class="nav-link" href="profile.jsp"><span></span>My Posts</a>
      </li>
      
      <!-- <li class="nav-item">
        <a class="nav-link" href="login_page.jsp"><span class=""> </span>Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="register_page.jsp"><span class=""> </span>Signup</a>
      </li> -->
      <!-- <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li> -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle " href="#" id="dpd1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        
        <%
        	PostDao postDao=new PostDao(ConnectionProvider.getConnection());
        	List<Category> categories=postDao.getAllCategories();
        	for(Category c:categories)
        	{
        		
        		%>
        		<a class="dropdown-item" href="blogByCategory.jsp?cid=<%=c.getCid()%>"><%=c.getName()%></a>
        		<%-- load_posts.jsp?cid=<%=c.getCid()%> --%>
        		<%
        		
        	}
        
        %>
          <!-- <a class="dropdown-item" href="#">Action</a> -->
          
          <!-- <a class="dropdown-item" href="#">Something else here</a> -->
        </div>
      </li> 
      <!-- <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li> -->
    </ul>
    <ul class="navbar-nav mr-right">
    
    <li class="nav-item">
        <a class="nav-link" href="login_page.jsp"><span class=""> </span>Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="register_page.jsp"><span class=""> </span>Signup</a>
      </li>
    	
    	
    </ul>
    <!-- <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form> -->
  </div>
</nav> 