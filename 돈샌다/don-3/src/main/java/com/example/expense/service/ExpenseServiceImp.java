package com.example.expense.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.expense.dao.ExpenseDAO;
import com.example.expense.dto.ExpenseDTO;

@Service
public class ExpenseServiceImp implements ExpenseService {
	
	@Autowired
	private ExpenseDAO expenseDAO;

	@Override
	public List<ExpenseDTO> getExpensesService(String email) {
		return expenseDAO.getExpenses(email);
	}

}
