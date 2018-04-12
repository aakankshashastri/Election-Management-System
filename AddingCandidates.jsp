<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Election Management System</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/welcomepage.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
window.onbeforeload = function(){
	window.location.replace("welcomepage.html");
}
</script>
</head>

<body >
<section class="bgimg w3-display-container w3-text-black ">
		<section class="col-md-6 col-md-offset-1 w3-allerta">
			<br>
			<p>Election Management System</p>
			
		</section>

		<section class="col-md-6 col-md-offset-2 w3-container w3-xlarge">
			<br>
			<br>
			<br>
			<br>
			<p>
				<button type="button" class="btn btn-basic btn-lg" id="myBtn">Let's get started</button>
			</p>
		</section>

	</section>
	<section class="modal fade" id="myModal" role="dialog">
		<section class="modal-dialog">

			<!-- Modal content-->
			<section class="modal-content">
				<section class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-plus"></span>Add Candidates
					</h4>
				</section>

				<section class="modal-body" style="padding: 40px 50px;">
					<form role="form" action="Trail" enctype="multipart/form-data" method="post">
						<section class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-user"></span>Candidate ID</label> <input
								type="text" class="form-control" name="cid"
								placeholder="Enter Candidate Id" required>
						</section>
						
						<section class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-asterisk"></span>Age</label> <input
								type="text" class="form-control" name="age"
								placeholder="Enter Age" required>
						</section>
						
						<section class="form-group">
							<label for="post"><span
								class="glyphicon glyphicon-user"></span>Photo</label> <input
								type="file" class="form-control" name="photo"
								placeholder="Upload Photo" required>
						</section>
						<section class="form-group">
							<label for="start_time"><span
								class="glyphicon glyphicon-bullhorn"></span>Agenda</label> <textarea rows="4" cols="50" class="form-control" name="agenda" 
								placeholder="Enter Agenda" required></textarea>
						</section>
						<section class="form-group">
							<label for="end_time"><span
								class="glyphicon glyphicon-edit"></span>Party Name</label> <input
								type="text" class="form-control" name="party_name"
								placeholder="Enter your party name" required>
						</section>

						<button type="submit" class="btn btn-basic btn-block" >
							<span class="glyphicon glyphicon-off"></span> Submit
						</button>

					</form>
				</section>

				
			</section>

		</section>
	</section>

	<script>
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
			});
		});
	</script>
</body>
</html>
 