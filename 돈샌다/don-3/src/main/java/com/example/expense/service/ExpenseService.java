package com.example.expense.service;

import java.util.List;

import com.example.expense.dto.ExpenseDTO;

public interface ExpenseService {
	public List<ExpenseDTO> getExpensesService(String email);
}
