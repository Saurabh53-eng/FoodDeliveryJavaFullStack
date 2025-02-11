package com.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MyExceptionHandler {
	@ExceptionHandler(value = NullPointerException.class)
	public String nullPointerExceptionHandler(Model model) {
		model.addAttribute("msg", "Null Pointer Exception");
		return "ErrorPage";
	}

	@ExceptionHandler(value = NumberFormatException.class)
	public String numberFormatExceptionHandler(Model model) {
		model.addAttribute("msg", "Number format exception");
		return "ErrorPage";
	}

	@ExceptionHandler(value = Exception.class)
	public String handleGenericException(Model m, Exception exp) {
		m.addAttribute("msg", exp.getMessage());
		return "ErrorPage";
	}
}