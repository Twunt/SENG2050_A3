package Beans;


public class MaintMessage{
	private int maintenanceID;
	private String message;
	private String startTime;
	private String endTime;
	public MaintMessage(){

	}

	public void setMessage(String m){
		message = m;
	}

	public void setStartTime(String s){
		startTime = s;
	}

	public void setEndTime(String e){
		endTime=e;
	}

	public void setMaintenanceID(int i){
		maintenanceID = i;
	}

	public int getMaintenanceID(){
		return maintenanceID;
	}

	public String getMessage(){
		return message;
	}

	public String getStartTime(){
		return startTime;
	}

	public String getEndTime(){
		return endTime;
	}

}