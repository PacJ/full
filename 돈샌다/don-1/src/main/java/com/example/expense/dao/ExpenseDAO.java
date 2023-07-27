package com.example.expense.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.expense.dto.ExpenseDTO;

@Mapper
@Repository
public interface ExpenseDAO {
	public List<ExpenseDTO> getExpenses(String email);
}
