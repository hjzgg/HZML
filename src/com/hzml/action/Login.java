package com.hzml.action;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

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
	
	private void addJSESSIONIDtoCookie(){
		Cookie cookie = new Cookie("JSESSIONID", ServletActionContext.getRequest().getSession().getId());
		cookie.setMaxAge(1800);//30分钟
		//设置路径，这个路径即该工程下都可以访问该cookie 如果不设置路径，那么只有设置该cookie路径及其子路径可以访问
		cookie.setPath("/");
		ServletActionContext.getResponse().addCookie(cookie);
	}
	
	public String login(){
		if(people.equals("user")){
			if(peopleDao.isExistDevelopingParty(username, password)){
				ActionContext.getContext().getSession().put("peopleName", username);
				ActionContext.getContext().getSession().put("peopleType", "user");
				addJSESSIONIDtoCookie();
				return "loginSucess";
			}
		} else if(people.equals("company")){
			if(peopleDao.isExistPublishParty(username, password)){
				ActionContext.getContext().getSession().put("peopleName", username);
				ActionContext.getContext().getSession().put("peopleType", "company");
				addJSESSIONIDtoCookie();
				return "loginSucess";
			}
		} else if(people.equals("manager")){
			if(peopleDao.isExistManager(username, password)){
				ActionContext.getContext().getSession().put("peopleName", username);
				ActionContext.getContext().getSession().put("peopleType", "manager");
				addJSESSIONIDtoCookie();
				return "loginSucess";
			}
		}
		return "loginFail";
	}
	
	public String quitLogin(){
		ActionContext.getContext().getSession().remove("peopleType");
		ActionContext.getContext().getSession().remove("peopleName");
		return "quitLogin";
	}
}
