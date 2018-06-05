<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="CSS/t.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="JS/HomePage.js"></script>
<title>Ongoing Elections</title>
<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>
<style>
body {
	background-image: url("images/a.jpg");
	background-color: #cccccc;
	background-repeat: no-repeat;
}
</style>
</head>
<header>
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<br> <a href="profile.jsp"><span
			class="glyphicon glyphicon-user"
			style="font-size: 30px; color: white;"></span>&ensp; Your Account</a> <a></a>
		<a href="OngoingElections.jsp"><span
			class="glyphicon glyphicon-star-empty"
			style="font-size: 30px; color: white;"></span>&ensp; Ongoing
			Elections</a> <a></a> <a href="PreviousElections.jsp"><span
			class="glyphicon glyphicon-list"
			style="font-size: 30px; color: white;"></span>&ensp; Previous
			Elections</a> <a></a> <a href="index.html"><span
			class="glyphicon glyphicon-off"
			style="font-size: 30px; color: white;"></span>&ensp; Log Out</a>
	</div>

	<div id="main">
		<span style="font-size: 40px; cursor: pointer" onclick="openNav()">&#9776;</span>
	</div>



	<div id="title" style="cursor: pointer" onclick="">
		<a href="Candidates_Retrieval.jsp" style="color: white"><span
			class="glyphicon glyphicon-hourglass"></span> Candidates</a>
	</div>
	<hr>

</header>
<body>

	<%
		String id = request.getParameter("id");
		session.setAttribute("elecid", id);

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		Statement statement = null, stm = null;
		ResultSet resultSet = null;
		ResultSet rs = null;
	%>
	<h2 align="center">
		<font><strong></strong></font>
	</h2>
<body>
	<jsp:include page="timer.jsp">
		<jsp:param name="id" value="<%=id%>" />
	</jsp:include>
	<h2 align="center">
		<font><strong></strong></font>
	</h2>
	<br>
	<table align="center"
		style="font-family: Comic Sans MS; font-size: 135%;" height="200"
		width="750" cellpadding="25" cellspacing="15" width="750"
		cellpadding="25" cellspacing="15">
		<tr>

		</tr>
		<tr bgcolor="#DCDCDC">
			<td><b>Candidate Id</b></td>
			<td><b>Candidate_Name</b></td>
			<td><b>Party Name</b></td>
			<td><b>Vote</b></td>
		</tr>
		<%
			try {
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1234");
				statement = connection.createStatement();
				String sql = "SELECT * FROM Candidates where E_id = '" + id + "'";
				session.setAttribute("election_id", id);
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tr bgcolor="#F5F5DC">

			<!--<td><%=resultSet.getString("candidate_id")%></td>-->
			<td><a
				href="GetCandidateInfo?cid=<%=resultSet.getString("candidate_id")%>"><%=resultSet.getString("candidate_id")%></a></td>
			<td><%=resultSet.getString("Candidate_Name")%></td>
			<td><%=resultSet.getString("party_name")%></td>
			<td><a
				href="voteCandidate.jsp?id=<%=resultSet.getString("candidate_id")%>">Vote</a></td>
		</tr>

		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

			}
		%>
	</table>
</body>


</html>
