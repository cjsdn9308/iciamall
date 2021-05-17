package com.iciamall.www.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.iciamall.www.entity.*;

public interface CommentDao {
	public Integer insert(Comment comment);
	
	public Integer delete(int cno);
	
	public List<Comment> findAll(@Param("rownum") Map<String, Integer> rownum, @Param("bno") Integer bno);

	public Optional<Comment> findById(Integer cno);

	public Integer deleteByBno(Integer bno);
	
	public Integer findcontent(Integer bno);

	public List<Comment> findFirstPage(@Param("endRowNum") Integer endRowNum, @Param("bno") Integer bno);

}
