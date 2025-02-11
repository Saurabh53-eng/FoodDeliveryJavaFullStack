package com.model;

public class EmailModel {
	private String subject;
	private int otp;
	private int sentotp;
	private String to;
	private String msg;

	public int getSentotp() {
		return sentotp;
	}

	public void setSentotp(int sentotp) {
		this.sentotp = sentotp;
	}

	public int getOtp() {
		return otp;
	}

	public void setOtp(int otp) {
		this.otp = otp;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}
}