package com.hzml.entriy;

import java.io.Serializable;

public class Questions implements Serializable{
	private int qId;
	private int questionId;
	private int optionSelect;
	private int pageQuestionId;
	public Questions(int qId, int questionId, int optionSelect,
			int pageQuestionId) {
		super();
		this.qId = qId;
		this.questionId = questionId;
		this.optionSelect = optionSelect;
		this.pageQuestionId = pageQuestionId;
	}
	public Questions() {
		super();
	}
	public int getqId() {
		return qId;
	}
	public void setqId(int qId) {
		this.qId = qId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getOptionSelect() {
		return optionSelect;
	}
	public void setOptionSelect(int optionSelect) {
		this.optionSelect = optionSelect;
	}
	public int getPageQuestionId() {
		return pageQuestionId;
	}
	public void setPageQuestionId(int pageQuestionId) {
		this.pageQuestionId = pageQuestionId;
	}
	
}
