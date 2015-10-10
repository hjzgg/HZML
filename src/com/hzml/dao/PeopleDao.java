package com.hzml.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hzml.entriy.DevelopingParty;
import com.hzml.entriy.Manager;
import com.hzml.entriy.PublishParty;

public class PeopleDao implements Serializable{
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
	
	public PublishParty getPublishParty(Integer id) {
		Session session = null;
    	Transaction tran = null;
    	List<PublishParty> datas = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from  TestMessage").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas!=null ? datas.get(id) : null;
	}

	public boolean isExistPublishParty(String username, String password){
		Session session = null;
    	Transaction tran = null;
    	List<PublishParty> datas = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from PublishParty where publishName=\'" + username + "\' and pwd=\'" + password + "\'").list();
			tran.commit();
    	} catch (Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public boolean isExistManager(String username, String password){
		Session session = null;
    	Transaction tran = null;
    	List<Manager> datas = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from Manager where name=\'" + username + "\' and pwd=\'" + password + "\'").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public boolean isExistDevelopingParty(String username, String password){
		Session session = null;
    	Transaction tran = null;
    	List<DevelopingParty> datas = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from DevelopingParty where developName=\'" + username + "\' and pwd=\'" + password + "\'").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public boolean isRegisterPublishParty(String username){
		Session session = null;
    	Transaction tran = null;
    	List<PublishParty>  datas = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from PublishParty where publishName=\'" + username + "\'").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public boolean isRegisterDevelopingParty(String username){
		Session session = null;
    	Transaction tran = null;
    	List<DevelopingParty> datas = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from DevelopingParty where developName=\'" + username + "\'").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public void savePublishParty(PublishParty publishParty) {
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			session.save(publishParty); 
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	} 
	
	public void saveDevelopingParty(DevelopingParty developingParty) {
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			session.save(developingParty); 
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	} 
}
