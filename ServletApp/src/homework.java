import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class homework
 */
@WebServlet("/wa")
public class homework extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String id = req.getParameter("id");
		String password = req.getParameter("pw");
		String gender = req.getParameter("gender");
		String hobby[] = req.getParameterValues("hobby");
		String job = req.getParameter("job"); 
		String message = req.getParameter("content");
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("아이디 :" + id +"<br/>");
		out.println("패스워드 :" + password+"<br/>");
		out.println("성별 :" + gender+"<br/>");
		out.println("취미 :");
		if(hobby != null){
			for(String h : hobby){
				out.println(h +",\t");
		}}
		out.println("직업 :" + job +"<br/>");
		out.println("하고싶은 말 :" + message +"<br/>");
		
		out.println("<input type='button' value='다시작성하기' onclick='history.back()'/>");
		out.println("<br/><br/>");
		
		Enumeration en = req.getParameterNames(); //getParameterNames 로 앞에코드를 간결하게 함(덩어리로 받음??)
		while(en.hasMoreElements()){

			String varName = (String)en.nextElement();
			if(varName != null){
				String[] values = req.getParameterValues(varName);
			
				for (String s : values){
					out.println("<li>"+varName+":" + s + "</li><br/>");
				}
			}
			

		}
		out.println("<input type='button' value='다시작성하기' onclick='history.back()'/>");
		out.println("</body></html>");
		out.close();
	}

}
