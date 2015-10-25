package com.ttszw.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;
/**
 * coding utf-8
 * @author chengkai
 *
 */
public class ChatMassage {
	private int chatRoomId;
	private Set<String> publisherSet = new TreeSet<String>();
	public  Set<String> getPublisherSet(){
		return publisherSet;
	}
	public int getChatRoomId() {
		return chatRoomId;
	}

	public void setChatRoomId(int chatRoomId) {
		this.chatRoomId = chatRoomId;
	}

	private List<String> users = new ArrayList<String>();
	private final int USER_NUMBER = 50;
	public  int userNum=0;
	private List<String> massages = new ArrayList<String>();
	public  int mass_num=0;
	private Map<String, String> color = new HashMap<String, String>();
	
	public boolean addUser(String name){
		synchronized (users) {
			if(!this.hasUser(name)&&!isFull()){
				users.add(name);
				String color = createColor();
				this.color.put(name, color);
				userNum++;
				return true;
			}
		}
		return false;
	}
	
	public boolean isFull(){
		if(userNum<this.USER_NUMBER){
			return false;
		}
		return true;
	}
	 
	public boolean hasUser(String name){
		for(String na:users){
			if(name.equalsIgnoreCase(na)){
				return true;
			}
		}
		return false;
	}
	 
	public String getUsers(){
		StringBuffer user = new StringBuffer();
		int i=0;
		while(i<userNum){
			String name = this.users.get(i);
			String color = this.getColor(name);
			String userMass = "<font color='"+color+"'>"+name+"</font><br>";
			user.append(userMass);
			i++;
		}
		return user.toString();
	}
	 
	public String getMassage(int i){
		StringBuffer massage = new StringBuffer();
		while(i<mass_num && i>=0){
			massage.append(massages.get(i));
			i++;
		}
		return massage.toString();
	}
	
	 
	public void setMassage(String massage){
		synchronized (massages) {
			massages.add(massage);
			mass_num++;
		}
	}
	 
	public void exit(String name){
		if(users.remove(name)){
			userNum--;
			if(userNum==0){
				mass_num=0;
				massages.clear();
				users.clear();
				color.clear();
			}else{
				color.remove(name);
			}
		};
	}
	 
	public String getColor(String username) {
		return color.get(username);
	}
	 
	private String createColor(){
		StringBuffer color=new StringBuffer("#");
		Random random = new Random();
		for(int i=0;i<3;i++){
			int a = random.nextInt(256);
			color.append(Integer.toHexString(a));
		}
		return color.toString();
	}
	
}
