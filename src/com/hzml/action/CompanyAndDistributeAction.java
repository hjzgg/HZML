package com.hzml.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.hzml.dao.DistributeDao;
import com.hzml.entriy.Task;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CompanyAndDistributeAction extends ActionSupport{
	private DistributeDao distributeDao;
	private String taskName;
	private String timeID;
	private String money;
	private String taskDescribe;
	
	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	private List<File>	file; // 上传的文件
    private List<String> fileFileName; // 文件名称
    private List<String> fileContentType; // 文件类型
    private String savePath;
	
	public DistributeDao getDistributeDao() {
		return distributeDao;
	}

	public void setDistributeDao(DistributeDao distributeDao) {
		this.distributeDao = distributeDao;
	}

	public String getTimeID() {
		return timeID;
	}

	public void setTimeID(String timeID) {
		this.timeID = timeID;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getTaskDescribe() {
		return taskDescribe;
	}

	public void setTaskDescribe(String taskDescribe) {
		this.taskDescribe = taskDescribe;
	}

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	private void init() throws UnsupportedEncodingException{
		ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
		ServletContext context = ServletActionContext.getServletContext();  
	}

	public String saveTask () throws Exception{
		init();
		// 取得需要上传的文件数组
        List<File> files = getFile();
        if (files != null && files.size() > 0) {
            for (int i = 0; i < files.size(); i++) {
                FileOutputStream fos = new FileOutputStream(getSavePath() + "\\" + getFileFileName().get(i));
                FileInputStream fis = new FileInputStream(files.get(i));
                byte[] buffer = new byte[1024];
                int len = 0;
                while ((len = fis.read(buffer)) > 0) {
                    fos.write(buffer, 0, len);
                }
                fis.close();
                fos.close();
            }
        }
        String publishName = (String)ServletActionContext.getContext().getSession().get("peopleName");
        Task task = new Task(0, publishName, getTaskDescribe(), null, new Timestamp(System.currentTimeMillis()), Integer.valueOf(getTimeID()), null, Integer.valueOf(getMoney()), 0, null, getFileFileName().get(0), getTaskName());
        distributeDao.saveTask(task);
		return "saveTask";
	}
	
	public String findAllFinishedTask(){
		List<Task> taskList = distributeDao.findAllFinishedTask();
		ActionContext.getContext().getSession().put("allFinishedTask", taskList);
		return "allFinishedTask";
	}
	
	public String findAllTask(){
		List<Task> taskList = distributeDao.findAllTask();
		ActionContext.getContext().getSession().put("allTask", taskList);
		return "allTask";
	}
	
	@Override
	public String execute() throws Exception{
		 return "success";
	}
}
