package com.hzml.entriy;

import java.io.Serializable;

public class UserQuestionsAndQuestions implements Serializable, Comparable<UserQuestionsAndQuestions>{
	private int score;
	private int pageQuestionId;
	private int optionSelect;
	private String questionMsg;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private int optionCorrect;
	private int difficultDegree;
	 
	public UserQuestionsAndQuestions(int score, int pageQuestionId,
			int optionSelect, String questionMsg, String optionA,
			String optionB, String optionC, String optionD, int optionCorrect,
			int difficultDegree) {
		super();
		this.score = score;
		this.pageQuestionId = pageQuestionId;
		this.optionSelect = optionSelect;
		this.questionMsg = questionMsg;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
		this.optionCorrect = optionCorrect;
		this.difficultDegree = difficultDegree;
	}

	public UserQuestionsAndQuestions() {
		super();
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
	public int getOptionSelect() {
		return optionSelect;
	}
	public void setOptionSelect(int optionSelect) {
		this.optionSelect = optionSelect;
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

	@Override
	public int compareTo(UserQuestionsAndQuestions o) {
		return this.pageQuestionId - o.pageQuestionId;
	}
	
}
