package Beans;


public class Comment{
	private String commentBody;
	private String commentTime;
	private String commentAuth;
	private int commentID;
	public Comment(){

	}
	public void setBody(String b){
		commentBody = b;
	}
	public void setTime(Timestamp t){
		commentTime = t;
	}
	public void setAuth(String a){
		commentAuth=a;
	}
}