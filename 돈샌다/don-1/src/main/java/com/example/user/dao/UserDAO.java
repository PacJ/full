package com.example.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.user.dto.UserDTO;

@Mapper
@Repository
public interface UserDAO {

	public UserDTO selectByEmail(String email);
	
}
