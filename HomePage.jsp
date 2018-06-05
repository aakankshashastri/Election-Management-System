
<!DOCTYPE html>
<html>
<head>
	<title>Home Page</title>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="CSS/HomePage.css"> 
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Francois+One">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cuprum">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Convergence">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="JS/HomePage.js"></script>
	
</head>

<body>
	<header>

		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<br>
 			<a href="UserProfile.jsp"><span class="glyphicon glyphicon-user" style="font-size:30px;color:white;"></span>&ensp; Your Account</a>
 			<a></a>
			<a href="OngoingElections.jsp"><span class="glyphicon glyphicon-list" style="font-size:30px;color:white;"></span>&ensp; Ongoing Elections</a>
			<a></a>
			<a href="PreviousElections.jsp"><span class="glyphicon glyphicon-list" style="font-size:30px;color:white;"></span>&ensp; Previous Elections</a>
			<a></a>
			
		</div>

		<div id="main">
			<span style="font-size:40px;cursor:pointer" onclick="openNav()">&#9776;</span>
		</div>

		<div id="title" style="cursor: pointer" onclick="">
			<a href="SelectionPage.jsp" style="color:white"><span class="glyphicons glyphicons-elections"></span>Election Management System
		</a>
		</div>
	</header>

	<section class="bgimg">
		<section class="row">
			<section class="col-md-5 col-md-offset-2">
				<br style="line-height: 7em;">
				
				<br style="line-height: 5.6em;">
			</section>
		</section>
		<br><br><br><br><br><br><br><br><br><br>
		<center>
			<form method="get" action="OngoingElections.jsp">
				 <button class="btn btn-basic btn-lg w3-light-grey w3-hover-light-grey" style="font-weight:900;">ARE YOU READY TO VOTE?</button>
    			
			</form>
		</center>
		<br><br><br><br><br><br><br>
		<div class="container"  style="position: relative;bottom: 0; width:100%;">
			<div class="col-lg-4 divider">
    			<center>
   
	    			<h1><strong><p style="color:black; font-family: "Allerta Stencil", Sans-serif;">Enact</p></strong></h1> <br>
				
 				<ul id="details">
 				<h3><strong><p style="color:black; font-family: "Allerta Stencil", Sans-serif;">A platform that lets the candidates to put forward their agenda</p></strong></h3> <br>
				</ul>
				</center>							
			</div>
			<div class="col-lg-4 divider">
    			<center>
	    			<h1><strong><p style="color:black; font-family: "Allerta Stencil", Sans-serif;">Elect</p></strong></h1> <br>
				
 				<ul id="details">
 				 	<h3><strong><p style="color:black; font-family: "Allerta Stencil", Sans-serif;">A platform that enables the voters to cast vote to the candidate they prefer</p></strong></h3> <br>
 				
				</ul>
				</center>							
			</div>
			<div class="col-lg-4 divider">
    			<center>
   	    			<h1><strong><p style="color:black; font-family: "Allerta Stencil", Sans-serif;">Evolve<strong></h1> <br>
    			
 				<ul id="details">
 				 	<h3><strong><p style="color:black; font-family: "Allerta Stencil", Sans-serif;">Electing a good leader is very essential for evolution of people</p></strong></h3> <br>
 				
				</ul>
				</center>							
			</div>
		</div>
	</section>

</body>

</html>
