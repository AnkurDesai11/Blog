<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-up</title>

<!--css-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	.banner-background{
		clip-path: polygon(50% 0%, 100% 0, 100% 92%, 65% 100%, 29% 92%, 0 100%, 0 0);
	}
</style>

</head>
<body>

	<!-- 	navbar -->
	<%@include file="common_navbar.jsp" %>

	<main class="primary-background banner-background" style="padding-bottom: 100px">
	
		<div class="container">
		
			<div class="col-md-6 offset-md-3">
			
				<div class="card">
				
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-user-circle fa-3x"></span>
						<br>
						<p>Sign-up Here</p>
					</div>
					
					<div class="card-body">
						<form id="regform" action="RegisterServlet" method="POST" accept-charset=utf-8>
							<div class="form-group">
								<label for="exampleusername">User name</label> <input
									type="text" class="form-control" id="exampleusername" name="username"
									aria-describedby="emailHelp" placeholder="Enter name">
							</div>
							<div class="form-group">
								<label for="exampleusermail">Email address</label> <input
									type="email" class="form-control" id="exampleusermail" name="usermail"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleuserpass">Password</label> <input
									type="password" class="form-control" id="exampleuserpass" name="userpass"
									placeholder="Password">
							</div>
							<div class="form-group">
								<label for="exampleusergend">Select gender</label> 
								<br>
								<input
									type="radio" id="exampleusergend" value="Male" name="usergend"> Male &nbsp;&nbsp;    
									
								<input
									type="radio" id="exampleusergend" value="Female" name="usergend"> Female &nbsp;&nbsp;    
									
								<input
									type="radio" id="exampleusergend" value="Unspecified" name="usergend"> Don't wish to specify
							</div>
							
							<div class="form-group">
								<textarea class="form-control" name="userbout" id="examplegend" rows="3" cols="30" placeholder="Tell us more about yourself"></textarea>
							</div>
							
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="userchek"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">I agree terms and conditions</label>
							</div>
							
							<div class="container text-center" id="loader" style="display:none">
							
								<span class="fa fa-spinner fa-spin fa-3x"></span>
								<h3>Please Wait...</h3>
							
							</div>
							
							<br>
							<button id="submitbtn" type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
					
					<!-- <div class="card-body"></div>-->
				
				</div>
			
			</div>
		
		</div>
	
	</main>
	
	

<!--javascript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/myjs.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>

		$(document).ready(function(){
			console.log("page loaded");
			$('#regform').on('submit', function(){

				event.preventDefault();

				let form = new FormData(this);

				//send registerservlet request
				
				$('#submitbtn').hide();
				$('#loader').show();
				
				$.ajax({
					url:"RegisterServlet",
					type:"POST",
					data: form,
					success: function(data, textStatus, jqXHR){
						console.log(data);
						$('#submitbtn').show();
						$('#loader').hide();
						if(data.trim()==='done'){
							swal("Sign-up successful, redirecting to login page")
							.then((value) => {
						  		window.location="loginpage.jsp";
							});	
						}
						else{
							swal(data);
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
						console.log(jqXHR);
						$('#submitbtn').show();
						$('#loader').hide();
						swal("Something went wrong, please try again");
					},
					processData: false,
					contentType: false

				});
				
			});
		});

	</script>
</body>
</html>