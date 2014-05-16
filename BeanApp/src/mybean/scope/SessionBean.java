package mybean.scope;

import org.omg.CORBA.TIMEOUT;

public class SessionBean {
	private long startTime; //리셋버튼 눌른 후 지난 시간
	private long instTime; //총 접속시간
	private long lastAccessTime; //마지막으로 작업한 후 지나간 시간
	
	public SessionBean(){
		startTime = System.currentTimeMillis();
		instTime = startTime;
		lastAccessTime = startTime;
	}
	
	public long getElapsedTime(){//타이머가 리셋 후 경과된 시간을 알려주는 메서드
		lastAccessTime = System.currentTimeMillis();
		return(lastAccessTime - startTime)/1000;
		
	}

	public void setRestart(boolean b){//타이머를 리셋
		startTime = System.currentTimeMillis();
		lastAccessTime = System.currentTimeMillis();
	}

	public long getElapsedTimeAfterInst(){//총 경과 시간
		lastAccessTime = System.currentTimeMillis();
		return (lastAccessTime-instTime)/1000;
	}

	public long getElapsedTimeAfterLastAccess(){//bean의 property를 마지막으로 접근한 뒤에 경과된 시간
		long current = System.currentTimeMillis();
		long elapsed=(current-lastAccessTime)/1000;
		lastAccessTime = System.currentTimeMillis();
		return elapsed;
	}

}
/* 
name                     r/w         datatype      desc
=================================================================================
elapsedTime                  r         long         경과 시간
restart                     w         boolean         타이머 리셋
elapsedTimeAfterInst         r         long         객체 생성 후 경과시간
elapsedTimeAfterLastAccess      r         long         마지막 접근 후 경과시간
*/
