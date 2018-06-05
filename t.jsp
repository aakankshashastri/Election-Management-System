<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	String query = null;
	String id = request.getParameter("id");
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String startTime = null;
	String endTime = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1234");
		statement = connection.createStatement();
		query = "select * from Elections where E_id = '144'";
		resultSet = statement.executeQuery(query);
		while (resultSet.next()) {
			startTime = resultSet.getString("start_time");
			endTime = resultSet.getString("end_time");
		}
		System.out.println(endTime);
	} finally {

	}
%>


<p id="demo"></p>

<script>
var dat ="<%=endTime.toString()%>
	document.write(dat);

	var countDownDate = new Date("June 5, 2018").getTime();

	// Update the count down every 1 second
	var x = setInterval(function() {

		// Get todays date and time
		var today = new Date();
		var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();

		document.write(today);
		// Find the distance between now an the count down date
		var distance = dat - now;

		// Time calculations for days, hours, minutes and seconds
		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);

		// Output the result in an element with id="demo"
		document.getElementById("demo").innerHTML = days + "d " + hours + "h "
				+ minutes + "m " + seconds + "s ";

		// If the count down is over, write some text 
		if (distance < 0) {
			clearInterval(x);
			document.getElementById("demo").innerHTML = "EXPIRED";
		}
	}, 1000);
</script>

</body>
</html>
