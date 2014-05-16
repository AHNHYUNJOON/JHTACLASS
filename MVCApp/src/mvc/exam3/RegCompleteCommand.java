package mvc.exam3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegCompleteCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		//DB연동 데이터 저장
		
		HttpSession session = req.getSession(); //HttpServletRequest 을 생성했기에 세션을 얻을 수 있음 
		session.setAttribute("currentState", "COMPLETE");  //세션을 얻었을 때 이 값이 들어있으면 이미 가입 되었다는 것을 알 수 있음
		return "/exam3/regComplete.jsp";
	}

}
