package com.hzml.online_payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentResultServlet
 */
@WebServlet("/onlinePaymentJsp/PaymentResultServlet.servlet")
public class PaymentResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentResultServlet() {
        super();
        // TODO Auto-generated constructor stub
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
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GBK");  
        
        //�����̻����̼�ID  
        String p1_MerId = "10000432521";  
        //�����̻����̼���Կ  
        String keyValue = "8UPp0KE8sq73zVP370vko7C39403rtK1YwX40Td6irH216036H27Eb12792t";  
          
        String r0_Cmd = request.getParameter("r0_Cmd");      //ҵ������  
        String r1_Code = request.getParameter("r1_Code");    //�ۿ�����1:�ۿ�ɹ�  
        String r2_TrxId = request.getParameter("r2_TrxId");  //�ױ����׶�����  
        String r3_Amt = request.getParameter("r3_Amt");      //�ۿ�����׽������ױ�����ϵͳ��ʵ�ʿۿ���ظ��̻�  
        String r4_Cur = request.getParameter("r4_Cur");      //���ױ��֡������ΪCNY  
        String r5_Pid = request.getParameter("r5_Pid");      //��ƷID  
        String r6_Order = request.getParameter("r6_Order");  //�̻�������  
        String r7_Uid = request.getParameter("r7_Uid");      //�ױ���ԱID  
        String r8_MP = request.getParameter("r8_MP");        //�̻���չ��Ϣ����������д1K���ַ��������׷���ʱ��ԭ������  
        String r9_BType = request.getParameter("r9_BType");  //���׽��֪ͨ���͡�1:���׳ɹ��ص�(������ض���)��2:���׳ɹ�����֪ͨ(��������Ե�ͨѶ)  
        String hmac = request.getParameter("hmac");          //MD5����ǩ��  
          
        boolean result = PaymentUtil.verifyCallback(  
                hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur,  
                r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);  
          
        if (result) {  
            if ("1".equals(r1_Code)) {  
                StringBuffer message = new StringBuffer();  
                message.append("������Ϊ��" + r6_Order + " �Ķ���֧���ɹ���"); //��ʱ���ݿ��ж���֧��״̬ӦΪ��֧�����������׳���"����ˢ�㿨"��BUG  
                message.append("�û�֧����" + r3_Amt + "Ԫ��<br/>");  
                message.append("���׽��֪ͨ���ͣ�");  
                if ("1".equals(r9_BType)) {  
                    message.append("������ض���<br/>");  
                } else if ("2".equals(r9_BType)) {  
                    message.append("�ױ�֧�����غ�̨����֪ͨ��<br/>");  
                }  
                message.append("�ױ�����ϵͳ�еĶ�����Ϊ��" + r2_TrxId);  
                request.setAttribute("message", message);  
            } else {  
                request.setAttribute("message", "�û�֧��ʧ��");  
            }  
        } else {  
            request.setAttribute("message", "������Դ���Ϸ�");  
        }  
        request.getRequestDispatcher("onlinePaymentJsp/paymentResult.jsp").forward(request, response);  
	}
}
