package com.hzml.entriy;

import java.io.Serializable;

public class TaskAppend implements Serializable{
	private int taskid;
	private String taskLeader;
	private int taskStep;
	private String taskAllocationDoc;
	private int nextTaskStep;
	public int getNextTaskStep() {
		return nextTaskStep;
	}
	public void setNextTaskStep(int nextTaskStep) {
		this.nextTaskStep = nextTaskStep;
	}
	public String getTaskAllocationDoc() {
		return taskAllocationDoc;
	}
	public void setTaskAllocationDoc(String taskAllocationDoc) {
		this.taskAllocationDoc = taskAllocationDoc;
	}
	public int getTaskid() {
		return taskid;
	}
	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}
	public String getTaskLeader() {
		return taskLeader;
	}
	public void setTaskLeader(String taskLeader) {
		this.taskLeader = taskLeader;
	}
	public int getTaskStep() {
		return taskStep;
	}
	public void setTaskStep(int taskStep) {
		this.taskStep = taskStep;
	}
	public TaskAppend(){
		
	}
	public TaskAppend(int taskid, String taskLeader, int taskStep,
			String taskAllocationDoc, int nextTaskStep) {
		super();
		this.taskid = taskid;
		this.taskLeader = taskLeader;
		this.taskStep = taskStep;
		this.taskAllocationDoc = taskAllocationDoc;
		this.nextTaskStep = nextTaskStep;
	}
	
}
