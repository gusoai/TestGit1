package com.guosai.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guosai.service.IGradeService;
import com.guosai.utils.JsonUtils;
import com.guosai.vo.GradeGoods;
import com.guosai.vo.JsonBean;

@Controller
public class MenuController {
	@Autowired
	private IGradeService gradeService;
	
	@RequestMapping("/queryGradeGoods")
	@ResponseBody
	public JsonBean getSlideMenu(int grade){
		
		List<GradeGoods> ggs = gradeService.findGradeGoods(grade, 0);
		return JsonUtils.createJsonBean(1, ggs);
	}
}

