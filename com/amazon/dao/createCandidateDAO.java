package com.amazon.dbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import com.amazon.beans.CandidateBean;



public class createCandidateDAO {
	ConnectionFactory connectionFactory = new ConnectionFactory();


	public static int createCandidateInfo(CandidateBean createCandidateBean) throws SQLException {
		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement query = connection.prepareStatement(
					"insert into Candidates(candidate_id,Candidate_Name,image_path,E_id,Age,Agenda,party_name,emailId) values(?,?,?,?,?,?,?,?)");
			
			query.setString(1, createCandidateBean.getCandidate_Id());
			query.setString(2, createCandidateBean.getCandidate_Name());
			query.setString(3, createCandidateBean.getImagePath());
			query.setString(4, createCandidateBean.getElection_Id());
			query.setInt(5,createCandidateBean.getAge());
			query.setString(6, createCandidateBean.getAgenda());
			query.setString(7, createCandidateBean.getParty_Name());
			query.setString(8,createCandidateBean.getEmailId());
			
			
			int resultSet = query.executeUpdate();
			if(resultSet > 0){
				return 1;
				
			} else {
				msgbox("Sorry! Candidate is not created");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	private static void msgbox(String string) {
		JOptionPane.showMessageDialog(null, string);
		
	}

}



