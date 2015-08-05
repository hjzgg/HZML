package com.hzml.entriy;

import java.io.Serializable;

public class PublishParty  implements Serializable{
	private String publishName;
	private String pwd;
	private String phone;
	private String email;
	private String address;
	
	public String getPublishName() {
		return publishName;
	}

	public void setPublishName(String publishName) {
		this.publishName = publishName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public PublishParty(){
		
	}
	
	public PublishParty(String publishName, String pwd, String phone,
			String email, String address) {
		super();
		this.publishName = publishName;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	
}
