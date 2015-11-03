<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Answer Issue</title>
    <link rel="stylesheet" type="text/css" href="headerStyle.css">
</head>
<body>
<%@include file="header.jsp"%>

<div id="content">
    <h1>Resolve Issue</h1>
    <c:out value="${issue.title}"/>
    Issue in <c:out value="${issue.issueType}"/> : <c:out value="${issue.subType}"/>
     <div>
    <c:choose>
   
    <c:when test="${issue.issueType == 'hardware'}">
    	System Details: <c:out value="${issue.system}"/> 
    	--<c:out value="${issue.OS}"/><br>
    	Computer Type: <c:out value="${issue.compType}"/><br>
    	Computer Name: <c:out value="${issue.compName}"/><br>
    	Room Location: <c:out value="${issue.location}"/><br>
        Time of submission: <c:out value="${issue.timeOccurred}"/>
    </c:when>
</c:choose>
    	</div>
    	<div>
    		Issue Description: <br>
            <c:out value="${issue.body}"/>
    	</div>
        <div>
</div>

</body>
</html>
