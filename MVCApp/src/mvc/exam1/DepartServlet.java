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
		
		ArrayList advice = new DepartAdvice().getAdvice(param); //DepartAdvice.java�� ��ü�� �����ؼ� �� �ȿ��� getAdvice �޼��忡 param�� ���޹޾� �����  
		
		request.setAttribute("advice", advice); //attribute�� Context���� ���� �޼���, ��û�� ����� ������
		//RequestDispatcher view = request.getRequestDispatcher("/exam1/result.jsp"); //����� �޾Ƹ� ��
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/result.jsp"); //����� �޾Ƹ� ��//�ٸ� ������ result.jsp(����� ������ viw������)�� �Ű��� ���
		view.forward(request, response);
   }

}
