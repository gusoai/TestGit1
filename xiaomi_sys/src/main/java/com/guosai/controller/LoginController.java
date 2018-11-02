package com.guosai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guosai.service.IUserService;
import com.guosai.utils.JsonUtils;
import com.guosai.vo.JsonBean;

@Controller
public class LoginController {
	@Autowired
	private IUserService userService;
	
	@RequestMapping("/adminuser")
	@ResponseBody
	public JsonBean login(String username,String password) {
		try {
			userService.login(username, password, 1, null);
			return JsonUtils.createJsonBean(1, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return JsonUtils.createJsonBean(0, e.getMessage());
		}
	
	}
	
}
