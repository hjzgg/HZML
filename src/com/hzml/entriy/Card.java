package com.hzml.entriy;

import java.io.Serializable;
import java.sql.Timestamp;

public class Card implements Serializable{
	private Timestamp cardTime;
	private String cardContent;
	private int cardid;
	private int taskid;
	private String receiveCardName;
	private String postCardName;
	
	public Card(){
		
	}
	public Card(Timestamp cardTime, String cardContent, int cardid, int taskid,
			String receiveCardName, String postCardName) {
		super();
		this.cardTime = cardTime;
		this.cardContent = cardContent;
		this.cardid = cardid;
		this.taskid = taskid;
		this.receiveCardName = receiveCardName;
		this.postCardName = postCardName;
	}
	public Timestamp getCardTime() {
		return cardTime;
	}
	public void setCardTime(Timestamp cardTime) {
		this.cardTime = cardTime;
	}
	public String getCardContent() {
		return cardContent;
	}
	public void setCardContent(String cardContent) {
		this.cardContent = cardContent;
	}
	public int getCardid() {
		return cardid;
	}
	public void setCardid(int cardid) {
		this.cardid = cardid;
	}
	public int getTaskid() {
		return taskid;
	}
	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}
	public String getReceiveCardName() {
		return receiveCardName;
	}
	public void setReceiveCardName(String receiveCardName) {
		this.receiveCardName = receiveCardName;
	}
	public String getPostCardName() {
		return postCardName;
	}
	public void setPostCardName(String postCardName) {
		this.postCardName = postCardName;
	}
	
}
