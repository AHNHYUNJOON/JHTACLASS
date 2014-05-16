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
		//DB���� ������ ����
		
		HttpSession session = req.getSession(); //HttpServletRequest �� �����߱⿡ ������ ���� �� ���� 
		session.setAttribute("currentState", "COMPLETE");  //������ ����� �� �� ���� ��������� �̹� ���� �Ǿ��ٴ� ���� �� �� ����
		return "/exam3/regComplete.jsp";
	}

}
