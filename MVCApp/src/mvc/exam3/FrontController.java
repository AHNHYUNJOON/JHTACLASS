package mvc.exam3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/reg")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		String cmd = request.getParameter("command");
		String nextPage = "";
		if(cmd.equals("MAIN")){
			nextPage="/exam3/index.jsp"; //요청의 종류에 따라 나눠놓은 조건문 안의 내용을 객체로 만드는 것이 커맨드 패턴
		}else if(cmd.equals("REGFORM")){
			nextPage="/exam3/regForm.html";
		}else if(cmd.equals("REGCONFIRM")){
			//입력갑 확인
			//입력값이 잘못 되었을 경우 해당 에어 페이지로 이동
			nextPage="/exam3/regConfirm.jsp";
		}else if(cmd.equals("REGCOMPLETE")){
			//DB연동 데이터 저장
			nextPage="/exam3/regComplete.jsp";
		}else if(cmd.equals("ZIPSEARCH")){
			nextPage="/exam3/zipSearch.jsp";
		}	
		}else {
			//비정상적 요청에 대해 예외처리
			
		}
		
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
		*/
		/*
		String cmd = request.getParameter("command");
		String nextPage = "";
		
		ICommand iCmd = null;
		//MainCommand mainCommand = null;
		//RegFormCommand regCommand = null;
		
		if(cmd.equals("MAIN")){
			iCmd =  new MainCommand();
			//mainCommand = new MainCommand();
			//nextPage = (String)mainCommand.processCommand(request, response);
		}
		else if(cmd.equals("REGFORM")){
			iCmd =  new RegFormCommand();
			//regCommand = new RegFormCommand();
			//nextPage = (String)mainCommand.processCommand(request, response);
		}
		else if(cmd.equals("REGCONFIRM")){
			iCmd =  new RegConfirmCommand();
		}
		else if(cmd.equals("REGCOMPLETE")){
			iCmd =  new RegCompleteCommand();
		}
		else if(cmd.equals("ZIPSEARCH")){
			iCmd =  new ZipCommand();
		}
		else {
			//비정상적 요청에 대해 예외처리
			
		}
		
		nextPage = (String)iCmd.processCommand(request, response); //매개변수 전달
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
		*/
		
		/*
		String cmd = request.getParameter("command");
		String nextPage = "";
		
		CommandFactory factory = CommandFactory.getInstance();
		ICommand iCmd = factory.createCommand(cmd);
		
		nextPage = (String)iCmd.processCommand(request, response); //매개변수 전달
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
		*/
		request.setCharacterEncoding("euc-kr");
		String cmd = request.getParameter("command");
		String nextPage = "";
		HttpSession session = request.getSession();//추가사항
		String current = (String)session.getAttribute("currentState");//추가사항

		if(current != null && current.equals("COMPLETE")){
			nextPage = "/exam3/alreadyRegister.jsp";
		}else{
		CommandFactory factory = CommandFactory.getInstance();
		ICommand iCmd = factory.createCommand(cmd);	
		nextPage = (String)iCmd.processCommand(request, response); //매개변수 전달
		}
		
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
		
		
	}
}
