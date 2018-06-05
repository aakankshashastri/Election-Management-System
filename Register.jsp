<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cabriolet Registration</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="CSS/main.css">
<link rel="stylesheet" href="JS/register.js">

<body bgcolor="#E6E6FA">     
	<section class="container"> <section class="container-header"
		style="padding:35px 50px;">
	<h4>
		<span class="glyphicon glyphicon-pencil"></span> Registration
	</h4>
	</section> <section class="container-body" style="padding:40px 50px;">
	<form role="form" action="CreateUser" method="post">
		<section class="form-group"> <label for="voterId"><span
			class="glyphicon glyphicon-user"></span>Voter Id</label> <input type="text"
			class="form-control" name="voterid" required="" length=10
			placeholder="Enter Voter ID"> </section>

		<section class="form-group"> <label for="Name"><span
			class="glyphicon glyphicon-user"></span>Name</label> <input type="text"
			class="form-control" name="name" required="" placeholder="Enter Name">
		</section>

		<section class="form-group"> <label for="emailID"><span
			class="glyphicon glyphicon-envelope"></span> Email ID</label> <input
			type="email" class="form-control" name="emailID" required=""
			placeholder="Enter Email ID"> </section>
		<section class="form-group"> <label for="password"><span
			class="glyphicon glyphicon-eye-open"></span> Password</label> <input
			type="password" class="form-control" name="password" id="password"
			required="" placeholder="Enter Password"> </section>

		<section class="form-group"> <label for="reEnterPassword"><span
			class="glyphicon glyphicon-eye-open"></span> Re-enter Password</label> <input
			type="password" class="form-control" name="reEnterPassword"
			required="" id="reEnterPassword" placeholder="Re-enter Password">
		</section>
				<section class="form-group"> <label for="reEnterPassword"><span
			class="glyphicon glyphicon-eye-open"></span> Location</label> <input
			type="text" class="form-control" name="location"
			required="" id="location" placeholder="Enter Location">
		</section>

		<button type="submit" class="btn btn-basic btn-block">
			<span class="glyphicon glyphicon-ok"></span> Sign Up
		</button>

	</form>
	</section> <section class="container-footer">
	<p align="center">
		Already a member? <a href="login.jsp">Login</a>
	</p>
	</section> </section>



</body>
</html>