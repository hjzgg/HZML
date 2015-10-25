package com.hzml.action;

import java.sql.Timestamp;
import java.util.List;

import com.hzml.dao.DistributeDao;
import com.hzml.dao.MessageDao;
import com.hzml.entriy.Contact;
import com.hzml.entriy.DevelopToPublishMsg;
import com.hzml.entriy.Task;
import com.hzml.entriy.TaskAppend;
import com.hzml.entriy.UpdateWrok;
import com.hzml.variableEntry.DevelopToPublishMsgVar;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DevelopToPublishMsgAction extends ActionSupport{
	private DevelopToPublishMsgVar developToPublishMsgVar;
	private DistributeDao distributeDao;
	
	public DistributeDao getDistributeDao() {
		return distributeDao;
	}

	public void setDistributeDao(DistributeDao distributeDao) {
		this.distributeDao = distributeDao;
	}

	private MessageDao messageDao;
	
	private String msgId;
	private String taskId;
	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	public DevelopToPublishMsgVar getDevelopToPublishMsgVar() {
		return developToPublishMsgVar;
	}

	public void setDevelopToPublishMsgVar(DevelopToPublishMsgVar developToPublishMsgVar) {
		this.developToPublishMsgVar = developToPublishMsgVar;
	}
	
	public String saveDevelopToPublishMsg(){
		DevelopToPublishMsg developToPublishMsg = new DevelopToPublishMsg();
		developToPublishMsg.setEmail(developToPublishMsgVar.getEmail());
		developToPublishMsg.setMsg(developToPublishMsgVar.getMessage());
		developToPublishMsg.setMsgTime(new Timestamp(System.currentTimeMillis()));
		developToPublishMsg.setPublishName(developToPublishMsgVar.getPublishName());
		developToPublishMsg.setTaskId(developToPublishMsgVar.getTaskId());
		developToPublishMsg.setState(0);
		developToPublishMsg.setTaskName(developToPublishMsgVar.getTaskName());
		messageDao.saveDevelopToPublishMsg(developToPublishMsg);
		return "saveDevelopToPublishMsg";
	}
	
	public String updateDevelopToPublishMsg(){
		int msgIdd = Integer.parseInt(msgId);
		DevelopToPublishMsg msg = messageDao.getDevelopToPublishMsg(msgIdd);
    	msg.setState(1);
    	messageDao.updateDevelopToPublishMsg(msg);
    	return "updateDevelopToPublishMsg";
	}
	
	public String getAllDevelopToPublishMsg(){
		String publishName = (String)ActionContext.getContext().getSession().get("peopleName");
		List<DevelopToPublishMsg> list = messageDao.getAllDevelopToPublishMsg(publishName);
		ActionContext.getContext().getSession().put("getAllDevelopToPublishMsg", list);
		return "getAllDevelopToPublishMsg";
	}
	
	public String getTaskAllocationDoc(){
		//taskId == chatRoomId
		TaskAppend taskAppend = distributeDao.findLeaderMsg(Integer.parseInt(taskId));
		Task task = distributeDao.getTask(Integer.parseInt(taskId));
		ActionContext.getContext().getSession().put("getTask", task);
		ActionContext.getContext().getSession().put("getTaskAllocationDoc", taskAppend);
		List<UpdateWrok> updateWorkList = distributeDao.getUpdateWrok(Integer.parseInt(taskId));
		ActionContext.getContext().getSession().put("getParticipateTask_AllUpdateWork", updateWorkList);
		return "getTaskAllocationDoc";
	}
}
