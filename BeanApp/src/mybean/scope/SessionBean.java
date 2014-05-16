package mybean.scope;

import org.omg.CORBA.TIMEOUT;

public class SessionBean {
	private long startTime; //���¹�ư ���� �� ���� �ð�
	private long instTime; //�� ���ӽð�
	private long lastAccessTime; //���������� �۾��� �� ������ �ð�
	
	public SessionBean(){
		startTime = System.currentTimeMillis();
		instTime = startTime;
		lastAccessTime = startTime;
	}
	
	public long getElapsedTime(){//Ÿ�̸Ӱ� ���� �� ����� �ð��� �˷��ִ� �޼���
		lastAccessTime = System.currentTimeMillis();
		return(lastAccessTime - startTime)/1000;
		
	}

	public void setRestart(boolean b){//Ÿ�̸Ӹ� ����
		startTime = System.currentTimeMillis();
		lastAccessTime = System.currentTimeMillis();
	}

	public long getElapsedTimeAfterInst(){//�� ��� �ð�
		lastAccessTime = System.currentTimeMillis();
		return (lastAccessTime-instTime)/1000;
	}

	public long getElapsedTimeAfterLastAccess(){//bean�� property�� ���������� ������ �ڿ� ����� �ð�
		long current = System.currentTimeMillis();
		long elapsed=(current-lastAccessTime)/1000;
		lastAccessTime = System.currentTimeMillis();
		return elapsed;
	}

}
/* 
name                     r/w         datatype      desc
=================================================================================
elapsedTime                  r         long         ��� �ð�
restart                     w         boolean         Ÿ�̸� ����
elapsedTimeAfterInst         r         long         ��ü ���� �� ����ð�
elapsedTimeAfterLastAccess      r         long         ������ ���� �� ����ð�
*/
