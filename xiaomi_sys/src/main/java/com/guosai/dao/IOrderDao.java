package com.guosai.dao;

import java.util.List;

import com.guosai.entity.Order;

public interface IOrderDao {
	public long add(Order order);
	
	public List<Order> findAllByUid(int uid);
}
