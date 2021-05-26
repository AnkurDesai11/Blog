<%@page import="com.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<title>Blog Home</title>

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
	
	<!-- banner -->
	<div class="container-fuild p-0 m-0">
		
		<div class="jumbotron primary-background text-white banner-background">
		
			<div class="container">
			
				<h3 class="display-4">Hello There! Welcome to yet another blog site</h3>	
				<p>A blog (contraction of weblog) is a web site with frequent, periodic posts creating an ongoing narrative. They are maintained by both groups and individuals, the latter being the most common. Blogs can focus on a wide variety of topics, ranging from the political to personal experiences.</p>
				<p>Yes, I indeed copied the first few lines from the "Blog" page from Wikipedia</p>
				<a href="signuppage.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle fa-spin"></span> Join</a>
				<a href="loginpage.jsp" class="btn btn-outline-light"><span class="fa fa-sign-in"></span> Login</a>
				
			</div>	
			
		</div>
		
	</div>
	
	<!-- cards -->
	<div class="container">
	
		<div class="row mb-3">
		
			<div class="col-md-4">
			
				<div class="card">

  					<div class="card-body">
    					<h5 class="card-title">Thread 1</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn btn-primary primary-background text-white">Read more</a>
  					</div>
  					
				</div>
			
			</div>
			<div class="col-md-4">
			
				<div class="card">

  					<div class="card-body">
    					<h5 class="card-title">Thread 2</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn btn-primary primary-background text-white">Read more</a>
  					</div>
  					
				</div>
			
			</div>
			<div class="col-md-4">
			
				<div class="card">

  					<div class="card-body">
    					<h5 class="card-title">Thread 3</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn btn-primary primary-background text-white">Read more</a>
  					</div>
  					
				</div>
			
			</div>
		
		</div>
	
		<div class="row mb-3">
		
			<div class="col-md-4">
			
				<div class="card">

  					<div class="card-body">
    					<h5 class="card-title">Thread 1</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn btn-primary primary-background text-white">Read more</a>
  					</div>
  					
				</div>
			
			</div>
			<div class="col-md-4">
			
				<div class="card">

  					<div class="card-body">
    					<h5 class="card-title">Thread 2</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn btn-primary primary-background text-white">Read more</a>
  					</div>
  					
				</div>
			
			</div>
			<div class="col-md-4">
			
				<div class="card">

  					<div class="card-body">
    					<h5 class="card-title">Thread 3</h5>
    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    					<a href="#" class="btn btn-primary primary-background text-white">Read more</a>
  					</div>
  					
				</div>
			
			</div>
		
		</div>
		
		
	</div>
	
	
	
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

</body>

</html>