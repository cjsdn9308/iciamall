package com.iciamall.www.util;

import java.util.*;

import org.springframework.stereotype.*;

import com.iciamall.www.dto.*;

@Component
public class PagingUtil {
	public Map<String, Object> getRownum(int pageno, int count) {
		// pageno(블럭)	startRowNum			endRowNum
		// 1			1					10
		// 2			11					20
		// 3			21					30
		int startRowNum = (pageno-1) * WwwConstant.BOARD_PER_PAGE + 1;		///  시작번호 = 블럭번호 * 페이지에 출력할 게시글수 +1    => 보통 1
		int endRowNum = startRowNum + WwwConstant.BOARD_PER_PAGE - 1;	    // 마지막번호  = 시작번호 + 페이지에 출력할 게시글수 -1	=> 보통10
																			// 즉 우선 1~10페이지 번호를 미리 출력한다
		
		if(endRowNum>count)													// if(10>전체게시글수)라면  => 
			endRowNum = count;												// 마지막 번호 = 게시글 수
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return map;
	}
	
	
	
	
	public Page getPage(int pageno, int count) {
		// 페이지 당 블록 : 5
		
		
		
		// 블록번호		이전		시작페이지			마지막페이지		다음
		//	0			 0			1					5			 6
		//	1			 5			6					10			11
		//	2			 10			11					15			16
		//				*5		  이전+1				   이전+5		마지막+1
		
		// 만약 페이지 개수가 13이라면 
		//  2			 10			11					13			 0
		
		// 만약 페이지 개수가 15이라면
		//  2			 10			11					15			 0
		
		
		
		// 글의 개수가 127->13, 128->13, 129->13, 130->13
		int countOfPage = count/WwwConstant.BOARD_PER_PAGE + 1;		// 기본적으로 전체페이지수는  ("전체 게시글수"를 "출력게시글수"로 나는 값 + 1)
		if(countOfPage%WwwConstant.BOARD_PER_PAGE==0)				// 만약 ("전체 게시글수"를 "출력게시글수"로 나는 값)의 나머지가 0일때
			countOfPage--;											// +1을 취소
		if(pageno>countOfPage)										// 만약 ("전체 게시글수"를 "출력게시글수"로 나는 값)의 나머지가 0
			pageno=countOfPage;
		
		// pageno를 가지고 블록번호를 계산할 수 있다 
		// pageno				blockNo
		// 1 2 3 4 5				0
		// 6 7 8 9 10				1
		// 11 12 13 14 15			2
		int blockNo = (pageno-1)/WwwConstant.PAGE_PER_BLOCK;
		
		int prev = blockNo*WwwConstant.PAGE_PER_BLOCK;				// 이전버튼 = 블럭번호 * 블럭당 페이지수
		int start = prev + 1;										// 시작번호 = 이전버튼 + 1
		int end = prev + WwwConstant.PAGE_PER_BLOCK;				// 마지막번호 = 이전버튼 + 블럭당 페이지수
		int next = end + 1;											// 다음버튼 = 마지막번호 + 1
		
		if(end>=countOfPage) {										// if(마지막 번호 >= 페이지당 게시물수)	=>		전체 게시물수가 10개 이하일 경우
			end = countOfPage;										// 마지막 번호 = 페이지당 게시물수
			next = 0;												// 다음버튼이 없다
		}
		
		return Page.builder().pageno(pageno).prev(prev).start(start).end(end).next(next).build();
	}
}












