package com.iciamall.www.entity;

import java.time.*;
import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors
@Builder
public class Board {
	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private LocalDateTime writeTime;
	private Integer readCnt;
	private Integer commentCnt;

}
