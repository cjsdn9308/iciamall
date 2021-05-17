package com.iciamall.www.dao;

import java.util.*;

import com.iciamall.www.entity.*;

public interface NoticeDao {

	public int count();

	public List<Notice> findAll(Map<String, Object> map);

	public int insert(Notice notice);

	public Notice findByBno(int bno);

	public Map findById(int bno);

	public int update(Notice notice);

	public Integer delete(int bno);
}
