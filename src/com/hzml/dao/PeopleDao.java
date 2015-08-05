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
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<PublishParty> datas = session.createQuery("from  TestMessage").list();
		tran.commit();
		return datas.get(id);
	}

	public boolean isExistPublishParty(String username, String password){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<PublishParty> datas = session.createQuery("from PublishParty where publishName=\'" + username + "\' and pwd=\'" + password + "\'").list();
		tran.commit();
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public boolean isExistManager(String username, String password){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<Manager> datas = session.createQuery("from Manager where name=\'" + username + "\' and pwd=\'" + password + "\'").list();
		tran.commit();
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public boolean isExistDevelopingParty(String username, String password){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<DevelopingParty> datas = session.createQuery("from DevelopingParty where developName=\'" + username + "\' and pwd=\'" + password + "\'").list();
		tran.commit();
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public boolean isRegisterPublishParty(String username){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<PublishParty> datas = session.createQuery("from PublishParty where publishName=\'" + username + "\'").list();
		tran.commit();
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public boolean isRegisterDevelopingParty(String username){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<DevelopingParty> datas = session.createQuery("from DevelopingParty where developName=\'" + username + "\'").list();
		tran.commit();
		if(datas==null || datas.size() == 0)
			return false;
		return true;
	}
	
	public void savePublishParty(PublishParty publishParty) {
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(publishParty); 
		tran.commit();
	} 
	
	public void saveDevelopingParty(DevelopingParty developingParty) {
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(developingParty); 
		tran.commit();
	} 
}
