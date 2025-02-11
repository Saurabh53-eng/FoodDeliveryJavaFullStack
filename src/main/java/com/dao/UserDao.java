package com.dao;

import javax.persistence.Query; // Use this import for JPA Query
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Login;

@Repository
public class UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Login getUserByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Employee WHERE email = :email");
		query.setParameter("email", email);
		return (Login) query.getSingleResult(); // Use getSingleResult() for a single entity
	}
}
