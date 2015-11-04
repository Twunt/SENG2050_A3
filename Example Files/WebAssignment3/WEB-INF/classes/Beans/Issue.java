package Beans;

import javax.sql.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
public class Issue{
	
	private int issueID;
	private String submitterID, staffID, stateID, body, title, system;
	private String issueType, subType, location, softwareName, softwareVersion, OS;
	private boolean restarted, cableConnected, similarIssues;
	private String hardwareType, compType, compName, emailAddress, browser, accountType;
	private Calendar timeOccurred;
	private List<Comment> Comments;
	public Issue(){
		timeOccurred=Calendar.getInstance();
	}
	public int getIssueID() {
		return issueID;
	}
	public void setIssueID(int issueID) {
		this.issueID = issueID;
	}
	public String getSubmitterID() {
		return submitterID;
	}
	public void setSubmitterID(String submitterID) {
		this.submitterID = submitterID;
	}

	public String getStaffID() {
		return staffID;
	}
	public void setStaffID(String staffID) {
		this.staffID = staffID;
	}
	public String getStateID() {
		return stateID;
	}
	public void setStateID(String stateID) {
		this.stateID = stateID;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
	}
	public String getIssueType() {
		return issueType;
	}
	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}
	public String getSubType() {
		return subType;
	}
	public void setSubType(String subType) {
		this.subType = subType;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSoftwareName() {
		return softwareName;
	}
	public void setSoftwareName(String softwareName) {
		this.softwareName = softwareName;
	}
	public String getSoftwareVersion() {
		return softwareVersion;
	}
	public void setSoftwareVersion(String softwareVersion) {
		this.softwareVersion = softwareVersion;
	}
	public String getOS() {
		return OS;
	}
	public void setOS(String oS) {
		OS = oS;
	}
	public boolean isRestarted() {
		return restarted;
	}
	public void setRestarted(boolean restarted) {
		this.restarted = restarted;
	}
	public boolean isCableConnected() {
		return cableConnected;
	}
	public void setCableConnected(boolean cableConnected) {
		this.cableConnected = cableConnected;
	}
	public boolean isSimilarIssues() {
		return similarIssues;
	}
	public void setSimilarIssues(boolean similarIssues) {
		this.similarIssues = similarIssues;
	}
	public String getHardwareType() {
		return hardwareType;
	}
	public void setHardwareType(String hardwareType) {
		this.hardwareType = hardwareType;
	}
	public String getCompType() {
		return compType;
	}
	public void setCompType(String compType) {
		this.compType = compType;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getTimeOccurred() {
		String time = new SimpleDateFormat("hh:mm:ssa dd/MM/YY").format(timeOccurred.getTime());
		return time;
	}
	public void setTimeOccurred(Timestamp timeOccurred) {
		this.timeOccurred.setTimeInMillis(timeOccurred.getTime());
	}
	public void setComments()throws SQLException{
		Comments = new LinkedList<>();
		String query = "SELECT u.userName,c.commentBody,c.timePosted FROM userComment c INNER JOIN irsUser u ON u.userID=c.userID AND c.issueID=?";
		try(Connection connection = Config.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);) {
        	statement.setInt(1, getIssueID());
        	try(ResultSet rs = statement.executeQuery();){
		while (rs.next()){
			Comment c = new Comment();
			c.setUserName(rs.getString(1));
			c.setBody(rs.getString(2));
			c.setTime(rs.getString(3));
			Comments.add(c);
		} 
    }
}
}
	public List<Comment> getComments(){
		return Comments;
	}
}
