<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="CSS/OngoingElections.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/ems" user="root" password="1234" />


	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from Elections where status = 1 
     </sql:query>
	<div class="container">
		<h1>Ongoing Elections</h1>
		<br>
		<div align="center">
        <table border="10" cellpadding="10" width="800" height = "200">
            <tr width="75">
                <th>ID</th>
                <th>Location</th>
                <th>Post</th>
                <th>Start Time</th>
                <th>End Time</th>
            </tr>
            <c:forEach var="election" items="${result.rows}">
                <tr>
                    <td><c:out value="${election.E_id}" /></td>
                    <td><c:out value="${election.location}" /></td>
                    <td><c:out value="${election.post}" /></td>
                    <td><c:out value="${election.start_time}" /></td>
                     <td><c:out value="${election.end_time}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>

</html>