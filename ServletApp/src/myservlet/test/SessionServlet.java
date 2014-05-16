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
		session.setAttribute("id", irum); //세션에 값을 저장하여 세션이 없어지지 않는 한 어디서든 쓸 수 있는 일종의 전역변수 화 된다.
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("세션에 당신의 이름이 저장되었습니다. <br/>");
		out.println("당신의 이름은" + session.getAttribute("id")+"<br/>");
		
		Date date= new Date(session.getCreationTime());
		out.println("당신의 접속시간은:" +date+"<br/>");
		
		date= new Date(session.getLastAccessedTime());
		out.println("당신의 마지막 작업 시간은:" +date+"<br/>");
		
		out.println("당신의 세션ID:" +session.getId()+"<br/>");
		out.println("당신의 세션 만료시간은:" +session.getMaxInactiveInterval()+"<br/>");
		session.setMaxInactiveInterval(60*60*10);
		out.println("당신의 세션 만료시간은:" +session.getMaxInactiveInterval()+"<br/>");
		
		if(session.isNew()){
			out.println("지금 처음 접속하셨군요");
		}
		else{
			out.println("연결한지 얼마 안된 사용자 입니다.");
		}
		out.close();
	}

}
