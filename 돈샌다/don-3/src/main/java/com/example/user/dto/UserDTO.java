package com.example.user.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
public class UserDTO {
	private String email;
	private String password;
	private String name;
	private String nickname;
}
