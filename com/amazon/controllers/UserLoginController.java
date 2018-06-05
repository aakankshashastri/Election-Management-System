package com.amazon.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amazon.dbConnection.LoginDAO;

@WebServlet("/UserLoginController")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String voterID = request.getParameter("uname");
		String password = request.getParameter("psw");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		session.setAttribute("voter_id", voterID);
		request.setAttribute("voter_id", voterID);
		LoginDAO loginDAO = new LoginDAO();
		try {
		    String result = loginDAO.validate(voterID, password);
			if (result != null) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("OngoingElections.jsp");
				requestDispatcher.forward(request, response);
				session.setAttribute("location",result);

			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User or password incorrect');");
				out.println("location='login.jsp';");
				out.println("</script>");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	

}
