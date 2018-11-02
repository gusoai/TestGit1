package com.guosai.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guosai.dao.IUserDao;
import com.guosai.entity.User;
@Repository
public class UserDao implements IUserDao {
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User findByName(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where username=:name");
		query.setParameter("name", name);
		
		User user = (User) query.uniqueResult();
		return user;
	}

}
