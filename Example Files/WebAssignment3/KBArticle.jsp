<%@ page import="Beans.SubmitComment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Knowledge Base Article</title>
    <link rel="stylesheet" type="text/css" href="headerStyle.css">
</head>
<body>
<%@include file="header.jsp"%>

<div id="content">
    KBArticle.jsp
</div>
<div class="article">
	<br>
	<c:choose>
	    <c:when test="${issue.issueType == 'hardware'}">
	    	System Details: <c:out value="${issue.system}"/> 
	    	--<c:out value="${issue.OS}"/><br>
	    	Computer Type: <c:out value="${issue.compType}"/><br>
	    	Computer Name: <c:out value="${issue.compName}"/><br>
	    	Room Location: <c:out value="${issue.location}"/><br>
	        Time of submission: <c:out value="${issue.timeOccurred}"/>
	    </c:when>
	    <c:when test="${issue.issueType == 'software'}">
	    	System Details: <c:out value="${issue.system}"/> 
	    	--<c:out value="${issue.OS}"/><br>
	    	Computer Type: <c:out value="${issue.compType}"/><br>
	    	Computer Name: <c:out value="${issue.compName}"/><br>
	    	Room Location: <c:out value="${issue.location}"/><br>
	        Time of submission: <c:out value="${issue.timeOccurred}"/>
	    </c:when>
	    <c:when test="${issue.issueType == 'email'}">
	    	System Details: <c:out value="${issue.system}"/> 
	    	--<c:out value="${issue.OS}"/><br>
	    	Computer Type: <c:out value="${issue.compType}"/><br>
	    	Computer Name: <c:out value="${issue.compName}"/><br>
	    	Room Location: <c:out value="${issue.location}"/><br>
	        Time of submission: <c:out value="${issue.timeOccurred}"/>
	    </c:when>
	    <c:when test="${issue.issueType == 'account'}">
	    	System Details: <c:out value="${issue.system}"/> 
	    	--<c:out value="${issue.OS}"/><br>
	    	Computer Type: <c:out value="${issue.compType}"/><br>
	    	Computer Name: <c:out value="${issue.compName}"/><br>
	    	Room Location: <c:out value="${issue.location}"/><br>
	        Time of submission: <c:out value="${issue.timeOccurred}"/>
	    </c:when>
	    <c:when test="${issue.issueType == 'network'}">
	    	System Details: <c:out value="${issue.system}"/> 
	    	--<c:out value="${issue.OS}"/><br>
	    	Computer Type: <c:out value="${issue.compType}"/><br>
	    	Computer Name: <c:out value="${issue.compName}"/><br>
	    	Room Location: <c:out value="${issue.location}"/><br>
	        Time of submission: <c:out value="${issue.timeOccurred}"/>
	    </c:when>
    
	    <c:otherwise>
	    	System Details: <c:out value="${issue.system}"/> 
	    	--<c:out value="${issue.OS}"/><br>
	    	Computer Type: <c:out value="${issue.compType}"/><br>
	    	Computer Name: <c:out value="${issue.compName}"/><br>
	    	Room Location: <c:out value="${issue.location}"/><br>
	        Time of submission: <c:out value="${issue.timeOccurred}"/>
	    </c:otherwise>
	</c:choose>
	<br>
	<br>
</div>
	<c:forEach var="comment" items="${comments}">
		<br>
		<div class="comment">
			Comment by: <c:out value="${comment.userName}"/>
			<br>
			At time : <c:out value="${comment.time}"/>
			<br>
			<br>
			<c:out value="${comment.body}"/>
		</div>
	</c:forEach>
	<br>
	<br>
	<div class='submitComment'>
		<form method='get' action='SubmitComment'  >
			<div class='instructions'>
				Would you like to add a comment?<br>
				Just fill in the box below and hit submit.
			</div>
			<input type='hidden' name='currentPage' id='currentPage' value='KBArticle' >
			<input type='hidden' name='issueID' id='issueID' value=<c:out value="${issue.issueID}"/> >
			<input type='hidden' name='userID' id='userID' value=<c:out value="${user.ID}"/> />
			<textarea name='commentBody' id='commentBody' rows='5' cols='75'></textarea>
			<br>
			<br>
			<input class='defaltButton' type="submit" value="Submit"  />
		</form>
	</div>
</body>
</html>
