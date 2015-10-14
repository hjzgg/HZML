package com.hzml.serve;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PreviewAndDownloadFiel
 */
@WebServlet("/DownloadFile.servlet")
public class DownloadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFile() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	 ServletContext context = getServletContext();  
    	 String fileDir = context.getRealPath("/") + "/hzmlFile/"; 
    	 String filename = (String)request.getSession().getAttribute("fileName");   
    	 System.out.println(fileDir + filename);
         FileInputStream in = null;   
         ServletOutputStream out = null;   
         try {  
             response.setContentType("application/x-msdownload");   
             response.setHeader("Content-Disposition", "attachment; filename=" + filename);   
             in = new FileInputStream(fileDir + filename);   
             out = response.getOutputStream();  
             out.flush();  
             int aRead = 0;  
             while ((aRead = in.read()) != -1 & in != null) {  
                 out.write(aRead);  
             }  
             out.flush();  
               
         } catch (Throwable e) {  
             e.printStackTrace();  
         } finally {  
             try {  
                 in.close();  
                 out.close();  
             } catch (Throwable e) {  
                 e.printStackTrace();  
             }  
         }  
   
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

}
