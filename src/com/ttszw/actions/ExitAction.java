package com.ttszw.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ttszw.action.Action;
import com.ttszw.action.ChatMassage;
import com.ttszw.action.ChatRoom;

public class ExitAction implements Action {

	public Object execute(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		int chatRoomId =  Integer.parseInt(req.getParameter("chatRoomId"));;
		if(!ChatRoom.instance().chatRoomMap.containsKey(chatRoomId))
			ChatRoom.instance().chatRoomMap.put(chatRoomId, new ChatMassage());
		ChatMassage cm = ChatRoom.instance().chatRoomMap.get(chatRoomId);
		Object name = session.getAttribute("username");
		
		if(name!=null){
			cm.setMassage("<font color='#708090'>"+name.toString()+" ÍË³öÌÖÂÛÇø</font><br>");
			cm.exit(name.toString());
		}
		return null;
	}

}
