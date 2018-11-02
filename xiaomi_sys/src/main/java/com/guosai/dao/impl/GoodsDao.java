package com.guosai.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guosai.dao.IGoodDao;
import com.guosai.entity.Goods;
@Repository
public class GoodsDao implements IGoodDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void add(Goods goods) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Goods findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Goods> findByGrade() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select go from Goods go inner join fetch go.grade gr");
		List<Goods> list = query.list();
		
		return list;
	}

}
