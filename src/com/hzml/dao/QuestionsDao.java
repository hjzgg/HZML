package com.hzml.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hzml.entriy.QuestionList;
import com.hzml.entriy.Questions;
import com.hzml.entriy.UserQuestions;
import com.hzml.entriy.UserQuestionsAndQuestions;

public class QuestionsDao implements Serializable{
	private SessionFactory sessionFactory;  
    
    public Session getSession() {  
        return sessionFactory.getCurrentSession();  
    }  
  
    public SessionFactory getSessionFactory() {  
        return sessionFactory;  
    }  
  
    public void setSessionFactory(SessionFactory sessionFactory) {  
        this.sessionFactory = sessionFactory;  
    }  
    
    public void addQuesstion(QuestionList question){
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(question); 
		tran.commit();
    }
    
    public List<QuestionList> getAllQuessions(){
    	List<QuestionList> list = null;
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		list = session.createQuery("from QuestionList").list();
		tran.commit();
		return list;
    }
    
    public List<Questions> getAllQuestionsInPage(){//�����ⵥ�е�������Ŀ��Ϣ
    	List<Questions> list = null;
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		list = session.createQuery("from Questions").list();
		tran.commit();
		return list;
    }
    
    public void addNewPage(UserQuestions uquestion){//����µ��ⵥ
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(uquestion); 
		tran.commit();
    }
    
    public void addNewQuestionToPage(Questions question){//���ⵥ������µ���Ŀ
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(question); 
		tran.commit();
    }
    
    public List<UserQuestionsAndQuestions> getUserQuestionsAndQuestions(String developName){//�����û����ⵥ
    	List<UserQuestionsAndQuestions> list = null;
    	String sql = "select new com.hzml.entriy.UserQuestionsAndQuestions(uq.score, uq.pageQuestionId, q.optionSelect, ql.questionMsg, ql.optionA, ql.optionB, ql.optionC, ql.optionD, ql.optionCorrect, ql.difficultDegree) from UserQuestions uq, Questions q, QuestionList ql where uq.developName=\'" + developName + 
			     "\' and uq.pageQuestionId=q.pageQuestionId and q.questionId=ql.questionId";
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		list = session.createQuery(sql).list();
		tran.commit();
		return list;
    }
}
