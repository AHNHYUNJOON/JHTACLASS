package mybean.upload.basic;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//basic_proc.jsp 의 코드를 여기로 옮김
public class BasicBean {
		private MultipartRequest multi; 
		//임포트가 안되면 이클립스에서는 빌드패스만 걸면 됨. 원래는 classes안의 폴더에 cos.jar를 압축을 풀어서 넣어야 함. 
		private String path;  //실제경로
		private int max; //업로드 최대크기
		private String encType;//인코딩 문자
	      //----------------이 위로는 세터메서드로 전달 받을 것임(MultipartRequest의 인자값을 전달받을 변수들)
		
		/*public void setPath(String path) {//여기 path에는 가상경로가 전달되어 실제경로로 바꿔줘야 함
			this.path = path;
		}*/
		public void setPath(HttpServletRequest servlet, String path) {//여기 path에는 가상경로가 전달되어 실제경로로 바꿔줘야 함
			this.path = servlet.getServletContext().getRealPath(path);
		}
		
		public void setMax(int max) {
			this.max = max;
		}
		
		public void setEncType(String encType) {
			this.encType = encType;
		}
		public void setMulti(HttpServletRequest req) {
			try {
				multi= new MultipartRequest(req, path, max, encType, new DefaultFileRenamePolicy());
			} catch (IOException err) {
				System.out.println("setMulti :" +err);
			}
		}
        //-------------------------------------------------------------
		//여기서부터는 게터메서드로 받음
		private String user;
		private String title;
		private String upFile;
		
		public String getUser() {
			return multi.getParameter("user");
		}

		public String getTitle() {
			return multi.getParameter("title");
		}
		public String getUpFile() {
			String result="";
			Enumeration enumer = multi.getFileNames();
			while(enumer.hasMoreElements()){
				String name = (String)enumer.nextElement();
				result = "실제 파일명"+ multi.getOriginalFileName(name)+"<br/>";
				result +="저장될 파일명"+ multi.getFilesystemName(name)+"<br/>";
				result +="파일 타입" + multi.getContentType(name)+"<br/>";
				
				File f = multi.getFile(name);
				result +="파일의 크기:" + f.length() +"byte <br/>";
				result += "파일경로:" + f.getPath() ;
			}
			return result;
		}
}
