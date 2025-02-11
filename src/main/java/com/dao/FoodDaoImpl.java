package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Employee;
import com.model.FoodModel;

@Repository
public class FoodDaoImpl implements FoodDao {
	@Autowired
	SessionFactory sessionfactory;

	@Override
	public String addFood(FoodModel fm) {
		// TODO Auto-generated method stub
		String msg = " ";
		msg = "fsuccess";
		sessionfactory.getCurrentSession().save(fm);
		return msg;
	}

	@Override
	public List<FoodModel> getAllFoods() {
		// TODO Auto-generated method stub
		String hql = "FROM FoodModel where quantity>0";
		@SuppressWarnings("unchecked")
		List<FoodModel> fm = (List<FoodModel>) sessionfactory.getCurrentSession().createQuery(hql).list();
		List<FoodModel> list = fm.size() > 0 ? fm : null;

		return list;
	}

	@Override
	public List<FoodModel> getFoodById(int fid) {
		String hql = "From FoodModel E where E.id='" + fid + "'";
		@SuppressWarnings("unchecked")
		List<FoodModel> fm = (List<FoodModel>) sessionfactory.getCurrentSession().createQuery(hql).list();
		List<FoodModel> list = fm.size() > 0 ? fm : null;

		return list;

	}

	@Override
	public void update(FoodModel fm) {
		// TODO Auto-generated method stub
		sessionfactory.getCurrentSession().update(fm);
	}

	@Override
	public FoodModel GetFoodById(int fid) {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().get(FoodModel.class, fid);
	}

	@Override
	public void deleteFoodById(int fid) {
		// TODO Auto-generated method stub
		FoodModel f = sessionfactory.getCurrentSession().get(FoodModel.class, fid);
		sessionfactory.getCurrentSession().delete(f);
	}
}
