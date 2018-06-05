package com.amazon.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.amazon.beans.CandidateBean;
import com.amazon.dbConnection.createCandidateDAO;

import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/CreateCandidate")

public class CreateCandidate extends HttpServlet {
	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");

		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// gets values of text fields
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		String photo = "";
		try (PrintWriter out1 = response.getWriter()) {
			HttpSession session = request.getSession();
			Part filePart = request.getPart("image");

			
			String path = "/home/user/Desktop/test/";

			File file = new File(path);
			file.mkdir();
			String fileName = getFileName(filePart);

			OutputStream os = null;

			InputStream filecontent = null;

			PrintWriter writer = response.getWriter();
			try {
				os = new FileOutputStream(new File(path + File.separator + fileName));

				filecontent = filePart.getInputStream();

				int read = 0;
				final byte[] bytes = new byte[1024];

				while ((read = filecontent.read(bytes)) != -1) {
					os.write(bytes, 0, read);

					photo = path + "/" + fileName;

				}

			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		System.out.println(photo);
		CandidateBean cd = new CandidateBean();
		cd.setAge(Integer.parseInt(request.getParameter("age")));
		cd.setAgenda(request.getParameter("agenda"));
		cd.setCandidate_Name(request.getParameter("cname"));
		cd.setCandidate_Id(request.getParameter("cid"));
		cd.setElection_Id(request.getParameter("eid"));
		cd.setImagePath(photo);
		cd.setParty_Name(request.getParameter("party_name"));
		cd.setEmailId(request.getParameter("emailid"));
		try {
			int res = createCandidateDAO.createCandidateInfo(cd);
			if(res > 0)
				System.out.println("success!!!");
			else
				System.out.println("fail");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
