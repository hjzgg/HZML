package com.hzml.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hzml.entriy.Contact;
import com.hzml.entriy.DevelopToPublishMsg;

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
    	Session session = null;
    	Transaction tran = null;
    	try{
	    	session = this.getSession();
			tran = session.beginTransaction();
			session.save(msg); 
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
    }
    
    public Contact getContactMsg(int msgId){
    	Contact datas = null;
    	Session session = null;
    	Transaction tran = null;
    	try{
    		session = this.getSession();
			tran = session.beginTransaction();
			datas = (Contact) session.createQuery("from Contact where msgId=" + msgId).list().get(0);
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas;
    }
    
    public List<Contact> getAllContactMsg(){
    	List<Contact> list = new ArrayList<Contact>();
    	Session session = null;
    	Transaction tran = null;
    	try{
    		session = this.getSession();
			tran = session.beginTransaction();
			list = session.createQuery("from Contact order by msgTime desc").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return list;
    }
    
    public void updateContactMsg(Contact msg){
    	Session session = null;
    	Transaction tran = null;
    	try{
	    	session = this.getSession();
			tran = session.beginTransaction();
			session.update(msg); 
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
    }
    
    
    public void saveDevelopToPublishMsg(DevelopToPublishMsg msg){
    	Session session = null;
    	Transaction tran = null;
    	try{
	    	session = this.getSession();
			tran = session.beginTransaction();
			session.save(msg); 
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
    }
    
    public DevelopToPublishMsg getDevelopToPublishMsg(int msgId){
    	DevelopToPublishMsg datas = null;
    	Session session = null;
    	Transaction tran = null;
    	try{
    		session = this.getSession();
			tran = session.beginTransaction();
			datas = (DevelopToPublishMsg) session.createQuery("from DevelopToPublishMsg where msgId=" + msgId).list().get(0);
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas;
    }
    
    public List<DevelopToPublishMsg> getAllDevelopToPublishMsg(String publishName){
    	List<DevelopToPublishMsg> list = new ArrayList<DevelopToPublishMsg>();
    	Session session = null;
    	Transaction tran = null;
    	try{
    		session = this.getSession();
			tran = session.beginTransaction();
			list = session.createQuery("from DevelopToPublishMsg where publishName=\'" + publishName + "\' order by msgTime desc").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return list;
    }
    
    public void updateDevelopToPublishMsg(DevelopToPublishMsg msg){
    	Session session = null;
    	Transaction tran = null;
    	try{
	    	session = this.getSession();
			tran = session.beginTransaction();
			session.update(msg); 
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
    }
}
