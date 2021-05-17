package com.iciamall.www.entity;




import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class User {
	private String username;
	private String password;
	private String irum;
	private String email;
	private String phone;
	private int enabled;


}
