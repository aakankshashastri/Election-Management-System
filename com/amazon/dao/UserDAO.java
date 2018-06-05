package com.amazon.dbConnection;

import java.sql.*;
import java.util.Properties;
																																																																																	
import javax.swing.JOptionPane;

import com.amazon.beans.UserBean;

public class UserDAO{
	public void msgbox(String s) {
		JOptionPane.showMessageDialog(null, s);
	}
	public int createUser(UserBean user) {
		int result = 0;
		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement query = connection.prepareStatement(
					"insert into User(voter_id,uname,password,emailId,location,status) values(?,?,md5(?),?,?,?)");

			query.setString(1, user.getVoter_id());
			query.setString(2, user.getName());
			query.setString(3, user.getPassword());
			query.setString(4, user.getEmailID());
			query.setString(5, user.getLocation());
			query.setInt(6, 1);

			result = query.executeUpdate();
			System.out.println(result);
			connection.close();
		} catch (Exception e) {

		}
		return result;
	}

	/*public String forgetPasswordGetEmail(String customerId) {
		try {
			Connection connection = ConnectionFactory.getConnection();
			Statement statement = connection.createStatement();
			String query = "select emailId from Customer where phoneNumber ='" + customerId + "'";
			ResultSet resultSet = statement.executeQuery(query);

			if (resultSet.next()) {
				return (resultSet.getString(1));

			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			msgbox("This user already has an account with the same PhoneNumber/emailId");

		}
		return null;

	}

	public String getPassword(String customerId) {
		try {
			Connection connection = ConnectionFactory.getConnection();
			Statement statement = connection.createStatement();
			String query = "select password from Customer where phoneNumber ='" + customerId + "'";
			ResultSet resultSet = statement.executeQuery(query);

			if (resultSet.next()) {
				return (resultSet.getString(1));

			}
			resultSet.close();
			connection.close();
		} catch (Exception e) {
			msgbox("This user already has an account with the same PhoneNumber/emailId");

		}
		return null;

	}

	public void msgbox(String s) {
		JOptionPane.showMessageDialog(null, s);
	}*/
}
	