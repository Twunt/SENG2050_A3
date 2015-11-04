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

	<h1>Welcome to the Issue Reporting System.</h1>
	<h2>You can use the above links to navigate around our site to report an issue or browse our database of archived issues.</h2>
	<h2>Below is a list of your issues</h2>
	<table>
	<tr><th>Title</th><th>Article link</th></tr>
	<c:forEach var="article" items="${articles}">
		<tr>
			<td><c:out value="${article.title}"/></td>
			<td><a href='KBArticle?issueID=${article.issueID}'>click here</a></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>