package com.hzml.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hzml.dao.DistributeDao;
import com.hzml.entriy.TaskAppend;
import com.hzml.entriy.UpdateWrok;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateWorkAction extends ActionSupport{
	private DistributeDao distributeDao;
	private String peopleName;
	private String taskid;
	private String taskStep;
	
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

	public String saveUpdateWork () throws Exception{
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
        UpdateWrok updateWrok = distributeDao.getUpdateWrokBean(Integer.parseInt(taskid), getPeopleName(), Integer.parseInt(taskStep));
        if(updateWrok == null){
	        if(files.size()>1)
	        	updateWrok = new UpdateWrok(Integer.parseInt(getTaskid()), getPeopleName(), getFileFileName().get(1), 0, getFileFileName().get(0), Integer.parseInt(getTaskStep()));
	        else
	        	updateWrok = new UpdateWrok(Integer.parseInt(getTaskid()), getPeopleName(), null, 0, getFileFileName().get(0), Integer.parseInt(getTaskStep()));
	        distributeDao.saveUpdateWork(updateWrok);
        } else {
        	updateWrok.setWorkSummaryAddress(getFileFileName().get(0));
        	if(files.size()>1)
        		updateWrok.setPlanDocumentAddress(getFileFileName().get(1));
        	distributeDao.updateUpdateWork(updateWrok);
        }
        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        request.setAttribute("taskid", taskid);
        request.setAttribute("userRequest", "showParticipateTask");
		return "saveUpdateWork";
	}
	
	public String fileUpload() throws Exception{
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
            TaskAppend taskAppend = distributeDao.findLeaderMsg(Integer.parseInt(taskid));
            taskAppend.setTaskAllocationDoc(getFileFileName().get(0));
            distributeDao.updateTaskAppend(taskAppend);
        }
		return "fileUpload";
	}
	
	public String finishMyTaskWrok(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        request.setAttribute("taskid", taskid);
        request.setAttribute("userRequest", "showParticipateTask");
        distributeDao.finishMyTaskWork(Integer.parseInt(taskid), peopleName);
        return "finishMyTaskWrok";
	}

	public String getPeopleName() {
		return peopleName;
	}

	public void setPeopleName(String peopleName) {
		this.peopleName = peopleName;
	}

	public String getTaskid() {
		return taskid;
	}

	public void setTaskid(String taskid) {
		this.taskid = taskid;
	}

	public String getTaskStep() {
		return taskStep;
	}

	public void setTaskStep(String taskStep) {
		this.taskStep = taskStep;
	}
}
