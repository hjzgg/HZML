package com.hzml.dao;

import java.io.Serializable;
import java.sql.Timestamp;
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
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<Task> datas = session.createQuery("from  Task where taskid=" + taskid).list();
		tran.commit();
		return datas.get(0);
	}
	
	public void updateTask(Task task){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.update(task); 
		tran.commit();
	}
	
	public void updateDevelopingParty(DevelopingParty developingParty){//更新开发者信息
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.update(developingParty); 
		tran.commit();
	}
	
	public void saveTask(Task task) {
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(task); 
		tran.commit();
	}
	
	public List<Task> findAllTask() {
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<Task> datas = session.createQuery("from Task order by publishTime desc").list();
		tran.commit();
		return datas;
	}
	
	public List<Task> findAllTaskOfCompany(String peopleName) {//获得该公司的所有的任务
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<Task> datas = session.createQuery("from Task where publishName = \'" + peopleName + "\' order by publishTime desc").list();
		tran.commit();
		return datas;
	}
	
	public List<Task> findAllFinishedTaskOfCompany(String peopleName) {
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<Task> datas = session.createQuery("from Task where state>=2 and publishName = \'" + peopleName + "\'").list();
		tran.commit();
		return datas;
	}
	
	public List<Task> findUserTaskFinish(String developName){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		String sql="select * from task where task.taskid in (select taskteam.taskid from taskteam where taskteam.developName=\'" + developName + "\') and task.state>=2";
		List<Task> datas = (List<Task>)session.createSQLQuery(sql).addEntity(Task.class).list();
		tran.commit();
		return datas;
	}
	
	public List<Task> findUserTaskNoParticipateTask(String developName){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		String sql="select * from task where task.taskid not in (select taskteam.taskid from taskteam where developName=\'" + developName + "\')";
		List<Task> datas = (List<Task>)session.createSQLQuery(sql).addEntity(Task.class).list();
		tran.commit();
		return datas;
	}
	
	public List<Task> findUserTaskParticipating(String developName){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		String sql="select * from task where task.taskid in (select taskteam.taskid from taskteam where developName=\'" + developName + "\') and (task.state=1 or task.state=0)";
		List<Task> datas = (List<Task>)session.createSQLQuery(sql).addEntity(Task.class).list();
		tran.commit();
		return datas;
	}
	
	public List<DevelopingParty> findTaskAllUser(int taskid){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		String sql="select * from developingparty where developingparty.developName in (select taskteam.developName from taskteam where taskteam.taskid=" + taskid + ") ORDER BY developingparty.evaluate DESC";
		List<DevelopingParty> datas = session.createSQLQuery(sql).addEntity(DevelopingParty.class).list();
		tran.commit();
		return datas;
	}
	
	public DevelopingParty findTaskUser(String developName){
		Session session = this.getSession();
		DevelopingParty developingParty = null; 
		Transaction tran = session.beginTransaction();
		developingParty = (DevelopingParty) session.createQuery("from DevelopingParty where developName = \'" + developName + "\'").list().get(0);
		tran.commit();
		return developingParty;
	}
	
	public void deleteTaskAppendTableMsg(int taskid){//删除当前任务组长信息
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		TaskAppend taskAppend = new TaskAppend(taskid, "", 0, null, 0);
		session.delete(taskAppend);
		tran.commit();
	}
	
	public void updateTaskAppendTableMsg(int taskid, String peopleName){//更新当前任务组长信息
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		TaskAppend taskAppend = new TaskAppend(taskid, "", 0, null, 0);
		session.delete(taskAppend);
		taskAppend = new TaskAppend(taskid, peopleName, 0, null, 0);
		session.save(taskAppend);
		tran.commit();
	}
	
	public void updateTaskAppend(TaskAppend taskAppend){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.update(taskAppend);
		tran.commit();
	}
	
	public TaskAppend findLeaderMsg(int taskid){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		TaskAppend taskAppend = (TaskAppend) session.createQuery("from TaskAppend where taskid=" + taskid).list().get(0);
		tran.commit();
		return taskAppend;
	}
	
	public void savePeopleToTaskTeam(int taskid, String developName){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		TaskTeam taskTeam = new TaskTeam(0, taskid, developName, 0, 0);
		session.save(taskTeam);
		tran.commit();
	}
	
	public List<Card> findTaskCard(int taskid){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<Card> datas = (List<Card>) session.createQuery("from Card where taskid=" + taskid + " order by cardTime").list();
		tran.commit();
		return datas; 
	}
	
	public List<TaskTeam> findTaskTeam(int taskid){//返回参与这个项目的团队
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<TaskTeam> datas = (List<TaskTeam>) session.createQuery("from TaskTeam where taskid=" + taskid).list();
		tran.commit();
		return datas;
	}
	
	public void saveCard(Card card){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.save(card);
		tran.commit();
	}
	
	public void changProjectState(String peopleName, int taskid){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<TaskTeam> datas = (List<TaskTeam>) session.createQuery("from TaskTeam where taskid=" + taskid + " and developName=\'" + peopleName + "\'").list();
		TaskTeam curUserState = datas.get(0);
		curUserState.setAgreeToStart(curUserState.getAgreeToStart()==0 ? 1 : 0);
		session.update(curUserState);
		tran.commit();
	}
	
	public List<UpdateWrok> getUpdateWrok(int taskid){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<UpdateWrok> datas = (List<UpdateWrok>) session.createQuery("from UpdateWrok where taskid=" + taskid + " order by developName").list();//按照名字排序，每两个信息的名字是一样的
		tran.commit();
		return datas;
	}
	
	public UpdateWrok getUpdateWrokBean(int taskid, String developName, int taskStep){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<UpdateWrok> datas = (List<UpdateWrok>) session.createQuery("from UpdateWrok where taskid=" + taskid + " and taskStep=" + taskStep + " and developName=\'" + developName + "\'").list();
		tran.commit();
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
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		session.update(updateWork);
		tran.commit();
	}
	
	public void finishMyTaskWork(int taskid, String peopleName){
		Session session = this.getSession();
		Transaction tran = session.beginTransaction();
		List<TaskTeam> datas = (List<TaskTeam>) session.createQuery("from TaskTeam where taskid=" + taskid + " and developName=\'" + peopleName + "\'").list();
		TaskTeam taskTeam = datas.get(0);
		taskTeam.setFinishMyTask(1);
		session.save(taskTeam);
		tran.commit();
	}
	
}
