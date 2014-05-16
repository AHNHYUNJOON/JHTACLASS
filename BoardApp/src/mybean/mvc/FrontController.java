package mybean.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.app")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri  = request.getRequestURI();//��ü���
		/*/BoardApp/board.app
		  /BoardApp/admin.app
		  /BoardApp/comunity.app*/
		String ctx=request.getContextPath(); //������Ʈ��
		//�ε� �� �߿��� �޺κ��� XX.app�� �ʿ��ϹǷ�
		uri=uri.substring(ctx.length());
		
		System.out.println(uri);
		
		String nextPage = "";
		
		if(uri.equals("/member.app")){
			//ȸ������ ó�� ��Ʈ�ѷ� ����
		}else if(uri.equals("/admin.app")){
			//������ ���� ó�� ��Ʈ�ѷ� ����
		}else if(uri.equals("/shop.app")){
			//���θ� ó�� ��Ʈ�ѷ� ����
		}else if(uri.equals("/board.app")){
			nextPage = "/v5_mvc/List.jsp";
		}else{
			// �߸��� ��û�� ���� ����ڵ�
		}
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
   }

}
