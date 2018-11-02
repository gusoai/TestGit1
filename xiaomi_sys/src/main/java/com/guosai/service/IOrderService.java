package com.guosai.service;

import java.util.List;

import com.guosai.entity.Order;
import com.guosai.vo.GoodsInfo;

public interface IOrderService {
	public void addOrder(int uid,List<GoodsInfo> infos);
	
	public List<Order> findOrderByUid(int uid);
}
