package com.services;

import java.util.List;
import java.util.Random;

import javax.management.Query;
import javax.persistence.EntityManager;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.EmpDao;
import com.model.EmailModel;
import com.model.Employee;
import com.model.Login;
import com.model.Otpmodel;

@Service
public class EmpServicesImpl implements EmpServices {
	@Autowired
	SessionFactory sessionfactory;
	@Autowired
	private EmpDao empdao;
	@Autowired
	private JavaMailSender emailSender;

	@Transactional
	public boolean addEmp(Employee e) {
		return empdao.addEmp(e);
	}

	@Transactional
	public Employee getEmpById(int empid) {
		// TODO Auto-generated method stub
		return empdao.getEmpById(empid);
	}

	@Transactional
	public List<Employee> getAllEmps() {
		// TODO Auto-generated method stub
		return empdao.getAllEmps();
	}

	@Transactional
	public void updateEmployee(Employee e) {
		// TODO Auto-generated method stub
		empdao.updateEmployee(e);
	}

	@Transactional
	public void deleteEmpById(int empid) {
		// TODO Auto-generated method stub
		empdao.deleteEmpById(empid);
	}

	@Transactional
	public List<Employee> doEmpLogin(Login log) {
		// TODO Auto-generated method stub
		return empdao.doEmpLogin(log);
	}

	@Transactional
	public void sendEmail(EmailModel email) {
		// TODO Auto-generated method stub
		empdao.sendEmail(email);
	}

	@Transactional
	public int sendEmailOtp(EmailModel mail) {
		// TODO Auto-generated method stub

		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("bandsaurabh61@gmail.com");
		msg.setTo(mail.getTo());
		int otp = new Random().nextInt(899999) + 100000;
		msg.setText("Use this OTP to get password  " + otp);

		emailSender.send(msg);
		return otp;
	}

	@Transactional
	public boolean sendPassword(String email) {
		// TODO Auto-generated method stub
		return empdao.sendPassword(email);
	}



	/*
	 * @Transactional public void verifyOtp(String email) { // TODO Auto-generated
	 * method stub empdao.verifyOTP(email); }
	 */
}