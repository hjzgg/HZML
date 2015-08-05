package com.hzml.entriy;

import java.io.Serializable;

public class DevelopingParty  implements Serializable{
	private String developName;
	private String pwd ;
	private int evaluate;
	private String phone;
	private String address;
	public DevelopingParty(String developName, String pwd, int evaluate,
			String phone, String address, String email) {
		super();
		this.developName = developName;
		this.pwd = pwd;
		this.evaluate = evaluate;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDevelopName() {
		return developName;
	}

	public void setDevelopName(String developName) {
		this.developName = developName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(int evaluate) {
		this.evaluate = evaluate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private String email;
	
	public DevelopingParty(){
		
	}
	
}
