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
		String uri  = request.getRequestURI();//전체경로
		/*/BoardApp/board.app
		  /BoardApp/admin.app
		  /BoardApp/comunity.app*/
		String ctx=request.getContextPath(); //프로젝트명
		//인데 이 중에서 뒷부분의 XX.app만 필요하므로
		uri=uri.substring(ctx.length());
		
		System.out.println(uri);
		
		String nextPage = "";
		
		if(uri.equals("/member.app")){
			//회원가입 처리 컨트롤러 지정
		}else if(uri.equals("/admin.app")){
			//관리자 관련 처리 컨트롤러 지정
		}else if(uri.equals("/shop.app")){
			//쇼핑몰 처리 컨트롤러 지정
		}else if(uri.equals("/board.app")){
			nextPage = "/v5_mvc/List.jsp";
		}else{
			// 잘못된 요청에 대한 방어코드
		}
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
   }

}
