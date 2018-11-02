package com.guosai.service;

import com.guosai.entity.Goods;

public interface IGoodsService {
	public void addGoods(Goods goods);
	
	public Goods findGoodsById(int id);
}
