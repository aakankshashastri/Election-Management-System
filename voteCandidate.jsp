<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
	String id = request.getParameter("id");
	System.out.println(id);
	Connection con = null;
	PreparedStatement ps = null;
	Statement ps1 = null;
	Statement ps2 = null;
	Statement ps3 = null;
	ResultSet r = null;
	ResultSet r1 = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "1234");
		String str = "select location from Elections where E_id = '" + session.getAttribute("elecid") + "'";
		ps3 = con.createStatement();
		r1 = ps3.executeQuery(str);
		if (r1.next()) {
		//	System.out.println(r.getString(1) + " " + session.getAttribute("location"));
			if (session.getAttribute("location").equals(r1.getString(1))) {
				System.out.println("cand id" + id + "elc id" + session.getAttribute("elecid") + "voterid"
						+ session.getAttribute("voter_id"));
				String s = "select * from Voters where E_id = '" + session.getAttribute("elecid")
						+ "' and voter_id = '" + session.getAttribute("voter_id") + "' ";
				ps2 = con.createStatement();
				r = ps2.executeQuery(s);
				if (r.isBeforeFirst()) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('You already casted vote in this Election');");
					out.println("location='OngoingElections.jsp';");
					out.println("</script>");
				} else {
					String query = "select num_of_votes from Candidates where candidate_id = '" + id + "' ";
					ps1 = con.createStatement();
					int votes = 0;
					ResultSet rs = ps1.executeQuery(query);
					if (rs.next())
						votes = rs.getInt("num_of_votes");
					System.out.println(votes);
					ps = con.prepareStatement(
							"Update Candidates set num_of_votes = ? where candidate_id= '" + id + "' ");
					ps.setInt(1, votes + 1);
					int i = ps.executeUpdate();
					if (i > 0) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Thanking You for casting your vote in the Election');");
						out.println("location='OngoingElections.jsp';");
						out.println("</script>");
					} else {
						out.print("There is a problem in updating Record.");
					}
					PreparedStatement p = con
							.prepareStatement("insert into Voters (voter_id,E_id)" + "values (?, ?)");
					p.setString(1, (String) session.getAttribute("voter_id"));
					p.setString(2, (String) session.getAttribute("elecid"));
					i = p.executeUpdate();
					if (i > 0) {
						out.println("You voted!");
					} else {
						out.println("You didnt");
					}  
				}

			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('You cant cast vote in a election that doesnot belong to your locality');");
				out.println("location='OngoingElections.jsp';");
				out.println("</script>");
			}
		}
	} catch (SQLException sql) {
		out.println("no connection");
	}
%>