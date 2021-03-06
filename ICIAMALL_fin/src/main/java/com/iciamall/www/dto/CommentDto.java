package com.iciamall.www.dto;

import java.util.*;

import com.iciamall.www.entity.*;

import lombok.*;

/*
 * class 계산기 {
 * 		// 자신만의 기능을 가지지만 외부 클래스(계산기)를 벗어나면 의미가 없다(종속)
 * 		class PlusButtonListener implements ActionListener {
 * 		}
 * 		class MinusButtonListener implements ActionListener {
 * 		}
 * }
 */

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class CommentDto {
	// Write
	@Data
	public static class Write {
		private Integer bno;
		private String content;
		private Integer readCnt;
	}
	
	// Read
	@Data
	public static class Read {
		private Integer cno;	
		private Integer bno;
		private String writer;
		private Boolean isWriter;			
		private String content;
		private String writeTimeString;

	}
	
	@Data
	@AllArgsConstructor
	public static class Rest {
		private List<Comment> comments;
		private Integer nextCommentPage;
	}
}

















