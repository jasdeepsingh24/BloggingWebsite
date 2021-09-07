<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>

    
    <%
    
    	int postId=Integer.parseInt(request.getParameter("post_id"));
    

	User user=(User)session.getAttribute("currentUser");
	if(user==null)
	{
		/* response.sendRedirect("login_page.jsp"); */
		
		
	}
	
	PostDao pdao=new PostDao(ConnectionProvider.getConnection());
	Post p=pdao.getPostByPostId(postId);
	


    	
    %>
<!DOCTYPE html>
<html>
<head>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v9.0" nonce="87RM4QMe"></script>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle() %></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

		
     
      .img {
        width: 100px;
        height: 100px;
        border-radius:50%;
        object-fit:cover;
      }
      .navbarImg{
        width: 40px;
        height: 40px;
        border-radius:50%;
        object-fit:cover;
      }
    </style>

</head>
<body>


<!-- navbar starting -->
	<%
	if(user==null)
	{
		%>
		
		<%@include file="normal_navbar.jsp" %>
		<%
	}
	else
	{
	
	%>
	
	<nav class="navbar navbar-expand-lg navbar-dark  bg-dark">
  <a class="navbar-brand" href="#"><span class="fa fa-apple"></span> Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="index.jsp">Home <span ></span></a>
      </li>
      
      <li class="nav-item">
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

	<%} %>
	
	<!--  navbar ending-->
	
	<%
							Message m=(Message)session.getAttribute("message");
							if(m!=null)
							{
			 					%>
								
								<div class="alert <%=m.getCssClass() %> text-center" role="alert">
								  <%=m.getContent() %>
								</div>
								
								<%
								
								session.removeAttribute("message");
							}
						%>
						
						
<!-- 		--------------------------------------------------				main start------------------------------------------------------------------ -->
						
						
		<div class="container-fluid "style="margin-bottom:100px;">
			<div class="row ">
		
				<div class="col-md-10 text-center offset-md-1">
					
					
						<div class="text-center" style="margin-top:70px;"><h5 class="display-1"><%=p.getpTitle() %></h5></div>
						<%
						
						Timestamp ts = p.getpDate();
						Date date = new Date();
						date.setTime(ts.getTime());
						String formattedDate = new SimpleDateFormat("dd MMMM yyyy").format(date);
						UserDao udao=new UserDao(ConnectionProvider.getConnection());
						User u=udao.getUserById(p.getUserId());
						
						%>
						
						<div class="" style="text-align:left;" >Author: <img class="navbarImg" src="pics/<%=u.getProfile() %>"> <%=u.getName() %> <div class="mr-5" style="text-align:right;" >-posted on<b> <%=formattedDate %></b></div></div>
						
						<div class="card" style="margin-top:50px;">
						<div class="card-body">
						
						<p class="text-dark" style="text-align:left;font-size:20px;"><%=p.getpContent() %></p>
						
						
						</div>
						<br>
						<%
						
						if(p.getpCode()!=null)
						{
							
						
						
						%>
						<div class="card-footer">
						
						<pre class="text-dark "style="text-align:left;"> <%=p.getpCode() %></pre>
						
						
						</div>
						<%}else
							{
						%>
						
						<div class="display-1">red</div>
						
						<%} %>
						
						
						
						<div class="mt-20">
						<img src="blog_pics/<%=p.getpPic() %>" alt="">
						</div>
						<%
							if(p.getLink1()!=null || p.getLink2()!=null || p.getLink3()!=null)
							{

						%>
						<div style="text-align:left;margin-bottom:40px;margin-left:40px;">
						<a href="<%=p.getLink1() %>" target="_blank"><%=p.getLink1() %></a><br>
						<a href="<%=p.getLink2() %>" target="_blank"><%=p.getLink2() %></a><br>
						
						<a href="<%=p.getLink3() %>" target="_blank"><%=p.getLink3() %></a><br>
						</div>
						<%  } %>
						</div>
						
						<div class="card-footer text-center" style="">
						<%
						String likedClass="";
						LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
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
					
						String onClickfunction;
						if(user==null)
						{
							%>
							
							<a href="" onclick="alert('Please login to like this post')"  class="btn btn-outline-dark"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ldao.countLikesOnPost(p.getPid()) %></span></a>
							<%
						}
						else
						{
							%>
							<a href="" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)"  class="btn <%=likedClass%>"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ldao.countLikesOnPost(p.getPid()) %></span></a>
							
							<%
						}
						%>
						
						 
					
					
					<a href="#" class="btn btn-outline-dark"><i class="fa fa-commenting-o"></i><span class="fb-comments-count" data-href="http://localhost:8090/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid() %>#"></span></a>
				</div>
				<div class="card-footer">
				<h3 class="display-4"><b>Comments</b></h3>
				
				<div class="fb-comments" data-href="http://localhost:8090/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid() %>#" data-width="" data-numposts="5"></div>
				
				</div>
					
					
					
				</div>
			
			</div>
		
		</div>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
