package com.guosai.dao;

import java.util.List;

import com.guosai.entity.Goods;

public interface IGoodDao {
	public void add(Goods goods);
	
	public Goods findById(int id);
	//获取商品信息及关联的分类信息
	public List<Goods> findByGrade();
}
