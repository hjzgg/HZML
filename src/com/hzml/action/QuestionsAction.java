package com.hzml.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hzml.dao.QuestionsDao;
import com.hzml.entriy.QuestionList;
import com.hzml.entriy.Questions;
import com.hzml.entriy.UserQuestions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class QuestionsAction extends ActionSupport{
	private QuestionsDao questionsDao;
	
	private String developName;
	
	
	public String getDevelopName() {
		return developName;
	}

	public void setDevelopName(String developName) {
		this.developName = developName;
	}

	//添加题库
	private String questionMsg;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String optionCorrect;//实际上是整数
	private String difficultDegree;//实际上是整数
	
	public QuestionsDao getQuestionsDao() {
		return questionsDao;
	}

	public void setQuestionsDao(QuestionsDao questionsDao) {
		this.questionsDao = questionsDao;
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

	public String getOptionCorrect() {
		return optionCorrect;
	}

	public void setOptionCorrect(String optionCorrect) {
		this.optionCorrect = optionCorrect;
	}

	public String getDifficultDegree() {
		return difficultDegree;
	}

	public void setDifficultDegree(String difficultDegree) {
		this.difficultDegree = difficultDegree;
	}

	/*
		管理员向题库中添加题目
	 */
	public String addQuestion(){
		QuestionList question = new QuestionList(0, questionMsg, optionA, optionB, optionC, optionD, Integer.parseInt(optionCorrect), Integer.parseInt(difficultDegree));
		questionsDao.addQuesstion(question);
		ActionContext.getContext().getSession().put("addQuestionSuccess", "true");
		return "addQuestion";
	}
	
	public String randomQuestion(){
		List<QuestionList> list = questionsDao.getAllQuessions();
		List<QuestionList> questionList = new ArrayList<QuestionList>();
		if(list != null){
			Set<Integer> questionIdSet = new TreeSet<Integer>();
			int sz = list.size();
			int i = 0;
			Random random = new Random();
			while(i<10){//随机选择10道题
				int k = Math.abs(random.nextInt()) % sz;
				int id = list.get(k).getQuestionId();
				if(!questionIdSet.contains(id)){
					++i;
					questionIdSet.add(id);
					questionList.add(list.get(k));
				}
			}
			ActionContext.getContext().getSession().put("questionList", questionList);
		}
		return "randomQuestion";
	}
	
	public String produceToQuestionList(){//生成题单
		List<QuestionList> questionList = (List<QuestionList>)ActionContext.getContext().getSession().get("questionList");
		if(questionList != null){
			List<Questions> list = questionsDao.getAllQuestionsInPage();
			HttpServletRequest request = ServletActionContext.getRequest();
			int pageId = list.size()/10+1;
			int score = 0;
			for(int i=0; i<questionList.size(); ++i){//将题目添加到页面中
				String optionSelect = request.getParameter("optionSelect" + i);
				Questions question = new Questions(0, questionList.get(i).getQuestionId(), Integer.parseInt(optionSelect), pageId);
				if(questionList.get(i).getOptionCorrect() == Integer.parseInt(optionSelect)) ++score;
				questionsDao.addNewQuestionToPage(question);
			}
			UserQuestions uquestion = new UserQuestions(developName, 0, score, pageId);
			questionsDao.addNewPage(uquestion);
			ActionContext.getContext().getSession().remove("questionList");
			ActionContext.getContext().getSession().put("score_acquire", score);
			return "produceToQuestionList";
		} else {
			return "errors";
		}
	}
}
