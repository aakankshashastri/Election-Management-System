package com.amazon.controllers;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/Trail")
@MultipartConfig(maxFileSize = 16177215)
public class Trail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	    private String dbURL = "jdbc:mysql://localhost:3306/ems";
	    private String dbUser = "root";
	    private String dbPass = "1234";
	     
	    protected void doPost(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
	        // gets values of text fields
	        String C_Id = request.getParameter("cid");
	        String Age = request.getParameter("age");
	        String Party_Name = request.getParameter("party_name");
	        String Agenda = request.getParameter("agenda");
	        
	         
	        InputStream inputStream = null; // input stream of the upload file
	         
	        // obtains the upload file part in this multipart request
	        Part filePart = request.getPart("photo");
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
	         
	        Connection conn = null; // connection to the database
	        String message = null;  // message will be sent back to client
	         
	        try {
	            // connects to the database
	            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
	 
	      
	            PreparedStatement statement = conn.prepareStatement("INSERT INTO Candidates (candidate_id,img_data,Age,Agenda,party_name) values (?, ?, ?,?,?)");
	            statement.setString(1, C_Id);
	            statement.setString(3, Age);
	            statement.setString(4, Agenda);
	            statement.setString(5, Party_Name);
	            if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
	                statement.setBlob(2, inputStream);
	            }
	 
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) {
	                message = "File uploaded and saved into database";
	            }
	        } catch (SQLException ex) {
	            message = "ERROR: " + ex.getMessage();
	            ex.printStackTrace();
	        } finally {
	            if (conn != null) {
	                // closes the database connection
	                try {
	                    conn.close();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }
	            // sets the message in request scope
	            request.setAttribute("Message", message);
	             
	           
	        }
	    }
	}


