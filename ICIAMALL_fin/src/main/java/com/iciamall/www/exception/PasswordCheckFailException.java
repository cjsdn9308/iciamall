package com.iciamall.www.exception;

import lombok.*;

@AllArgsConstructor
public class PasswordCheckFailException extends RuntimeException {
	private String message;
	
	@Override
	public String getMessage() {
		return message;
	}
}
