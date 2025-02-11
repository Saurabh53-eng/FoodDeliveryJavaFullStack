package com.model;

import javax.persistence.Column;

public class Login {
	@Column(name = "email", unique = true, nullable = false)
	private String email;
	@Column(name = "password", nullable = false)
	private String password;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}