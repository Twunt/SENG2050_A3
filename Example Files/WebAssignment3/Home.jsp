<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>IRS Home Page</title>
	<link rel="stylesheet" type="text/css" href="headerStyle.css">
</head>
<body>
	<%@include file="header.jsp"%>

	<div id="content">
		Home.jsp
	</div>
	asd
	<h1>Welcome to the Issue Reporting System.</h1>
	<h2>You can use the above links to navigate around our site to report an issue or browse our database of archived issues.</h2>
	<h2>Below is a list of your issues</h2>
	<table>
	<tr><th>Title</th><th>Article link</th></tr>
	<c:forEach var="issue" items="${issues}">
		<tr>
			
			<td><a href='KBArticle?issueID=${issue.issueID}'><c:out value="${issue.title}"/></a></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>