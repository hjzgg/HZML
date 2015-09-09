package com.hzml.serve;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MailResponse.servlet")
public class MailResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MailResponse() {
        super();
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) {
    	try{
    		response.setCharacterEncoding("utf-8");
	    	String pwd = "hjzgg5211314";//��������������
 	    	String mailfrom = request.getParameter("emailFrom"); //���׵�����
 	    	String wangyiFrom = mailfrom.substring(0, mailfrom.indexOf('@'));//����������û���
	    	String tu = "163.com"; //������ĺ�׺����
	    	String tto= request.getParameter("emailTo"); //�����ʼ�������
	    	String ttitle= "����������̹���Ա�ظ���";
	    	String tcontent = request.getParameter("messageTo");
	
	    	Properties props=new Properties();
	
	    	props.put("mail.smtp.host","smtp."+tu);//����SMTP��������ַ�˿�
	
	    	props.put("mail.smtp.auth","true");//��������ͨ����֤
	
	    	Session s=Session.getInstance(props);
	
	    	s.setDebug(true);
	
	    	MimeMessage message=new MimeMessage(s);
	
	    	//����Ϣ�������÷�����/�ռ���/����/����ʱ��
	
	    	InternetAddress from=new InternetAddress(mailfrom); //�����˵�qq����
	
	    	message.setFrom(from);
	
	    	InternetAddress to=new InternetAddress(tto);//�ռ��˵�����
	
	    	message.setRecipient(Message.RecipientType.TO,to);
	
	    	message.setSubject(ttitle);
	
	    	message.setSentDate(new Date());
	
	    	//����Ϣ������������
	
	    	BodyPart mdp=new MimeBodyPart();//�½�һ������ż����ݵ�BodyPart����
	
	    	mdp.setContent(tcontent,"text/html;charset=gb2312");//��BodyPart�����������ݺ͸�ʽ/���뷽ʽ
	
	    	Multipart mm=new MimeMultipart();//�½�һ��MimeMultipart�����������BodyPart��
	
	    	//��(��ʵ�Ͽ��Դ�Ŷ��)
	
	    	mm.addBodyPart(mdp);//��BodyPart���뵽MimeMultipart������(���Լ�����BodyPart)
	
	    	message.setContent(mm);//��mm��Ϊ��Ϣ���������
	
	    	message.saveChanges();
	
	    	Transport transport=s.getTransport("smtp");
	
	    	transport.connect("smtp."+tu, wangyiFrom, pwd); //�����wangyiFromΪ�����������˺�
	
	    	transport.sendMessage(message,message.getAllRecipients());
	
	    	transport.close();
	    	PrintWriter out = response.getWriter(); 
	    	out.println("<script type=\"text/javascript\" src=\"js/my.js\"></script>");
	    	out.println("<body><center><h1>SUCESS TO SEND!</h1></center><script type=\"text/javascript\"> alert(\"���ͳɹ�!\"); </script></body>");
    	}catch(Exception e){
    		e.printStackTrace();
	    }
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

}
