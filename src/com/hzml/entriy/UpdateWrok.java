package com.hzml.entriy;

import java.io.Serializable;

public class UpdateWrok implements Serializable {
	private int taskid;
	private String developName;
	private String planDocumentAddress;
	private int updateWorkid;//жїТы
	private String workSummaryAddress;
	private int taskStep;
	public int getTaskStep() {
		return taskStep;
	}

	public void setTaskStep(int taskStep) {
		this.taskStep = taskStep;
	}

	public String getWorkSummaryAddress() {
		return workSummaryAddress;
	}

	public void setWorkSummaryAddress(String workSummaryAddress) {
		this.workSummaryAddress = workSummaryAddress;
	}

	public UpdateWrok(){
		
	}

	public UpdateWrok(int taskid, String developName,
			String planDocumentAddress, int updateWorkid,
			String workSummaryAddress, int taskStep) {
		super();
		this.taskid = taskid;
		this.developName = developName;
		this.planDocumentAddress = planDocumentAddress;
		this.updateWorkid = updateWorkid;
		this.workSummaryAddress = workSummaryAddress;
		this.taskStep = taskStep;
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
	public String getPlanDocumentAddress() {
		return planDocumentAddress;
	}
	public void setPlanDocumentAddress(String planDocumentAddress) {
		this.planDocumentAddress = planDocumentAddress;
	}
	public int getUpdateWorkid() {
		return updateWorkid;
	}
	public void setUpdateWorkid(int updateWorkid) {
		this.updateWorkid = updateWorkid;
	}
	
	
}
