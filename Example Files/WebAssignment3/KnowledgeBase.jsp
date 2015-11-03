
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Knowledge Base</title>
    <link rel="stylesheet" type="text/css" href="headerStyle.css">
</head>
<body>
<%@include file="header.jsp"%>

<div id="content">
    KnowledgeBase.jsp
</div>

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
