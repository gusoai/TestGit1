package com.guosai.service;

import java.util.List;

import com.guosai.entity.Grade;
import com.guosai.vo.GradeGoods;

public interface IGradeService {
	public List<Grade> findGradeByGrade(int grade);
	
	public void addGrade(Grade grade);
	/**
	 * 
	 * @param grade 分类等级1,2
	 * @param gradeId 数据库中分类数据id
	 * @return
	 */
	public List<GradeGoods> findGradeGoods(int grade,int gradeId);
}
