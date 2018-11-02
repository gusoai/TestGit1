package com.guosai.service;

import com.guosai.entity.User;

public interface IUserService {
	/**
	 * 登录判断
	 * @param name 用户名 
	 * @param password 密码
	 * @param role 角色标记
	 * @param validateCode 验证码
	 */
	public User login(String name,String password,int role,String validateCode);

	//注册用户
	public void register(User user);
}
