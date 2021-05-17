package com.iciamall.www.dto;

import java.util.*;

import javax.validation.constraints.*;

import lombok.*;

@NoArgsConstructor
public class NoticeDto {
	@Data
	public static class Write {
		// @NotNull,	@NotEmpty(공백 문자 통과),   @NotBlank
		private String title;
		private String content;
	}
	
	@Data
	public static class Read {
		private Integer bno;
		private String title;
		private String content;
		private String writer;
		private String commentCnt;
		private String writeTimeString;
		private int readCnt;
		private Boolean isWriter;		// setWriter, setIsWriter
		private List<CommentDto.Read> comments;
		private Integer nextCommentPage;
	}
	
	@Data
	public static class ListView {
		private int bno;
		private String title;
		private String writer;
		private String writeTimeString;
		private int readCnt;
		private int commentCnt;
	}
	
	@Data
	public static class Update {
		@NotNull
		private Integer bno;
		@NotNull
		private String title;
		private String content;
	}
}
