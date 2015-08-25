package com.hzml.entriy;

import java.io.Serializable;
import java.sql.Timestamp;

public class Contact implements Serializable{
	private int msgId;
	private String userName;
	private String email;
	private String message;
	private int state;
	private Timestamp msgTime;
	public Timestamp getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(Timestamp msgTime) {
		this.msgTime = msgTime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Contact(int msgId, String userName, String email, String message,
			int state, Timestamp msgTime) {
		super();
		this.msgId = msgId;
		this.userName = userName;
		this.email = email;
		this.message = message;
		this.state = state;
		this.msgTime = msgTime;
	}
	public Contact() {
		super();
	}
	
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
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
	
}
