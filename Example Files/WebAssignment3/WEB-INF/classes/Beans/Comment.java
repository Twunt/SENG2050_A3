package Beans;


public class Comment{
	private String commentBody;
	private String commentTime;
	private String commentAuth;
	private int commentID;
	private String userName;
	private int issueID;
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
<<<<<<< HEAD
	public void setCommentID(int c){
		commentID = c;
	}

	public void setUserName(int u){
		userName = u;
	}

	public void setUserID(int i){
		issueID = i;
	}

	public String getBody(){
		return commentBody;
	}
	public Timestamp getTime(){
		return commentTime;
	}
	public String getAuth(){
		return commentAuth;
	}
	public int getCommentID(){
		return commentID;
	}

	public int getUserID(){
		return userName;
	}

	public int getUserID(){
		return issueID;
	}
=======
>>>>>>> origin/master
}