<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%@include file="normal_navbar.jsp" %>

	<main class="primary-background  banner-background" style="padding-bottom:100px">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
					<span class="fa fa-3x fa-user-circle"></span>
					Register Here
					</div>
					<div class="card-body">
					
						<form id="reg-form" action="RegisterServlet" method="post">
						
						  <div class="form-group">
						    <label for="user_name">User Name</label>
						    <input name="user_name" required type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input name="user_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						  </div>
						  
						  <div class="form-group">
						    <label for="gender">Select Gender</label>
						    <br>
						    <input type="radio"  id="gender" required name="gender" value="Male">Male
						    <input type="radio"  id="gender" required name="gender" value="Female">Female
						  </div>
						  
						  <div class="from-group">
						  	<textarea name="about" class="form-control"  rows="5" placeholder="Enter something about yourself"></textarea>
						  </div>
						  <div class="form-check">
						    <input name="check"type="checkbox" required class="form-check-input" id="exampleCheck1"> 
						    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
						  </div>
						  
						  <div class="container text-center" id="loader" style="display:none;">
						  	<span class="fa fa-refresh fa-spin fa-3x"></span>
						  <br>
						  </div>
						  <button id="submit-btn" type="submit" class="btn primary-background text-white">Signup</button>
						</form>

					</div>
					<div class="card-footer">
					
					</div>
				</div>
			</div>
			</div>
		</div>
	</main>

</body>



<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
	/* $(document).ready(function(){
		console.log("loaded..");
		$('#reg-form').on('submit',function(event){
			event.preventDefault();
			
			let form=new FormData(this);
			//send register servlet
			$.ajax({
				url:"RegisterServlet",
				type='Post',
				data=form,
				success:function(data,textStatus,jqXHR)
				{
					console.log(data);
				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log(jqXHR);
				},
				processData:false,
				contentType:false,
			})
		});
	}); */
	$(document).ready(function(){
		console.log("loaded........");
		$('#reg-form').on('submit',function(event){
			event.preventDefault();
			
			let form=new FormData(this);
			$('#submit-btn').hide();
			$('#loader').show();
			$.ajax({
				url:"RegisterServlet",
				type:'Post',
				data:form,
				success:function(data,textStatus,jqXHR)
				{
					console.log(data);
					$('#submit-btn').show();
					$('#loader').hide();
					
					if(data.trim()==='saved')
					{
						swal("Registered Successfully... we are redirecting you to login page")
							.then((value)=>{
								window.location="login_page.jsp"
							});
					}
					else
					{
						swal(data);
					}
						
					
					
				},
				error:function(jqXHR,textStatus,errorThrown)
				{
					$('#submit-btn').show();
					$('#loader').hide();
					swal("Something went wrong")
				},
				processData: false,
				contentType:false
				
			});
			
		});
	});
	
</script>

</html>