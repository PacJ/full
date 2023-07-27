package com.example.expense.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ExpenseDTO {
	private int expense_id;
	private int category_id;
	private String email;
	private double amount;
	private Date exDate;
	private String description;
}