<!-- 		-----------------------------	-----------------------------------------------------main ending---------------------------------------------- -->
						
				<%
				if(user!=null)
				{
				
				%>		
						<!-- profile modal -->
		
		<!-- Button trigger modal -->
				<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
				  Launch demo modal
				</button> -->
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header primary-background text-white text-center">
				        <h5 class="modal-title" id="exampleModalLabel text-center" >TechBlog</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <div class="container text-center ">
				        	
				        		<img class="img" src="pics/<%=user.getProfile() %>">
				        	
				        	<h5 class="modal-title" id="exampleModalLabel"><%=user.getName() %></h5>
				        	<!-- details -->
				        	
				        	<div id="profile-details">
				        		<table class="table">
							  <!-- <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">First</th>
							      <th scope="col">Last</th>
							      <th scope="col">Handle</th>
							    </tr>
							  </thead> -->
							  <tbody>
							    <tr>
							      <th scope="row">ID:</th>
							      <td><%=user.getId() %></td>
							      
							      
							    </tr>
							    <tr>
							      <th scope="row">Email:</th>
							      <td><%=user.getEmail() %></td>
							      
							      
							    </tr>
							    <tr>
							      <th scope="row">Gender:</th>
							      <td><%=user.getGender().toUpperCase() %></td>
							      
							      
							    </tr>
							    <tr>
							      <th scope="row">Status:</th>
							      <td><%=user.getAbout() %></td>
							      
							      
							    </tr>
							    <tr>
							      <th scope="row">Registered On:</th>
							      <td><%=user.getDateTime() %></td>
							      
							      
							    </tr>
							  </tbody>
							</table>
				        	
				        	
				        	
				        	</div>
				        	
				        	<!-- profile edit -->
				        	
				        	<div id="profile-edit" style="display:none;">
				        		<h3 class="mt-2">Please Edit Carefully</h3>
				        		
				        		<form action="EditServlet" method="post" enctype="multipart/form-data">
				        			<table class="table">
				        				<tr>
				        					<td>ID:</td>
				        					<td><%=user.getId() %></td>
				        				</tr>
				        				<tr>
				        					<td>Name:</td>
				        					<td><input type="text" name="user_name" class="fomr-control" value="<%=user.getName()%>"></td>
				        				</tr>
				        				<tr>
				        					<td>Email:</td>
				        					<td><input type="email" name="user_email" class="fomr-control" value="<%=user.getEmail()%>"></td>
				        				</tr>
				        				<tr>
				        					<td>Password:</td>
				        					<td><input type="password" name="user_password" class="fomr-control" value="<%=user.getPassword()%>"></td>
				        				</tr>
				        				<tr>
				        					<td>Gender:</td>
				        					<td><%=user.getGender().toUpperCase() %></td>
				        				</tr>
				        				<tr>
				        					<td>Status:</td>
				        					<td><textarea name="user_about" class="form-control" rows="3"  ><%=user.getAbout()%></textarea></td>
				        				</tr>
				        				<tr>
				        					<td>New Profile:</td>
				        					<td><input type="file" name="image" class="form-control"></td>
				        				</tr>
				        			</table>
				        			
				        			<div class="container">
				        				<button type="submit" class="btn primary-background text-white">Save</button>
				        			</div>
				        		</form>
				        	</div>
				        	
				        	<!-- details end -->
				        </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="button" id="edit-profile-button" class="btn  primary-background text-white">Edit</button>
				      </div>
				    </div>
				  </div>
				</div>
		
		<!-- end of profile modal -->
		
		
		<!-- start of post modal -->
		
		<!-- Button trigger modal -->
			<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-post-modal">
			  Launch demo modal
			</button> -->
			
			<!-- Modal -->
			<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background">
			        <h5 class="modal-title " id="exampleModalLabel">Add Blog</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form action="AddPostServlet" method="post" id="add-post-form">
			       
			        
			        	<div class="form -group">
			        		<div class="input-group mb-3">
							  <div class="input-group-prepend ">
							    <label class="input-group-text" for="inputGroupSelect01">Category</label>
							  </div>
							  <select class="custom-select" id="inputCategory" name="cid" required >
							    <option value="">Choose...</option>
							     <%
							     
							        PostDao postDao=new PostDao(ConnectionProvider.getConnection());
							        
							        ArrayList<Category> l=postDao.getAllCategories();
							    /* 	Collections.sort(l); */
							        for(Category c:l)
							        {
							        	
							        	
							        	
							        
							        
							        	
							        %>
							        
							    <option value="<%=c.getCid()%>"><%=c.getName() %></option>
							    
							 
							    <%} %>
							  </select>
							  
							</div>
			        	</div>
			        	<div class="form-group">
			        		<input type="text" placeholder="Post Title" class="form-control" name="pTitle" required>
			        		
			        	</div>
			        	<div class="form-group">
			        		<textarea class="form-control" placeholder="Post Content" style="height:200px;" name="pContent" required></textarea>
			        		
			        	</div>
			        	
			        	<div class="form-group">
			        		<textarea class="form-control" placeholder="Program Code if any" id="prog" style="height:50px;display:none;" name="pCode"></textarea>
			        		
			        	</div>
			        	<div class="form-group">
			        		<input type="text" placeholder="External Link1 if any" class="form-control" name="link1">
			        		
			        	</div>
			        	<div class="form-group">
			        		<input type="text" placeholder="External Link2 if any" class="form-control" name="link2">
			        		
			        	</div>
			        	<div class="form-group">
			        		<input type="text" placeholder="External Link3 if any" class="form-control" name="link3">
			        		
			        	</div>
			        	<div class="form-group">
			        	<label>Choose photo..</label><br>
			        		<input type="file" name="pPic">
			        		
			        	</div>
			        	<div class="container text-center mb-5">
					        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
					        <button type="submit" class="btn btn-outline-dark"><b>Post</b></button>
					      </div>
			        	</form>
			        
			      </div>
			      
			      
			      
			      
			    </div>
			  </div>
			</div>
		<!-- end of post modal -->
		
		<%} %>


	<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs/dist/tf.min.js"> </script> -->
 <script src="js/myjs.js" type="text/javascript"></script>  
