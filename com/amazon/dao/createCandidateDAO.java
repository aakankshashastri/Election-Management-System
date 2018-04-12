package com.amazon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import com.amazon.beans.createCandidate;
import com.amazon.beans.createElection;

public class createCandidateDAO {
	ConnectionFactory connectionFactory = new ConnectionFactory();
	Connection con = connectionFactory.getConnection();

	public static int createCandidateInfo(createCandidate createCandidateBean) throws SQLException {
		int result = 0;
		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement query = connection.prepareStatement(
					"insert into Candiadates(candidate_id,img_data,E_id,Age,Agenda,party_name) values(?,?,?,?,?,?)");
			
			query.setString(1, createCandidateBean.getCandidate_Id());
			query.setBlob(2, createCandidateBean.getPhoto());
			query.setString(3, createCandidateBean.getElection_Id());
			query.setString(4 ,createCandidateBean.getAge());
			query.setString(5, createCandidateBean.getAgenda());
			query.setString(5, createCandidateBean.getParty_Name());
			
			
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



