package com.ttszw.actions;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ttszw.action.Action;
import com.ttszw.action.ChatMassage;
import com.ttszw.action.ChatRoom;

public class SendMassageAction implements Action {

	public Object execute(HttpServletRequest req, HttpServletResponse res) {
		
		if(req.getSession().getAttribute("username") == null){
			//登录超时
			return "sampleJsp/helloWord.jsp";
		}
		
		String content = req.getParameter("content").trim();
		int chatRoomId =  Integer.parseInt(req.getParameter("chatRoomId"));;
		if(!ChatRoom.instance().chatRoomMap.containsKey(chatRoomId))
			ChatRoom.instance().chatRoomMap.put(chatRoomId, new ChatMassage());
		ChatMassage cm = ChatRoom.instance().chatRoomMap.get(chatRoomId);
		String name = req.getSession().getAttribute("username").toString();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		String date = dateFormat.format(new Date());
		System.out.println(content);
		String color = cm.getColor(name);
		String nameAdd = null;
		if(cm.getPublisherSet().contains(name))
			nameAdd = "(任务发布方)";
		else
			nameAdd = "(任务执行方)";
		String mass = "<font color='"+ color +"'>"+ name + nameAdd +"  "+date+"</font><br><span style='color:#6495ED;'>&nbsp&nbsp"+content+"</span><br>";
		cm.setMassage(mass);
		return "loadData.do";
	}
	
	private String filer(String source){
		StringBuffer result = new StringBuffer(source);
		Pattern p = Pattern.compile("[^0-9|^a-z|^A-Z|^\u4e00-\u9fa5]");
		Matcher m = p.matcher(source);
        boolean f=true;
        
        List<Integer> a = new ArrayList<Integer>();
        while (f) {
           f = m.find();
           if (f) {
               int con = m.start();
               a.add(con);
           }
        }
        int n=0;   
        for(int i:a){
        	result.insert(i+n, "\\\\");
        	n++;
        }
        return result.toString();
	}
}
