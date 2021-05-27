<%@page import="com.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.blog.entities.User" %>    
<%@page errorPage="errorpage.jsp" %>    
<%

	User user = (User)session.getAttribute("currentUser");
	if(user==null){
		response.sendRedirect("loginpage.jsp");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>

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

	<!-- Navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span class="fa fa-home"></span>
			Blog Home
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="fa fa-hashtag"></span> Learning Journey <span
						class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span class="fa fa-cubes"></span> Topics
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Technology</a> <a
							class="dropdown-item" href="#">Current Affairs</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something new</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-paper-plane-o"></span> Contact us</a></li>
				
			</ul>
			
			<ul class="navbar-nav mr-right mr-4">
				<li class="nav-item"><a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal"><span
						class="fa fa-user-circle"></span> <%= user.getName() %></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-sign-out"></span> Logout</a></li>
			</ul>
			
		</div>
	</nav>

	<!-- Navbar ends here -->

	<%
	Message m = (Message) session.getAttribute("editmsg");
	if (m != null) {
	%>
	<div>
		<div class="alert <%=m.getCssClass()%>" role="alert">
			<%=m.getContent()%>
		</div>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>

	<!-- profile modal -->

	<!-- Modal -->
	
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profilepics/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width: 150px"> 
						<br>
						<h4 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h4>
						
						<!-- user profile details-->
						<div id="profile-details">
						<table class="table mt-2">
							<tbody>
								<tr>
									<th scope="row">Email :</th>
									<td><%= user.getEmail() %></td>
								</tr>
								<tr>
									<th scope="row">Gender :</th>
									<td><%= user.getGender() %></td>
								</tr>
								<tr>
									<th scope="row">About yourself:</th>
									<td><%= user.getAbout() %></td>
								</tr>
								<tr>
									<th scope="row">Registered:</th>
									<td><%= user.getDateTime().toString() %></td>
								</tr>
							</tbody>
						</table>
						</div>
						
						<!-- user profile edit -->
						<div id="profile-edit" style="display:none;">
							<h5 class="mt-2">Edit Profile Details</h5>
							<form action="EditServlet" method="post" enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Name :</td>
										<td><input type="text" name="username" value="<%=user.getName() %>" class="form-control"/></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" name="usermail" value="<%=user.getEmail() %>" class="form-control"/></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" name="userpass" value="<%=user.getPassword() %>" class="form-control"/></td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><input
												type="radio"  id="exampleusergend" value="Male" name="usergend" required> Male &nbsp;
											<input
												type="radio"  id="exampleusergend" value="Female" name="usergend"> Female &nbsp;
											<input
												type="radio"  id="exampleusergend" value="Unspecified" name="usergend"> Don't wish to specify</td>
									</tr>
									<tr>
										<td>About :</td>
										<td>
											<textarea class="form-control" name="userbout"><%=user.getAbout() %></textarea>
										</td>
									</tr>
									<tr>
										<td>New Profile Pic:</td>
										<td><input type="file" name="userfile" class="form-control"/></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary mb-4">Save</button>
								
								</div>
							</form>
							
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<!-- profile modal ends here -->
	
	
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
	<script>

		$(document).ready(function (){
			let editStatus = false;
			$('#edit-profile').click(function(){
				//alert("edit clicked")
				if(editStatus==false){
					$('#profile-details').hide();
					$('#profile-edit').show();
					editStatus = true;
					$(this).text("Back");
				}
				else{
					$('#profile-details').show();
					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("Edit");
				}
				
			})
		})

	</script>
</body>
</html>