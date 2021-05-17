package com.iciamall.www.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.iciamall.www.entity.*;

public interface AuthorityDao {
	// ADAO-01
	@Insert("insert into authorities(authority, username) values(#{authority}, #{username})")
	public Integer insert(@Param("username") String username, @Param("authority") String authority);
	
	// ADAO-02. deleteByUsername
	
	
	// ADAO-03. findAllByUsername
	@Select("select * from authorities where username=#{username}")
	public List<Authority> findByUsername(String username);
}
