package mvc.exam1;

import java.util.ArrayList;

public class DepartAdvice {
	public ArrayList getAdvice(String param){
		ArrayList advice = new ArrayList();
		if(param.equals("kor")){
			advice.add("1.��� ���ؾߵ�");
			advice.add("2.��� �����ؾ���");
		}
		else if(param.equals("eng")){
			advice.add("1.��� ���ؾߵ�");
			advice.add("2.��� �����ؾ���");
		}
		else if(param.equals("com")){
			advice.add("1.��ǻ�͸� ���ؾߵ�");
			advice.add("2.��ǻ�͸� �����ؾ���");
		}
		else if(param.equals("bus")){
			advice.add("1.�濵�� ���ؾߵ�");
			advice.add("2.�濵�� �����ؾ���");
		}
		return advice;
	}
}
