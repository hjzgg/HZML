package com.hzml.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.hzml.entriy.Card;
import com.hzml.entriy.DevelopingParty;
import com.hzml.entriy.Task;
import com.hzml.entriy.TaskAppend;
import com.hzml.entriy.TaskTeam;
import com.hzml.entriy.UpdateWrok;

public class DistributeDao implements Serializable{
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
	
	public Task getTask(int taskid) {
		Session session = null;
    	Transaction tran = null;
    	List<Task> datas = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from  Task where taskid=" + taskid).list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas!=null ? datas.get(0) : null;
	}
	
	public void updateTask(Task task){
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			session.update(task); 
			tran.commit();
    	} catch (Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public void updateDevelopingParty(DevelopingParty developingParty){//更新开发者信息
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			session.update(developingParty); 
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public void saveTask(Task task) {
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			session.save(task); 
			tran.commit();
    	} catch (Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public List<Task> findAllTask() {
		List<Task> datas = new ArrayList<Task>();
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from Task order by publishTime desc").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas;
	}
	
	public List<Task> findAllTaskOfCompany(String peopleName) {//获得该公司的所有的任务
		Session session = null;
    	Transaction tran = null;
    	List<Task> datas = new ArrayList<Task>();
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from Task where publishName = \'" + peopleName + "\' order by publishTime desc").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas;
	}
	
	public List<Task> findAllFinishedTaskOfCompany(String peopleName) {
		Session session = null;
    	Transaction tran = null;
    	List<Task> datas = new ArrayList<Task>();
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = session.createQuery("from Task where state>=2 and publishName = \'" + peopleName + "\'").list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas;
	}
	
	public List<Task> findUserTaskFinish(String developName){
		List<Task> datas = new ArrayList<Task>();
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			String sql="select * from task where task.taskid in (select taskteam.taskid from taskteam where taskteam.developName=\'" + developName + "\') and task.state>=2";
			datas = (List<Task>)session.createSQLQuery(sql).addEntity(Task.class).list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas;
	}
	
	public List<Task> findUserTaskNoParticipateTask(String developName){
		Session session = null;
    	Transaction tran = null;
    	List<Task> datas = new ArrayList<Task>();
		try{
			session = this.getSession();
			tran = session.beginTransaction();
			String sql="select * from task where task.taskid not in (select taskteam.taskid from taskteam where developName=\'" + developName + "\')";
			datas = (List<Task>)session.createSQLQuery(sql).addEntity(Task.class).list();
			tran.commit();
		} catch(Exception e){
			System.out.println(e.toString());
			tran.rollback();
		}
		return datas;
	}
	
	public List<Task> findUserTaskParticipating(String developName){
		Session session = null;
    	Transaction tran = null;
    	List<Task> datas = new ArrayList<Task>();
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			String sql="select * from task where task.taskid in (select taskteam.taskid from taskteam where developName=\'" + developName + "\') and (task.state=1 or task.state=0)";
			datas = (List<Task>)session.createSQLQuery(sql).addEntity(Task.class).list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas;
	}
	
	public List<DevelopingParty> findTaskAllUser(int taskid){
		Session session = null;
    	Transaction tran = null;
    	List<DevelopingParty> datas = new ArrayList<DevelopingParty>();
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			String sql="select * from developingparty where developingparty.developName in (select taskteam.developName from taskteam where taskteam.taskid=" + taskid + ") ORDER BY developingparty.evaluate DESC";
			datas = session.createSQLQuery(sql).addEntity(DevelopingParty.class).list();
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas;
	}
	
	public DevelopingParty findTaskUser(String developName){
		DevelopingParty developingParty = null;
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			developingParty = (DevelopingParty) session.createQuery("from DevelopingParty where developName = \'" + developName + "\'").list().get(0);
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return developingParty;
	}
	
	public void deleteTaskAppendTableMsg(int taskid){//删除当前任务组长信息
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			TaskAppend taskAppend = new TaskAppend(taskid, "", 0, null, 0);
			session.delete(taskAppend);
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public void updateTaskAppendTableMsg(int taskid, String peopleName){//更新当前任务组长信息
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			TaskAppend taskAppend = new TaskAppend(taskid, "", 0, null, 0);
			session.delete(taskAppend);
			taskAppend = new TaskAppend(taskid, peopleName, 0, null, 0);
			session.save(taskAppend);
			tran.commit();
    	} catch (Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public void updateTaskAppend(TaskAppend taskAppend){
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			session.update(taskAppend);
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public TaskAppend findLeaderMsg(int taskid){
		Session session = null;
    	Transaction tran = null;
    	TaskAppend taskAppend = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			taskAppend = (TaskAppend) session.createQuery("from TaskAppend where taskid=" + taskid).list().get(0);
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return taskAppend;
	}
	
	public void savePeopleToTaskTeam(int taskid, String developName){
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			TaskTeam taskTeam = new TaskTeam(0, taskid, developName, 0, 0);
			session.save(taskTeam);
			tran.commit();
    	} catch(Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public List<Card> findTaskCard(int taskid){
		Session session = null;
    	Transaction tran = null;
    	List<Card> datas = new ArrayList<Card>();
		try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = (List<Card>) session.createQuery("from Card where taskid=" + taskid + " order by cardTime").list();
			tran.commit();
		} catch (Exception e){
			System.out.println(e.toString());
			tran.rollback();
		}
		return datas; 
	}
	
	public List<TaskTeam> findTaskTeam(int taskid){//返回参与这个项目的团队
		List<TaskTeam> datas = new ArrayList<TaskTeam>();
		Session session = null;
    	Transaction tran = null;
		try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = (List<TaskTeam>) session.createQuery("from TaskTeam where taskid=" + taskid).list();
			tran.commit();
		} catch (Exception e){
			System.out.println(e.toString());
			tran.rollback();
		}
		return datas;
	}
	
	public void saveCard(Card card){
		Session session = null;
    	Transaction tran = null;
    	try{
    		session = this.getSession();
    		tran = session.beginTransaction();
    		session.save(card);
    		tran.commit();
    	} catch (Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public void changProjectState(String peopleName, int taskid){
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			List<TaskTeam> datas = (List<TaskTeam>) session.createQuery("from TaskTeam where taskid=" + taskid + " and developName=\'" + peopleName + "\'").list();
			TaskTeam curUserState = datas.get(0);
			curUserState.setAgreeToStart(curUserState.getAgreeToStart()==0 ? 1 : 0);
			session.update(curUserState);
			tran.commit();
    	} catch (Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public List<UpdateWrok> getUpdateWrok(int taskid){
		Session session = null;
    	Transaction tran = null;
    	List<UpdateWrok> datas = new ArrayList<UpdateWrok>();
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = (List<UpdateWrok>) session.createQuery("from UpdateWrok where taskid=" + taskid + " order by developName").list();//按照名字排序，每两个信息的名字是一样的
			tran.commit();
    	} catch (Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		return datas;
	}
	
	public UpdateWrok getUpdateWrokBean(int taskid, String developName, int taskStep){
		Session session = null;
    	Transaction tran = null;
    	List<UpdateWrok> datas = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			datas = (List<UpdateWrok>) session.createQuery("from UpdateWrok where taskid=" + taskid + " and taskStep=" + taskStep + " and developName=\'" + developName + "\'").list();
			tran.commit();
    	} catch (Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
		if(datas==null || datas.size()==0)
			return null;
		return datas.get(0);
	}
	
	public void saveUpdateWork(UpdateWrok updateWork){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(updateWork);
		tran.commit();
	}
	
	public void updateUpdateWork(UpdateWrok updateWork){
		Session session = null;
    	Transaction tran = null;
    	try{
    		session = this.getSession();
    		tran = session.beginTransaction();
    		session.update(updateWork);
    		tran.commit();
    	} catch (Exception e){
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
	public void finishMyTaskWork(int taskid, String peopleName){
		Session session = null;
    	Transaction tran = null;
    	try{
			session = this.getSession();
			tran = session.beginTransaction();
			List<TaskTeam> datas = (List<TaskTeam>) session.createQuery("from TaskTeam where taskid=" + taskid + " and developName=\'" + peopleName + "\'").list();
			TaskTeam taskTeam = datas.get(0);
			taskTeam.setFinishMyTask(1);
			session.save(taskTeam);
			tran.commit();
    	} catch (Exception e) {
    		System.out.println(e.toString());
    		tran.rollback();
    	}
	}
	
}
