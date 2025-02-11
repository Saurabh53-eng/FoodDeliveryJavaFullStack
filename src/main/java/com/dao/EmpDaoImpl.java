package com.dao;

import java.util.List;
import java.util.Random;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.EmailModel;
import com.model.Employee;
import com.model.FoodModel;
import com.model.Login;
import com.model.Otpmodel;

import net.bytebuddy.agent.builder.AgentBuilder.InitializationStrategy.SelfInjection.Eager;

@Repository
public class EmpDaoImpl implements EmpDao {
	@Autowired
	SessionFactory sessionfactory;
	@Autowired
	private JavaMailSender emailSender;
	JdbcTemplate jdbcTemplate;

	public boolean addEmp(Employee e) {
		sessionfactory.getCurrentSession().save(e);
		return true;
	}

	@Override
	public Employee getEmpById(int empid) {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().get(Employee.class, empid);
	}

	@Override
	public List<Employee> getAllEmps() {
		// TODO Auto-generated method stub
		try (Session session = sessionfactory.openSession()) {
			// Create CriteriaBuilder
			CriteriaBuilder builder = session.getCriteriaBuilder();

			// Create CriteriaQuery
			CriteriaQuery<Employee> criteria = builder.createQuery(Employee.class);

			// Specify criteria root
			criteria.from(Employee.class);

			// Execute query
			List<Employee> entityList = session.createQuery(criteria).getResultList();
			return entityList;
		}
	}

	@Override
	public void updateEmployee(Employee e) {
		// TODO Auto-generated method stub
		sessionfactory.getCurrentSession().update(e);
	}

	@Override
	public void deleteEmpById(int empid) {
		// TODO Auto-generated method stub
		Employee e = sessionfactory.getCurrentSession().get(Employee.class, empid);
		sessionfactory.getCurrentSession().delete(e);
	}

	@Override
	public List<Employee> doEmpLogin(Login log) {
		// TODO Auto-generated method stub
		String hql = "From Employee E where E.email='" + log.getEmail() + "' and E.password='" + log.getPassword()
				+ "'";
		@SuppressWarnings("unchecked")
		List<Employee> emps = (List<Employee>) sessionfactory.getCurrentSession().createQuery(hql).list();
		List<Employee> list = emps.size() > 0 ? emps : null;

		return list;
	}

	@Override
	public void sendEmail(EmailModel mail) {
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("bandsaurabh61@gmail.com");
		msg.setTo(mail.getTo());
		msg.setSubject(mail.getSubject());
		msg.setText(mail.getMsg());
		emailSender.send(msg);
	}

	@Override
	public boolean sendPassword(String email) {
		// TODO Auto-generated method stub
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("bandsaurabh61@gmail.com");
		msg.setTo(email);
		msg.setSubject("Welcome " + email);

		Session session = sessionfactory.openSession();
		Transaction transaction = session.beginTransaction();

		// Use HQL to retrieve the password
		String hql = "SELECT e.password FROM Employee e WHERE e.email = :email";
		org.hibernate.query.Query<String> query = session.createQuery(hql, String.class);
		query.setParameter("email", email);

		// Execute the query and get the result
		String password = query.uniqueResult();

		// Commit transaction
		transaction.commit();
		session.close();
		// Check if password is found
		if (password != null) {
			msg.setText("Please use this password to login: " + password);
			emailSender.send(msg);
			return true;
		} else {
			System.out.println("Email not found in the database.");
			return false;
		}

	}
	/*
	 * @Override public int sendEmailOTP(EmailModel mail) { // TODO Auto-generated
	 * method stub SimpleMailMessage msg = new SimpleMailMessage();
	 * msg.setFrom("bandsaurabh61@gmail.com"); msg.setTo(mail.getTo()); int otp =
	 * new Random().nextInt(899999) + 100000;
	 * msg.setText("Use this OTP to get password  " + otp);
	 * 
	 * emailSender.send(msg); return otp; }
	 */

}
