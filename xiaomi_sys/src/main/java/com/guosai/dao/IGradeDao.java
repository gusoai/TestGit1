package com.guosai.dao;

import java.util.List;

import com.guosai.entity.Grade;
import com.guosai.vo.GradeGoods;

public interface IGradeDao {
	/**
	 * 根据级别查询数据
	 * @param grade  1级 2级
 	 * @return
	 */
	public List<Grade> findByGrade(int grade);
	
	public void add(Grade grade);
	//获取子分类和父分类
	public List<Object[]> findGradeInfos();
	
	
}
