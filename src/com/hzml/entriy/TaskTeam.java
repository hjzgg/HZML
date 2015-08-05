package com.hzml.entriy;

import java.io.Serializable;

public class TaskTeam implements Serializable {
	private int taskTeamid;//����
	private int taskid;
	private String developName;
	private int agreeToStart;
	private int finishMyTask;//�����Ƿ��������Ŀ�Ĺ���
	public int getFinishMyTask() {
		return finishMyTask;
	}

	public void setFinishMyTask(int finishMyTask) {
		this.finishMyTask = finishMyTask;
	}

	public int getAgreeToStart() {
		return agreeToStart;
	}

	public void setAgreeToStart(int agreeToStart) {
		this.agreeToStart = agreeToStart;
	}

	public int getTaskid() {
		return taskid;
	}

	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}

	public String getDevelopName() {
		return developName;
	}

	public void setDevelopName(String developName) {
		this.developName = developName;
	}

	public int getTaskTeamid() {
		return taskTeamid;
	}

	public void setTaskTeamid(int taskTeamid) {
		this.taskTeamid = taskTeamid;
	}

	
	public TaskTeam(int taskTeamid, int taskid, String developName,
			int agreeToStart, int finishMyTask) {
		super();
		this.taskTeamid = taskTeamid;
		this.taskid = taskid;
		this.developName = developName;
		this.agreeToStart = agreeToStart;
		this.finishMyTask = finishMyTask;
	}

	public TaskTeam(){
		
	}
}
