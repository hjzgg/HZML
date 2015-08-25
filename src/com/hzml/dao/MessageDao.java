package com.hzml.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hzml.entriy.Contact;

public class MessageDao implements Serializable{
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
    
    public void saveContactMsg(Contact msg){
    	Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(msg); 
		tran.commit();
    }
    
    public List<Contact> getAllContactMsg(){
    	Session session = this.getSession();
    	List<Contact> list = null;
		Transaction tran = session.beginTransaction();
		list = session.createQuery("from Contact order by msgTime desc").list();
		tran.commit();
		return list;
    }
}
