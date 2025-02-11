package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Login;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	SessionFactory sessionfactory;

	@Override
	public boolean doAdminLogin(Login al) {
		boolean status = false;
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_maven", "root", "");
			String sql = "select * from admin where email='" + al.getEmail() + "' and password='" + al.getPassword()
					+ "'";
			PreparedStatement pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				status = true;
				return status;
			} else {
				status = false;
				return status;
			}

		} catch (Exception e) {
			System.out.println(e);
			status = false;
			return status;
		}

	}
}
