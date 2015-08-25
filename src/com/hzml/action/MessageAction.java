package com.hzml.action;

import java.sql.Timestamp;
import java.util.List;

import com.hzml.dao.MessageDao;
import com.hzml.entriy.Contact;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MessageAction extends ActionSupport{
	private MessageDao messageDao;
	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	//用户联系我们//////////////
	private String userName;
	private String email;
	private String message;
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	////////////////////////
	
	public String receiveMessage(){
		Contact msg = new Contact(0, userName, email, message, 0, new Timestamp(System.currentTimeMillis()));
		messageDao.saveContactMsg(msg);
		return "receiveMessage";
	}
	
	public String getAllContactMsg(){
		List<Contact> list = messageDao.getAllContactMsg();
		ActionContext.getContext().getSession().put("getAllContactMsg", list);
		return "getAllContactMsg";
	}
}
