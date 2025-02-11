package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.AdminDao;
import com.model.Login;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao adminDao;

	@Transactional
	public boolean doAdminLogin(Login lm) {
		// TODO Auto-generated method stub
		return adminDao.doAdminLogin(lm);
	}

}