<script>
	$(document).ready(function(){
		
		let editStatus=false;
		
		
		/* var x=$('#inputCategory').val();
		alert(x); */
		 
         
         $('#inputCategory').click(function(){
        	 
        	 var selectedText = $("#inputCategory").find("option:selected").text();
             var selectedValue = $("#inputCategory").val();
             
             if(selectedText=='Programming')
            	 {
            		$('#prog').show();
            	 }
             else
            	 {
            	 $('#prog').hide();
            	 }
         
        	 
         });
         
		
		$('#edit-profile-button').click(function(){
			
			if(editStatus==false)
				{
					$('#profile-details').hide();
					$('#profile-edit').show();
					editStatus=true;
					$(this).text("Back");
				}
			else
				{
				
					$('#profile-details').show();
					$('#profile-edit').hide();
					editStatus=false;
					$(this).text("Edit");
				
				}
			
			
		});
	});
</script>

			<!-- now add post js -->
			
			<script>
			$(document).ready(function(){
				$('#add-post-form').on("submit",function(event){
					
					event.preventDefault();
					console.log('clicked on submit');
					let form=new FormData(this);
					
					
					
					$.ajax({
						url:"AddPostServlet",
						type:'POST',
						data:form,
						
						success:function(data,textStatus,jqXHR){
							
							console.log(data); 
							if(data.trim()=='done')
							{
								swal("Good Job","Blog Submitted Successfully","success");
							}
							else
								{
								/* Swal.fire(
										  'Error!',
										  'Something went wrong.. try again',
										  'error'
										); */
								swal("Error!","Something went wrong.. try again","error");
								}
						},
						error:function(jqXHR,textSatus,errorThrown){
							/* Swal.fire(
									  'Error!',
									  'Something went wrong.. try again',
									  'error'
									); */
							swal("Error!","Something went wrong.. try again","error");
						},
						processData:false,
						contentType:false
					
					});
					
				});
			});
			</script>
			
			<!-- Loading post using ajax -->
			<script>
			
			
			function getPost(catId,temp)
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
			}
				$(document).ready(function(){
					
					let allPostRef=$('.c-link')[0];
					
					getPost(0,allPostRef);
					
					
				});
			</script>
		<!-- <script>
		function doLike(pid,uid){
			console.log(uid+" "+pid);
			const d={
			
				uid:uid,
				pid:pid,
				operation:'like',
			},
			
			$.ajax({
				url:"LikeServlet",
				data:d,
				
				
				success:function(data,textStatus,jqXHR){
				
					console.log(data);
				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log(data);
				},
			
			});
		}
		
		</script> -->
			

</body>
</html>