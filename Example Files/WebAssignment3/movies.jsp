<%-- Import the Core taglib--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--create the HTML table using foreach tag--%>
<%--<jsp:useBean id="game" class="Beans.Movie" scope="session" />--%>
<table>
	<tr><th>Name</th><th>Year</th><th>URL</th></tr>
	<c:forEach var="movie" items="${movies}">

		<tr>
			<td><c:out value="${movie.name}"/></td>
			<td><c:out value="${movie.year}"/></td>
			<td><c:out value="${movie.url}"/></td>
		</tr>
	</c:forEach>

</table><c:if test="${empty maintMessages}">
	<c:forEach var="maint"  items="${maintMessages}">
		From: <c:out value="${maint.message}"/><br>
		Until: <c:out value="${maint.start}"/><br>
		<c:out value="${maint.end}"/><br>
	</c:forEach>
</c:if>