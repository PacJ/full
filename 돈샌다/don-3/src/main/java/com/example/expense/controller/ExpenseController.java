package com.example.expense.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.expense.dto.ExpenseDTO;
import com.example.expense.service.ExpenseService;

@RestController
public class ExpenseController {
	
	@Autowired
	private ExpenseService expenseService;
	
	public ExpenseController() {
	}
	
	@GetMapping("/expenses")
	public Map<String, Object> expenses() {
		Map<String, Object> map = new HashMap<>();
		List<ExpenseDTO> expenses = expenseService.getExpensesService("bbb@gmail.com");
		for(int i = 0; i < expenses.size(); i++) {
			System.out.println(expenses.get(i).getAmount());
			System.out.println(expenses.get(i).getCategory_id());
			System.out.println(expenses.get(i).getDescription());
			System.out.println(expenses.get(i).getEmail());
			System.out.println(expenses.get(i).getExpense_id());
			System.out.println(expenses.get(i).getExDate());
		}
		
		map.put("expenses", expenses);
		return map;
	}
	
	@GetMapping("/please")
	public String plz() {
		System.out.println("제발요..");
		return "제발나와라요";
	}

}
