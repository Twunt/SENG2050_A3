
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

<table>
	<tr><th>Title</th></tr>
	<c:forEach var="article" items="${articles}">
		<tr>

			<td><a href='KBArticle?issueID=${article.issueID}'><c:out value="${article.title}"/></a></td>
		</tr>
	</c:forEach>
</table>

</body>
</html>
