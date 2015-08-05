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
			//��ȡ��ǰ��Ŀ����Ϣ
			Task task = distributeDao.getTask(Integer.parseInt(taskid));
			ActionContext.getContext().getSession().put("showParticipateTask", task);
			//��ȡ�������Ŀ�����еĿ�������Ϣ
			List<DevelopingParty> developingPartyList = distributeDao.findTaskAllUser(Integer.parseInt(taskid));
			ActionContext.getContext().getSession().put("showParticipateTask_AllUser", developingPartyList);
			//����,����µ��鳤����Ϣ
			if(task.getState()==0)//�����ǰ������û��ִ�������
				distributeDao.updateTaskAppendTableMsg(task.getTaskid(), developingPartyList.get(0).getDevelopName());//���µ�ǰ������鳤
			else{//��Ŀ����Ѿ�ִ���ˣ������Ѿ�����ˣ�����Ŀ�ĸ�����־�ó���
				List<UpdateWrok> updateWorkList = distributeDao.getUpdateWrok(Integer.parseInt(taskid));
				ActionContext.getContext().getSession().put("showParticipateTask_AllUpdateWork", updateWorkList);
			}
			TaskAppend taskAppend = distributeDao.findLeaderMsg(task.getTaskid());
			ActionContext.getContext().getSession().put("showParticipateTask_leader", taskAppend);
			//���������Ŀ���Ŷӣ��õ�taskteam.agreeToStart�������жϿ������Ƿ�ͬ����Ŀ�Ŀ���
			List<TaskTeam> taskTeamList = distributeDao.findTaskTeam(Integer.parseInt(taskid));
			ActionContext.getContext().getSession().put("showParticipateTask_taskTeam", taskTeamList);
			//���������еĿ�Ƭ����ȫ����ȡ
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
		//�õ��μ���������������������������ܳ���10
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
	
	public String userRequestToSubmitComment(){//�û��ύ�Լ�������
		String developName = (String)ActionContext.getContext().getSession().get("peopleName");
		String taskid = ServletActionContext.getRequest().getParameter("taskid");
		String receiveCardName = ServletActionContext.getRequest().getParameter("receiveCardName");
		String cardContent = ServletActionContext.getRequest().getParameter("cardContent");
		Card card = new Card(new Timestamp(System.currentTimeMillis()), cardContent, 0, Integer.parseInt(taskid), receiveCardName, (String)ActionContext.getContext().getSession().get("peopleName"));
		distributeDao.saveCard(card);
		return "cardSaveSuccess";
	}
	
	public String userRequestToChangeProjectState(){//�û��Ƿ�ͬ����Ŀ��ʼִ��
		String peopleName = ServletActionContext.getRequest().getParameter("peopleName");
		String taskid = ServletActionContext.getRequest().getParameter("taskid");
		distributeDao.changProjectState(peopleName, Integer.parseInt(taskid));
		return "changeProjectState";
	}
	
	public String userRequestToBeginProject(){//�鳤��Ϊ��Ŀ���Խ�����
		String peopleName = ServletActionContext.getRequest().getParameter("peopleName");//�õ��鳤�����֣��жϵ�ǰ�Ƿ����鳤
		String taskid = ServletActionContext.getRequest().getParameter("taskid");
		TaskAppend taskAppend = distributeDao.findLeaderMsg(Integer.parseInt(taskid));
		if(taskAppend.getTaskLeader().equals(peopleName)){//��ǰ�������鳤
			Task task = distributeDao.getTask(Integer.parseInt(taskid));
			task.setState(1);//����ʼ
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
