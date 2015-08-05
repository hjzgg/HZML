package com.hzml.action;

import com.hzml.dao.PeopleDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport{
	private PeopleDao peopleDao;
	
	public PeopleDao getPeopleDao() {
		return peopleDao;
	}

	public void setPeopleDao(PeopleDao peopleDao) {
		this.peopleDao = peopleDao;
	}

	private String username;
	private String password;
	private String people;
	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
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
	
	public String login(){
		if(people.equals("user")){
			if(peopleDao.isExistDevelopingParty(username, password)){
				ActionContext.getContext().getSession().put("peopleName", username);
				ActionContext.getContext().getSession().put("peopleType", "user");
				return "loginSucess";
			}
		} else if(people.equals("company")){
			if(peopleDao.isExistPublishParty(username, password)){
				ActionContext.getContext().getSession().put("peopleName", username);
				ActionContext.getContext().getSession().put("peopleType", "company");
				return "loginSucess";
			}
		} else if(people.equals("manager")){
			if(peopleDao.isExistManager(username, password)){
				ActionContext.getContext().getSession().put("peopleName", username);
				ActionContext.getContext().getSession().put("peopleType", "manager");
				return "loginSucess";
			}
		}
		return "loginFail";
	}
}
