package com.dao;

import java.util.List;

import com.model.EmailModel;
import com.model.Employee;
import com.model.Login;
import com.model.Otpmodel;

public interface EmpDao {
	public boolean addEmp(Employee e);

	public Employee getEmpById(int empid);

	public List<Employee> getAllEmps();

	public void updateEmployee(Employee e);

	public void deleteEmpById(int empid);

	public List<Employee> doEmpLogin(Login log);

	public void sendEmail(EmailModel email);

	public boolean sendPassword(String email);

}