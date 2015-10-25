package com.ttszw.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.ttszw.actions.ExitAction;
import com.ttszw.actions.LoadDataAction;
import com.ttszw.actions.LoadUserAction;
import com.ttszw.actions.LoginAction;
import com.ttszw.actions.SendMassageAction;

public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = -3547709943224681062L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String currentURL = req.getServletPath();
		if(req.getParameter("chatRoomId") == null) return;
		req.setCharacterEncoding("utf-8");
		String path = currentURL.substring(0, currentURL.indexOf("."));
		Action action = null;
		if("/login".equalsIgnoreCase(path)){
			action = new LoginAction();
		}else if("/loadData".equalsIgnoreCase(path)){
			action = new LoadDataAction();
		}else if("/sendMassage".equalsIgnoreCase(path)){
			action = new SendMassageAction();
		}else if("/loadUser".equalsIgnoreCase(path)){
			action = new LoadUserAction();
		}else if("/exit".equalsIgnoreCase(path)){
			action = new ExitAction();
		}
		Object result = action.execute(req, res);
		
		if(result instanceof String){
			req.getRequestDispatcher(result.toString()).forward(req, res);
		}else if(result instanceof JSONObject){
			res.setCharacterEncoding("utf-8");
			res.getWriter().print((JSONObject)result);
		}
		
	}
	
}
