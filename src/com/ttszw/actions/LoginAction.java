package com.ttszw.actions;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.hzml.entriy.TaskAppend;
import com.opensymphony.xwork2.ActionContext;
import com.ttszw.action.Action;
import com.ttszw.action.ChatMassage;
import com.ttszw.action.ChatRoom;

public class LoginAction implements Action {

	public Object execute(HttpServletRequest req, HttpServletResponse res) {
		String name = req.getParameter("name");
		int chatRoomId = Integer.parseInt(req.getParameter("chatRoomId"));;
		if(!ChatRoom.instance().chatRoomMap.containsKey(chatRoomId))
			ChatRoom.instance().chatRoomMap.put(chatRoomId, new ChatMassage());
		ChatMassage cm = ChatRoom.instance().chatRoomMap.get(chatRoomId);
		
		String result =null;
		if(cm.isFull()){
			result = "������������";
		}else if(cm.hasUser(name)){
			result = "���û��������ڣ�";
		}else{
			if(req.getParameter("flag") != null){//˵�������ʶ��˾��Ա
				cm.getPublisherSet().add(name);
			}
			cm.addUser(name);
			HttpSession session = req.getSession();
			session.setAttribute("username", name);
			SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
			String date = dateFormat.format(new Date());
			cm.setMassage("<br><font color='red' >��ӭ "+name+" �û��� "+date+" ���������ң�</font><br>");
		}
		JSONObject json = new JSONObject();
		json.put("massage", result);
		return json;
	}

}
