package com.ttszw.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.ttszw.action.Action;
import com.ttszw.action.ChatMassage;
import com.ttszw.action.ChatRoom;

public class LoadUserAction implements Action {

	public Object execute(HttpServletRequest req, HttpServletResponse res) {
		int chatRoomId = Integer.parseInt(req.getParameter("chatRoomId"));;
		if(!ChatRoom.instance().chatRoomMap.containsKey(chatRoomId))
			ChatRoom.instance().chatRoomMap.put(chatRoomId, new ChatMassage());
		ChatMassage cm = ChatRoom.instance().chatRoomMap.get(chatRoomId);
		cm.setChatRoomId(chatRoomId);
		String userMass = cm.getUsers();
		int CurrentUsers = cm.userNum;
		
		JSONObject json = new JSONObject();
		json.put("num", CurrentUsers);
		json.put("userMass", userMass);
		return json;
	}

}
