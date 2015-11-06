
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resolved Issue</title>
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
<a href='AddToKB?issueID=${issue.issueID}'>Add to knowledge base</a>
	<c:forEach var="comment" items="${comments}">
		<br>
		<div class="commentContainer">
			<span class="commentName"><c:out value="${comment.userName}"/></span>
			<br>
			<span class="commentTime"><c:out value="${comment.time}"/></span>
			<br>
			<br><div class="commentBody">
			<c:out value="${comment.body}"/>
        </div>
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
</div>
</body>
</html>
