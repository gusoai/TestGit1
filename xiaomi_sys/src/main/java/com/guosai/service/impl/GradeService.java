package com.guosai.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guosai.dao.IGoodDao;
import com.guosai.dao.IGradeDao;
import com.guosai.entity.Goods;
import com.guosai.entity.Grade;
import com.guosai.service.IGradeService;
import com.guosai.vo.GradeGoods;
@Service
public class GradeService implements IGradeService {
	@Autowired
	private IGradeDao gradeDao;
	@Autowired
	private IGoodDao goodDao;
	
	@Override
	public List<Grade> findGradeByGrade(int grade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addGrade(Grade grade) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<GradeGoods> findGradeGoods(int grade, int gradeId) {
		List<Object[]> grades = gradeDao.findGradeInfos();
		List<Goods> goods = goodDao.findByGrade();
		List<GradeGoods> menus = new ArrayList<>();
		
		for (Object[] objs : grades) {
			//得到二级分类和一级分类对象
			Grade pg = (Grade)objs[1];
			Grade cg = (Grade) objs[0];
			
			int flag = 0;
			for (GradeGoods gg : menus) {
				if (gg.getGradeName().equals(pg.getGradename())) {
					flag = 1;
					break;
				}
			}
			//说明menus列表中 没有对应的分类
			if (flag == 0) {
				GradeGoods ggo = new GradeGoods();
				ggo.setId(pg.getId());
				ggo.setGradeName(pg.getGradename());
				List<Goods> menuGoods = new ArrayList<>();
				//找一级分类中对应的商品信息
				for(Goods gd : goods) {
					if(cg!=null && cg.getGradename().equals(gd.getGrade().getGradename())) {
						menuGoods.add(gd);
					}
				}
				
				ggo.setGoodsList(menuGoods);
				menus.add(ggo);
			}
		}
		
		
		
		return menus;
	}

}
