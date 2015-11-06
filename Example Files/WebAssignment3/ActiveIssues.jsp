<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Active Issues</title>
	<link rel="stylesheet" type="text/css" href="headerStyle.css">
</head>
<body>
	<%@include file="header.jsp"%>

	<div id="content">
	</div>
	<table>
	<tr><th>Title</th><th>State</th></tr>
	<c:forEach var="articles" items="${articles}">
		<tr>
			
			<td><a href='KBArticle?issueID=${articles.issueID}'><c:out value="${articles.title}"/></a></td><td><c:out value="${articles.state}"/></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>