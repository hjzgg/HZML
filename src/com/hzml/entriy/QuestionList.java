package com.hzml.entriy;

import java.io.Serializable;

public class QuestionList implements Serializable{
	private int questionId;
	private String questionMsg;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private int optionCorrect;
	private int difficultDegree;
	public QuestionList(int questionId, String questionMsg, String optionA,
			String optionB, String optionC, String optionD, int optionCorrect,
			int difficultDegree) {
		super();
		this.questionId = questionId;
		this.questionMsg = questionMsg;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
		this.optionCorrect = optionCorrect;
		this.difficultDegree = difficultDegree;
	}
	public QuestionList() {
		super();
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getQuestionMsg() {
		return questionMsg;
	}
	public void setQuestionMsg(String questionMsg) {
		this.questionMsg = questionMsg;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public int getOptionCorrect() {
		return optionCorrect;
	}
	public void setOptionCorrect(int optionCorrect) {
		this.optionCorrect = optionCorrect;
	}
	public int getDifficultDegree() {
		return difficultDegree;
	}
	public void setDifficultDegree(int difficultDegree) {
		this.difficultDegree = difficultDegree;
	}
	
}
