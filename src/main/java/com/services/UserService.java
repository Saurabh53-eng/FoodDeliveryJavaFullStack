package com.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.model.Login;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	@Transactional
	public boolean isEmailExist(String email) {
		Login user = userDao.getUserByEmail(email);
		return user != null;
	}

	@Transactional
	public boolean validatePassword(String email, String password) {
		Login user = userDao.getUserByEmail(email);
		if (user != null && user.getPassword().equals(password)) {
			return true;
		}
		return false;
	}
}
