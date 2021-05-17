package com.iciamall.www.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;


import com.iciamall.www.entity.*;

public interface BoardDao {

	public int count();
	
	public List<Board> findAll(Map<String, Object> map);

	public int insert(Board board);
	
	public Board findByBno(int bno);

	public Map findById(int bno);

	public int update(Board board);
	
	public Integer delete(int bno);
	
}
