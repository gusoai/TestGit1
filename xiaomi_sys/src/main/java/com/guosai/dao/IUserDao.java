package com.guosai.dao;

import com.guosai.entity.User;

public interface IUserDao {
	public void addUser(User user);
	
	public User findByName(String name);
}
