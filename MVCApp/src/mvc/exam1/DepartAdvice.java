package mvc.exam1;

import java.util.ArrayList;

public class DepartAdvice {
	public ArrayList getAdvice(String param){
		ArrayList advice = new ArrayList();
		if(param.equals("kor")){
			advice.add("1.국어를 잘해야됨");
			advice.add("2.국어를 좋아해야함");
		}
		else if(param.equals("eng")){
			advice.add("1.영어를 잘해야됨");
			advice.add("2.영어를 좋아해야함");
		}
		else if(param.equals("com")){
			advice.add("1.컴퓨터를 잘해야됨");
			advice.add("2.컴퓨터를 좋아해야함");
		}
		else if(param.equals("bus")){
			advice.add("1.경영을 잘해야됨");
			advice.add("2.경영을 좋아해야함");
		}
		return advice;
	}
}
