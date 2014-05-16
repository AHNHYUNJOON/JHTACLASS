package mvc.exam2;

import java.io.IOException;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cart")

public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request, response);
				
    	}

		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("euc-kr");
			
			String cmd = req.getParameter("command");// hidden으로 bookShop.jsp 와ㅓ cart.jsp에서 전송받은 요청
			HttpSession session = req.getSession();
			
			Vector bookList = (Vector)session.getAttribute("cart");	//리퀘스트에 하면 계속 null값 발생,(요청마다 접속이 끊김)=>session으로 해결	
			if(cmd.equals("CHK")){
				RequestDispatcher view = 
						req.getRequestDispatcher("/exam2/checkout.jsp");
				view.forward(req, resp);
			}
			else{
				if(cmd.equals("ADD")){
					if(bookList == null){
						bookList = new Vector();
					}


					bookList.add(getBook(req));
				}
				else if(cmd.equals("DEL")){
					int idx = Integer.parseInt(req.getParameter("idx"));
					bookList.remove(idx);
				}


				session.setAttribute("cart", bookList);

			RequestDispatcher view = req.getRequestDispatcher("/exam2/bookShop.jsp");
			//요청할 정보에 /exam2/cart.jsp 에게 처리하도록 결정해서 그 정보를 view 에 저장
		    view.forward(req,resp);//시킴
		 }
		}
		
		public BookDto getBook(HttpServletRequest req){//클라이언트가 보내온 데이터를 네개로 쪼개서 DTO에 담을 것임(bookList.add(여기))
			
			String book = req.getParameter("book");
			String qty = req.getParameter("quantity").trim();
			
			StringTokenizer token = new StringTokenizer(book, "/"); //책정보 분리
			String title = token.nextToken().trim();
			String author = token.nextToken().trim();
			String price = token.nextToken().trim();
			
			BookDto dto = new BookDto(); //BookDto의 메서드를 갖다 쓰기 위해  객체 생성
			dto.setAuthor(author); //BookDto 객체에서 setAuthor 메서드를 통해 받아와서 분리해둔 author 값을 세팅
			dto.setPrice(Integer.parseInt(price));
			dto.setQuantity(Integer.parseInt(qty));
			dto.setTitle(title);
			
			return dto; 
		}
}
