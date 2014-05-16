package mybean.upload.multi;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MultiBean {
	private MultipartRequest multi; 
	//����Ʈ�� �ȵǸ� ��Ŭ���������� �����н��� �ɸ� ��. ������ classes���� ������ cos.jar�� ������ Ǯ� �־�� ��. 
	private String path;  //�������
	private int max; //���ε� �ִ�ũ��
	private String encType;//���ڵ� ����
      //----------------�� ���δ� ���͸޼���� ���� ���� ����(MultipartRequest�� ���ڰ��� ���޹��� ������)
	
	/*public void setPath(String path) {//���� path���� �����ΰ� ���޵Ǿ� ������η� �ٲ���� ��
		this.path = path;
	}*/
	public void setPath(HttpServletRequest servlet, String path) {//���� path���� �����ΰ� ���޵Ǿ� ������η� �ٲ���� ��
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
	private String user;
	private String title;
	private String note;
	public String getUser() {
		return multi.getParameter("user");
	}

	public String getTitle() {
		return multi.getParameter("title");
	}
	public String getNote() {
		return multi.getParameter("note");
	}
	
}
