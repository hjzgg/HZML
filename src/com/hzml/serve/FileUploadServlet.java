package com.hzml.serve;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private String filePath;    // �ļ����Ŀ¼  
    private String tempPath;    // ��ʱ�ļ�Ŀ¼  
    // ��ʼ��  
    public void init() throws ServletException  
    {  
        super.init();  
        // �������ļ��л�ó�ʼ������  
        ServletContext context = getServletContext();  
        filePath = context.getRealPath("/") + "/hzmlFile";  
        tempPath = context.getRealPath("/") + "/hzmlFile";  
        System.out.println("�ļ����Ŀ¼����ʱ�ļ�Ŀ¼׼����� ...");  
    }  
    
    private void process(HttpServletRequest req, HttpServletResponse res)  
            throws IOException, ServletException{
    	 res.setContentType("text/plain;charset=gbk");  
         PrintWriter pw = res.getWriter();  
         try{  
             DiskFileItemFactory diskFactory = new DiskFileItemFactory();  
             // threshold ���ޡ��ٽ�ֵ����Ӳ�̻��� 1M  
             diskFactory.setSizeThreshold(4 * 1024);  
             // repository �����ң�����ʱ�ļ�Ŀ¼  
             diskFactory.setRepository(new File(tempPath));  
           
             ServletFileUpload upload = new ServletFileUpload(diskFactory);  
             // ���������ϴ�������ļ���С 4M  
             upload.setSizeMax(4 * 1024 * 1024);  
             // ����HTTP������Ϣͷ  
             List fileItems = upload.parseRequest(req);  
             Iterator iter = fileItems.iterator();  
             while(iter.hasNext())  
             {  
                 FileItem item = (FileItem)iter.next();  
                 if(item.isFormField())  
                 {  
                     System.out.println("��������� ...");  
                     processFormField(item, pw);  
                 }else{  
                     System.out.println("�����ϴ����ļ� ...");  
                     processUploadFile(item, pw);  
                 }  
             }// end while()  
  
             pw.close();  
         }catch(Exception e){  
             System.out.println("ʹ�� fileupload ��ʱ�����쳣 ...");  
             e.printStackTrace();  
         }// end try ... catch ...  
    }
      
    public void doPost(HttpServletRequest req, HttpServletResponse res)  
        throws IOException, ServletException  {  
    	process(req, res);
    }
 
    
 
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		process(req, res);
	}

	// ���������  
    private void processFormField(FileItem item, PrintWriter pw)  
        throws Exception  
    {  
        String name = item.getFieldName();  
        String value = item.getString();          
        pw.println(name + " : " + value + "\r\n");  
    }  
      
    // �����ϴ����ļ�  
    private void processUploadFile(FileItem item, PrintWriter pw)  
        throws Exception  
    {  
        // ��ʱ���ļ���������������·������ע��ӹ�һ��  
        String filename = item.getName();         
        System.out.println("�������ļ�����" + filename);  
        int index = filename.lastIndexOf("\\");  
        filename = filename.substring(index + 1, filename.length());  
 
        long fileSize = item.getSize();  
 
        if("".equals(filename) && fileSize == 0)  
        {             
            System.out.println("�ļ���Ϊ�� ...");  
            return;  
        }  
        pw.println(filePath);
        File uploadFile = new File(filePath + "/" + filename);  
        item.write(uploadFile);  
        pw.println(filename + " �ļ�������� ...");  
        pw.println("�ļ���СΪ ��" + fileSize + "\r\n");  
    }
}