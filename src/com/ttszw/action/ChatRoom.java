package com.ttszw.action;

import java.util.Map;
import java.util.TreeMap;

public class ChatRoom {
	protected ChatRoom(){}
	public Map<Integer, ChatMassage> chatRoomMap = new TreeMap<Integer, ChatMassage>();
	public static ChatRoom charRoom = null;
	public static ChatRoom instance(){
		if(charRoom == null)
			charRoom = new  ChatRoom();
		return charRoom;
	}
}
