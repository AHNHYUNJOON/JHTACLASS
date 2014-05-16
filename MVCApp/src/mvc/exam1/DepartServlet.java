package mvc.exam1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/department")
public class DepartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("depart");
		
		ArrayList advice = new DepartAdvice().getAdvice(param); //DepartAdvice.java의 객체를 생성해서 그 안에서 getAdvice 메서드에 param을 전달받아 갖고옴  
		
		request.setAttribute("advice", advice); //attribute는 Context관련 공통 메서드, 요청에 결과를 던져줌
		//RequestDispatcher view = request.getRequestDispatcher("/exam1/result.jsp"); //결과를 받아만 둠
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/result.jsp"); //결과를 받아만 둠//다른 폴더로 result.jsp(결과를 보여줄 viw페이지)를 옮겼을 경우
		view.forward(request, response);
   }

}
