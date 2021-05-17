package com.iciamall.www.dto;

import java.util.*;

import lombok.*;

@Data
@Builder
public class Page {
	private Integer pageno;
	private Integer prev;
	private Integer start;
	private Integer end;
	private Integer next;
	
	// Board를 10개 읽어와서 10개의 DTO로 변환해서 출력(속도 저하) -> @Cacheable(결과를 저장해 바로 출력)
	private List<BoardDto.ListView> list;
}
