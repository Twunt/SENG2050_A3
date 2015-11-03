package Beans;

import java.io.Serializable; 
public class User implements Serializable{
	private String UID;
	private String name;
	private String role;
	private boolean staff;
	public User(){
		UID="123456";
		name = "Jasper Beardly";
		role = "oldMan";
	}

	public void setID(String uid){
		UID=uid;
	}
	public void setName(String nm){
		name=nm;
	}
	public void setRole(String rle){
		role = rle;
	}
	public String getID(){
		return UID;
	}
	public String getName(){
		return name;
	}
	public String getRole(){
		return role;
	}
	public boolean isStaff(){
		if (role.equals("staff"))
			return true;
		return false;
	}
}