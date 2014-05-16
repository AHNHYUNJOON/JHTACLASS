package mybean.scope;

import javax.servlet.SessionTrackingMode;

public class ApplicationBean {
	private int count;
	
	public ApplicationBean(){
		count=0;
	}
	
	public void setNewVisit(String s){
		count++;
	}
	
	public int getVisitCount(){
		return count;
	}
	public void setRestart(String s){
		count=0;
	}
}
