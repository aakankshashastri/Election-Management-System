<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

  
<%
	String id = request.getParameter("id");
	String voterId = request.getParameter("voter_id");
	session.setAttribute("id",id);
	session.setAttribute("voter_id",voterId);

	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null,stm = null;
	ResultSet resultSet = null;
	ResultSet rs = null;
%>

  
<h2 align="center">
	<font><strong></strong></font>
</h2>
<table align="center" cellpadding="15" cellspacing="5">
	<tr>

	</tr>
	<tr bgcolor="#a3c2c2">
		<td><b>Candidate Id</b></td>
		<td><b>Election Id</b></td>
		<td><b>Age</b></td>
		<td><b>Agenda</b></td>
		<td><b>Party Name</b></td>
		<td><b>Vote</b></td>
		<td><b>Image</b></td>
	</tr>
	<%
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","1234");
			statement = connection.createStatement();
			String sql = "SELECT * FROM Candidates where E_id = '145' ";
			session.setAttribute("election_id", id);
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
	%>
	<tr bgcolor="#d0e1e1">
		<td><%=resultSet.getString("candidate_id")%></td>
		<td><a href="GetCandidateInfo?cid=<%=resultSet.getString("candidate_id")%>"><%=resultSet.getString("candidate_id")%></a></td>
		<td><%=resultSet.getString("E_id")%></td>
		<td><%=resultSet.getString("Age")%></td>
		<td><%=resultSet.getString("Agenda")%></td>
		<td><%=resultSet.getString("party_name")%></td>
		<td><img src= "/Desktop/test/motorola-moto-z2-play.jpeg"/></td>

		<%if (session.getAttribute("voter_id") == null || session.getAttribute("voter_id").equals("")) {%>
			<td><a href="login.jsp">Vote</a></td>
		<% } else {%>
					<td><a href="voteCandidate.jsp?eid=<%=resultSet.getString("candidate_id")%>">Vote</a></td>
		<% }
		} %>
	</tr>

	<%
		

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
	%>
</table>
