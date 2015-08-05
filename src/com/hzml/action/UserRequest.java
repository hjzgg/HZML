package com.hzml.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hzml.dao.DistributeDao;
import com.hzml.entriy.Card;
import com.hzml.entriy.DevelopingParty;
import com.hzml.entriy.Task;
import com.hzml.entriy.TaskAppend;
import com.hzml.entriy.TaskTeam;
import com.hzml.entriy.UpdateWrok;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserRequest extends ActionSupport{
	private DistributeDao distributeDao;
	
	public DistributeDao getDistributeDao() {
		return distributeDao;
	}

	public void setDistributeDao(DistributeDao distributeDao) {
		this.distributeDao = distributeDao;
	}

	public String userRequest(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String userRequest = request.getParameter("userRequest");
		String taskid = request.getParameter("taskid");
		if(userRequest==null)
			userRequest = (String)request.getAttribute("userRequest");
		if(taskid==null)
			taskid = (String)request.getAttribute("taskid");
		if(userRequest==null){
			return "userError";
		}
		String peopleName = (String)ActionContext.getContext().getSession().get("peopleName");
		if(userRequest.equals("userTaskFinish")){
			List<Task> taskList = distributeDao.findUserTaskFinish(peopleName);
			ActionContext.getContext().getSession().put("userTaskFinish", taskList);
			return "userTaskFinish";
		} else if(userRequest.equals("userTaskNoParticipate")){
			List<Task> taskList = distributeDao.findUserTaskNoParticipateTask(peopleName);
			ActionContext.getContext().getSession().put("userTaskNoParticipate", taskList);
			return "userTaskNoParticipate";
		} else if(userRequest.equals("userTaskParticipating")){
			List<Task> taskList = distributeDao.findUserTaskParticipating(peopleName);
			ActionContext.getContext().getSession().put("userTaskParticipating", taskList);
			return "userTaskParticipating";
		} else if(userRequest.equals("showNoParticipateTask")){
			if(taskid==null) return "userError";
			Task task = distributeDao.getTask(Integer.parseInt(taskid));
			ActionContext.getContext().getSession().put("showNoParticipateTask", task);
			return "showNoParticipateTask";
		} else if(userRequest.equals("showParticipateTask")){
			if(taskid==null) return "userError";
			//获取当前项目的信息
			Task task = distributeDao.getTask(Integer.parseInt(taskid));
			ActionContext.getContext().getSession().put("showParticipateTask", task);
			//获取参与该项目的所有的开发者信息
			List<DevelopingParty> developingPartyList = distributeDao.findTaskAllUser(Integer.parseInt(taskid));
			ActionContext.getContext().getSession().put("showParticipateTask_AllUser", developingPartyList);
			//更新,获得新的组长的消息
			if(task.getState()==0)//如果当前的任务还没有执行则更新
				distributeDao.updateTaskAppendTableMsg(task.getTaskid(), developingPartyList.get(0).getDevelopName());//更新当前任务的组长
			else{//项目如果已经执行了，或者已经完成了，将项目的更新日志拿出来
				List<UpdateWrok> updateWorkList = distributeDao.getUpdateWrok(Integer.parseInt(taskid));
				ActionContext.getContext().getSession().put("showParticipateTask_AllUpdateWork", updateWorkList);
			}
			TaskAppend taskAppend = distributeDao.findLeaderMsg(task.getTaskid());
			ActionContext.getContext().getSession().put("showParticipateTask_leader", taskAppend);
			//返回这个项目的团队，用到taskteam.agreeToStart属性来判断开发者是否同意项目的开发
			List<TaskTeam> taskTeamList = distributeDao.findTaskTeam(Integer.parseInt(taskid));
			ActionContext.getContext().getSession().put("showParticipateTask_taskTeam", taskTeamList);
			//将交流区中的卡片内容全部获取
			List<Card> cardList = (List<Card>)distributeDao.findTaskCard(Integer.parseInt(taskid));
			ActionContext.getContext().getSession().put("showParticipateTask_Allcard", cardList);
			List<DevelopingParty> cardToDevelopingPartyList = new ArrayList<DevelopingParty>();
			for(Card card : cardList){
				for(DevelopingParty developingParty : developingPartyList){
					if(card.getPostCardName().equals(developingParty.getDevelopName())){
						cardToDevelopingPartyList.add(developingParty);
						break;
					}
				}
			}
			ActionContext.getContext().getSession().put("showParticipateTask_AllcardToPeople", cardToDevelopingPartyList);
			return "showParticipateTask";
		}
		return "userError";
	}
	
	public String userRequestToTakeInDistribute(){
		String developName = (String)ActionContext.getContext().getSession().get("peopleName");
		String taskid = ServletActionContext.getRequest().getParameter("taskid");
		if(developName == null)
			return "userLoginFail";
		//得到参加这项任务的总人数，总人数不能超过10
		List<DevelopingParty> developingPartyList = distributeDao.findTaskAllUser(Integer.parseInt(taskid));
		if(developingPartyList.size()>=10)
			return "userRequestError";
		boolean isTakeIn = false;
		for(DevelopingParty developingParty : developingPartyList){
			if(developingParty.getDevelopName().equals(developName)){
				isTakeIn = true;
				break;
			}
		}
		if(!isTakeIn)
			distributeDao.savePeopleToTaskTeam(Integer.parseInt(taskid), developName);
		return "userRequestToTakeInDistribute";
	}
	
	public String userRequestToSubmitComment(){//用户提交自己的评论
		String developName = (String)ActionContext.getContext().getSession().get("peopleName");
		String taskid = ServletActionContext.getRequest().getParameter("taskid");
		String receiveCardName = ServletActionContext.getRequest().getParameter("receiveCardName");
		String cardContent = ServletActionContext.getRequest().getParameter("cardContent");
		Card card = new Card(new Timestamp(System.currentTimeMillis()), cardContent, 0, Integer.parseInt(taskid), receiveCardName, (String)ActionContext.getContext().getSession().get("peopleName"));
		distributeDao.saveCard(card);
		return "cardSaveSuccess";
	}
	
	public String userRequestToChangeProjectState(){//用户是否同意项目开始执行
		String peopleName = ServletActionContext.getRequest().getParameter("peopleName");
		String taskid = ServletActionContext.getRequest().getParameter("taskid");
		distributeDao.changProjectState(peopleName, Integer.parseInt(taskid));
		return "changeProjectState";
	}
	
	public String userRequestToBeginProject(){//组长认为项目可以进行了
		String peopleName = ServletActionContext.getRequest().getParameter("peopleName");//得到组长的名字，判断当前是否还是组长
		String taskid = ServletActionContext.getRequest().getParameter("taskid");
		TaskAppend taskAppend = distributeDao.findLeaderMsg(Integer.parseInt(taskid));
		if(taskAppend.getTaskLeader().equals(peopleName)){//当前的人是组长
			Task task = distributeDao.getTask(Integer.parseInt(taskid));
			task.setState(1);//任务开始
			task.setBeginTime(new Timestamp(System.currentTimeMillis()));
			distributeDao.updateTask(task);
			return "ProjectBeginSuccess";
		} else {
			return "ProjectBeginFail";
		}
	}
	
	public String userRequestToBeginNextStep(){
		String taskid = ServletActionContext.getRequest().getParameter("taskid");
		TaskAppend taskAppend = distributeDao.findLeaderMsg(Integer.parseInt(taskid));
		taskAppend.setTaskStep(taskAppend.getNextTaskStep());
		taskAppend.setNextTaskStep(taskAppend.getNextTaskStep()+1);
		distributeDao.updateTaskAppend(taskAppend);
		return "beginNextStep";
	}
	
	public String userRequestToSaveTaskAddress(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String taskid = request.getParameter("taskid");
		String taskAddress = request.getParameter("taskAddress");
		request.setAttribute("taskid", taskid);
        request.setAttribute("userRequest", "showParticipateTask");
		Task task = distributeDao.getTask(Integer.parseInt(taskid));
		task.setTaskAddress(taskAddress);
		distributeDao.updateTask(task);
		return "userRequestToSaveTaskAddress";
	}
	
	public String userRequestToFinishTaskAndSubmit(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String taskid = request.getParameter("taskid");
		request.setAttribute("taskid", taskid);
        request.setAttribute("userRequest", "showParticipateTask");
        Task task = distributeDao.getTask(Integer.parseInt(taskid));
        task.setState(2);
		distributeDao.updateTask(task);
		return "userRequestToFinishTaskAndSubmit";
	}
	
	public String fileDownLoad(){
		String fileName = ServletActionContext.getRequest().getParameter("fileName");
		ActionContext.getContext().getSession().put("fileName", fileName);
		return "fileDownLoad";
	}
}
