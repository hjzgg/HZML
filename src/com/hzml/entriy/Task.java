package com.hzml.entriy;

import java.io.Serializable;
import java.sql.Timestamp;

public class Task  implements Serializable{
	private int taskid;
	private String taskName;
	private String accountID;
	private String keyValue;
	
	public String getAccountID() {
		return accountID;
	}

	public void setAccountID(String accountID) {
		this.accountID = accountID;
	}

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	private String publishName;
	private String taskDescription;
	private Timestamp beginTime;
	public Task(int taskid, String publishName, String taskDescription,
			Timestamp beginTime, Timestamp publishTime,
			int developmentTime, Timestamp updateTime, int money,
			int state, String taskAddress, String documentationAddress, String taskName) {
		super();
		this.taskid = taskid;
		this.publishName = publishName;
		this.taskDescription = taskDescription;
		this.beginTime = beginTime;
		this.publishTime = publishTime;
		this.developmentTime = developmentTime;
		this.updateTime = updateTime;
		this.money = money;
		this.state = state;
		this.taskAddress = taskAddress;
		this.documentationAddress = documentationAddress;
		this.taskName = taskName;
	}

	private Timestamp publishTime;
	private int developmentTime;
	private Timestamp updateTime;
	private int money;
	private int state;
	private String taskAddress;//工程项目地址
	private String documentationAddress;//说明文档地址
	
	public int getTaskid() {
		return taskid;
	}

	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}

	public String getPublishName() {
		return publishName;
	}

	public void setPublishName(String publishName) {
		this.publishName = publishName;
	}

	public String getTaskDescription() {
		return taskDescription;
	}

	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}

	public Timestamp getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}

	public Timestamp getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}

	public int getDevelopmentTime() {
		return developmentTime;
	}

	public void setDevelopmentTime(int developmentTime) {
		this.developmentTime = developmentTime;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getTaskAddress() {
		return taskAddress;
	}

	public void setTaskAddress(String taskAddress) {
		this.taskAddress = taskAddress;
	}

	public String getDocumentationAddress() {
		return documentationAddress;
	}

	public void setDocumentationAddress(String documentationAddress) {
		this.documentationAddress = documentationAddress;
	}

	public Task(){
		
	}
	
}
