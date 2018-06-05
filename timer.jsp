						<!DOCTYPE HTML>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%
	String query = null;
	String id = request.getParameter("id");
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String startTime = null;
	String endTime = null;
	Statement statement1 = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","1234");
			statement = connection.createStatement();
			query = "select * from Elections where E_id = '"+id+"'";
			resultSet = statement.executeQuery(query);

			while(resultSet.next()){
				startTime = resultSet.getString("start_time");
				endTime = resultSet.getString("end_time");
				DateFormat srcDf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = srcDf.parse(endTime);
				DateFormat destDf = new SimpleDateFormat("MMMM dd, yyyy hh:mm:ss");
				endTime = destDf.format(date);
			}
%>


<html>
<head>
<style>
body{
	text-align: center;
font-family: sans-serif;
font-weight: 100;
}
h1{
color: #396;
font-weight: 100;
font-size: 40px;
margin: 40px 0px 20px;
}

#clockdiv > div{
	padding: 10px;
	font-family: sans-serif;
	border-radius: 3px;
	background: #ffffff;
	display: inline-block;
}
#clockdiv div > span{
	padding: 15px;
	color : #fff;
	border-radius: 3px;
	background: #000000;
	display: inline-block;
}
smalltext{
	padding-top: 5px;
    font-size: 16px;
}
</style>
</head>
<body>

<div id="clockdiv">
<div>
	<span class="days" id="day"></span>
	<div class="smalltext">Days</div>
</div>
<div>
	<span class="hours" id="hour"></span>
	<div class="smalltext">Hours</div>
</div>
<div>
	<span class="minutes" id="minute"></span>
	<div class="smalltext">Minutes</div>
</div>
<div>
	<span class="seconds" id="second"></span>
	<div class="smalltext">Seconds</div>
</div>
</div>

<p id="demo"></p>

<script>
var date ="<%=endTime.toString()%>";
var deadline = new Date(date).getTime();

var x = setInterval(function() {

var now = new Date().getTime();
var t = deadline - now;
var days = Math.floor(t / (1000 * 60 * 60 * 24));
var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60));
var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
var seconds = Math.floor((t % (1000 * 60)) / 1000);
document.getElementById("day").innerHTML =days ;
document.getElementById("hour").innerHTML =hours;
document.getElementById("minute").innerHTML = minutes; 
document.getElementById("second").innerHTML =seconds;

if (parseInt(t,10) < 0) {
		clearInterval(x);
		x = null;
		document.getElementById("demo").innerHTML = "TIME UP";
		document.getElementById("day").innerHTML ='0';
		document.getElementById("hour").innerHTML ='0';
		document.getElementById("minute").innerHTML ='0' ; 
		document.getElementById("second").innerHTML = '0'; 
		<%
		String sql = "update Elections set status = -1 where now() >= end_time and E_id = '"+id+"'";
		//statement1 = connection.createStatement();
    	statement.executeUpdate(sql);%>
		}
}, 1000);

</script>
<%

	} catch (Exception e) {
	e.printStackTrace();}%>

</body>
</html>					