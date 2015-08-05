package com.hzml.action;

import com.hzml.dao.PeopleDao;
import com.hzml.entriy.DevelopingParty;
import com.hzml.entriy.PublishParty;
import com.opensymphony.xwork2.ActionSupport;

public class Register extends ActionSupport{
	private PeopleDao peopleDao;
	private String username;
	private String password;
	private String people;
	private String phone;
	private String address;
	private String email;
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public PeopleDao getPeopleDao() {
		return peopleDao;
	}
	public void setPeopleDao(PeopleDao peopleDao) {
		this.peopleDao = peopleDao;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	
	public String register(){
		if(people.equals("user")){
			if(!peopleDao.isRegisterDevelopingParty(username)){
				DevelopingParty developingParty = new DevelopingParty(username, password, 0, phone, address, email);
				peopleDao.saveDevelopingParty(developingParty);
				return "registerSuccess";
			}
		} else if(people.equals("company")){
			if(!peopleDao.isRegisterPublishParty(username)){
				PublishParty publishParty = new PublishParty(username, password, phone, email, address);
				peopleDao.savePublishParty(publishParty);
				return "registerSuccess";
			}
		}
		return "registerFail";
	}
}
