package com.hzml.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hzml.entriy.QuestionList;
import com.hzml.entriy.Questions;
import com.hzml.entriy.UserQuestions;

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
    
    public List<Questions> getAllQuestionsInPage(){//返回题单中的所有题目信息
    	List<Questions> list = null;
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		list = session.createQuery("from Questions").list();
		tran.commit();
		return list;
    }
    
    public void addNewPage(UserQuestions uquestion){//添加新的题单
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(uquestion); 
		tran.commit();
    }
    
    public void addNewQuestionToPage(Questions question){//向题单中添加新的题目
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(question); 
		tran.commit();
    }
}
