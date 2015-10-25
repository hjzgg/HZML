package com.ttszw.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.ttszw.action.Action;
import com.ttszw.action.ChatMassage;
import com.ttszw.action.ChatRoom;

public class LoadDataAction implements Action {

	public Object execute(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		String numb = req.getParameter("num");
		int num;
		if(numb==null){
			num = Integer.valueOf(session.getAttribute("massageNumber").toString());
		}else{
			num = Integer.valueOf(numb.trim());
		}
		int chatRoomId = Integer.parseInt(req.getParameter("chatRoomId"));;
		if(!ChatRoom.instance().chatRoomMap.containsKey(chatRoomId))
			ChatRoom.instance().chatRoomMap.put(chatRoomId, new ChatMassage());
		ChatMassage cm = ChatRoom.instance().chatRoomMap.get(chatRoomId);
		String mas = cm.getMassage(num);

		int massageNumber=cm.mass_num;
		session.setAttribute("massageNumber", massageNumber);
		
		JSONObject json = new JSONObject();
		json.put("massage", mas);
		json.put("massageNumber", massageNumber);
		return json;
	}

}
