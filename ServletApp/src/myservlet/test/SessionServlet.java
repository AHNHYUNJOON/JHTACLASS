package myservlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ss.action")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("euc-kr");
		HttpSession session = req.getSession();
		String irum = req.getParameter("irum");
		session.setAttribute("id", irum); //���ǿ� ���� �����Ͽ� ������ �������� �ʴ� �� ��𼭵� �� �� �ִ� ������ �������� ȭ �ȴ�.
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("���ǿ� ����� �̸��� ����Ǿ����ϴ�. <br/>");
		out.println("����� �̸���" + session.getAttribute("id")+"<br/>");
		
		Date date= new Date(session.getCreationTime());
		out.println("����� ���ӽð���:" +date+"<br/>");
		
		date= new Date(session.getLastAccessedTime());
		out.println("����� ������ �۾� �ð���:" +date+"<br/>");
		
		out.println("����� ����ID:" +session.getId()+"<br/>");
		out.println("����� ���� ����ð���:" +session.getMaxInactiveInterval()+"<br/>");
		session.setMaxInactiveInterval(60*60*10);
		out.println("����� ���� ����ð���:" +session.getMaxInactiveInterval()+"<br/>");
		
		if(session.isNew()){
			out.println("���� ó�� �����ϼ̱���");
		}
		else{
			out.println("�������� �� �ȵ� ����� �Դϴ�.");
		}
		out.close();
	}

}