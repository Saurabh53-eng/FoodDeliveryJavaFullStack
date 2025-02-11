package com.services;

import java.util.List;

import com.model.EmailModel;
import com.model.Employee;
import com.model.Login;
import com.model.Otpmodel;

public interface EmpServices {

	public boolean addEmp(Employee e);

	public Employee getEmpById(int empid);

	public List<Employee> getAllEmps();

	public void updateEmployee(Employee e);

	public void deleteEmpById(int empid);

	public List<Employee> doEmpLogin(Login log);

	public void sendEmail(EmailModel email);

	public int sendEmailOtp(EmailModel mail);



	public boolean sendPassword(String email);

	/* public void verifyOtp(EmailModel email); */
}