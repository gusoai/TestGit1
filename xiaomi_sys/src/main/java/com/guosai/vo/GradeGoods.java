package com.guosai.vo;

import java.util.List;

import com.guosai.entity.Goods;

public class GradeGoods {
	private Integer id;
	private String gradeName;
	private List<Goods> goodsList;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	
	
	
}
