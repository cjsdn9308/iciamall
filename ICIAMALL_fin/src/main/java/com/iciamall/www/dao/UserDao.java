package com.iciamall.www.dao;

import com.iciamall.www.entity.*;

public interface UserDao {

	public User findById(String username);

	public User findByEmail(String email);

	public int insert(User user);

}
