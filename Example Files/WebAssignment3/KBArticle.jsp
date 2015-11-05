
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
<div class="article">
    <h1>Resolve Issue:  <c:out value="${issue.title}"/></h1>
    
    Issue in <c:out value="${issue.issueType}"/> : <c:out value="${issue.subType}"/>
     <div>
    <c:choose>
   
    <c:when test="${issue.issueType == 'hardware'}">
    	System Details: <c:out value="${issue.system}"/> <br>
    	Operating System: <c:out value="${issue.OS}"/><br>
    	Computer Type: <c:out value="${issue.compType}"/><br>
    	Computer Name: <c:out value="${issue.compName}"/><br>
    	Room Location: <c:out value="${issue.location}"/><br>
        Time of submission: <c:out value="${issue.timeOccurred}"/>
    </c:when>
    <c:when test="${issue.issueType == 'email'}">
        Email Address: <c:out value="${issue.email}"/> <br>
        Operating System: <c:out value="${issue.OS}"/><br>
        Browser: <c:out value="${issue.browser}"/><br>
        Time of submission: <c:out value="${issue.timeOccurred}"/>
    </c:when>
    <c:when test="${issue.issueType == 'account'}">
        <c:out value="${issue.OS}"/><br>
        Time of submission: <c:out value="${issue.timeOccurred}"/>
    </c:when>
    <c:when test="${issue.issueType == 'software'}">
        System Details: <c:out value="${issue.system}"/> 
        Operating System: <c:out value="${issue.OS}"/><br>
        Computer Type: <c:out value="${issue.compType}"/><br>
        Computer Name: <c:out value="${issue.compName}"/><br>
        Software Name: <c:out value="${issue.softwareName}"/> version: <c:out value="${issue.softwareName}"/><br>
        Room Location: <c:out value="${issue.location}"/><br>
        Time of submission: <c:out value="${issue.timeOccurred}"/>
    </c:when>
    <c:when test="${issue.issueType == 'network'}">
        System Details: <c:out value="${issue.system}"/> 
        <c:out value="${issue.OS}"/><br>
        User has <c:if test="${!restarted}"> not</c:if> restarted their device.<br>
        User has <c:if test="${!restarted}"> not</c:if> checked the cable is connected.<br>
        Other users have <c:if test="${!restarted}"> not</c:if> Also encountered this problem.<br>
        Room Location: <c:out value="${issue.location}"/><br>
        Time of submission: <c:out value="${issue.timeOccurred}"/>
    </c:when>

</c:choose>
    	</div>
    	<div>
    		Additional issue details: <br>
            <c:out value="${issue.body}"/>
    	</div>
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
		<form method='get' action=''>
			<div class='instructions'>
				Would you like to add a comment?<br>
				Just fill in the box below and hit submit.
			</div>
			<input type='hidden' name='issueID' id='issueID' value=<c:out value="${issue.issueID}"/> >
			<input type='hidden' name='userID' id='userID' value=<c:out value="${user.ID}"/> >
			<textarea name='commentBody' id='commentBody' rows='5' cols='75'></textarea>
			<br>
			<br>
			<input class='defaltButton' type="submit" value="Submit" onClick="form.action='SubmitComment';" />
		</form>
	</div>
</div>
</body>
</html>
