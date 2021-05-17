package com.iciamall.www.dto;

import lombok.*;

@NoArgsConstructor
public class UserDto {
	@Data
	public static class Join {
		private String username;
		private String password;
		private String irum;
		private String email;
		private String phone;
		
		
	}
}
