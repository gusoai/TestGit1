package com.guosai.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guosai.dao.IUserDao;
import com.guosai.dao.impl.UserDao;
import com.guosai.entity.User;
import com.guosai.service.IUserService;
import com.guosai.utils.MD5Utils;
import com.guosai.utils.StringUtil;
@Service
public class UserService implements IUserService {
	@Autowired
	private IUserDao userDao;
	@Override
	public User login(String name, String password, int role, String validateCode) {
		// TODO Auto-generated method stub
		if (StringUtil.isEmpty(name)) {
			throw new RuntimeException("用户名不能为空");
		}
		
		if (StringUtil.isEmpty(password)) {
			throw new RuntimeException("密码不能为空");
		}
	
		User user = null;
		try {
			user = userDao.findByName(name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		
		if (user == null) {
			throw new RuntimeException("输入用户名有错");
		}
		//管理员不用判断验证码
		if (role == 1) {
			if (!user.getPassword().equals(MD5Utils.getMD5(password))) {
				throw new RuntimeException("输入密码错误");
			}else {
				
			}
		}
		return user;
	}
	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		if (user == null) {
			throw new RuntimeException("用户数据为空");
		}
		
		if (StringUtil.isEmpty(user.getUsername())) {
			throw new RuntimeException("用户名不能为空");
		}
		
		if (StringUtil.isEmpty(user.getPassword())) {
			throw new RuntimeException("密码不能为空");
		}
		
//		if (!user.getPassword().equals(user.getRepassword())) {
//			throw new RuntimeException("两次输入密码不同");
//		}
		
		User user2 = userDao.findByName(user.getUsername());
		
		if (user2 != null) {
			throw new RuntimeException("用户名已经存在，不能注册");
		}
		 
		try {
			user.setCreateDate(new Date());
			user.setRole(2);
			
			userDao.addUser(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}

}
