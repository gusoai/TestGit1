package com.guosai.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.guosai.dao.IGradeDao;
import com.guosai.entity.Grade;
@Repository
public class GradeDao implements IGradeDao {

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Grade> findByGrade(int grade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void add(Grade grade) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Object[]> findGradeInfos() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select cg,pg from Grade cg right join cg.parent pg where pg.grade=1");
		
		List<Object[]> list = query.list();
		
		
		return list;
	}

}
