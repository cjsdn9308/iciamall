package com.iciamall.www.exception;

import lombok.*;

// 모든 예외의 부모는 Exception -> try~catch 필요. 
// 단 가벼운 예외로 예외처리가 필요없는 예외가 RuntimeException
//		프로그래머가 코딩하면서 모든 예외 상황을 잡아내기는 어렵다 -> 자바의 생각 : "작업 중 모든 예외를 내가 정의해줄께"
// 프로그래머들이 빨간색 줄을 너무 자주 보다보니 만성이 되요  -> try~catch 자동완성하고 지나가버린다	
//
// 스프링은 RuntimeException기반으로 움직인다
@AllArgsConstructor
public class JobRestFailException extends RuntimeException {
	private String message;

	@Override
	public String getMessage() {
		return message;
	}
}
