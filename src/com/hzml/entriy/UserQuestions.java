package com.hzml.entriy;

import java.io.Serializable;

public class UserQuestions implements Serializable{
	private String developName;
	private int uqId;
	private int score;
	private int pageQuestionId;
	public UserQuestions(String developName, int uqId, int score,
			int pageQuestionId) {
		super();
		this.developName = developName;
		this.uqId = uqId;
		this.score = score;
		this.pageQuestionId = pageQuestionId;
	}
	public UserQuestions() {
		super();
	}
	public String getDevelopName() {
		return developName;
	}
	public void setDevelopName(String developName) {
		this.developName = developName;
	}
	public int getUqId() {
		return uqId;
	}
	public void setUqId(int uqId) {
		this.uqId = uqId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getPageQuestionId() {
		return pageQuestionId;
	}
	public void setPageQuestionId(int pageQuestionId) {
		this.pageQuestionId = pageQuestionId;
	}
	
}
