package com.hzml.action;

import java.util.List;

import com.hzml.dao.DistributeDao;
import com.hzml.entriy.Task;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IndexRequest extends ActionSupport{
	private DistributeDao distributeDao;
	
	public DistributeDao getDistributeDao() {
		return distributeDao;
	}

	public void setDistributeDao(DistributeDao distributeDao) {
		this.distributeDao = distributeDao;
	}

	public String theLastTaskRequestForIndex(){//�����������������,��ʾ����ҳ��
		List<Task> taskList = distributeDao.findAllTask();
		ActionContext.getContext().getSession().put("theLastTaskRequestForIndex", taskList);
		return "theLastTaskRequestForIndex";
	}
}
