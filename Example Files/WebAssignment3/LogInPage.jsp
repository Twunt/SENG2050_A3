
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ticket System-Log in</title>
    <link rel="stylesheet" type="text/css" href="headerStyle.css">
</head>
<body>
<header>
	<h1>Log In</h1>
</header>

<div id="content">
    <c:if test="${not empty err}"><c:out value="${err}"/></c:if>
    <form method="get" >
		User Name : <input type="text" name="userID" id="userID" > <br><br>

		Password : <input type="password" name="userPassword" id="userPassword" > <br><br>

		<input class='defaltButton' type="submit" value="Log In" onClick="form.action='Auth';">
	</form>

	<div>
		<c:forEach var="maintenance" items="${maintenances}">
		<br>
		<div class="maintenance">
			Maintenance scheduled to start at: <c:out value="${maintenance.startTime}"/>
			<br>
			And end at time : <c:out value="${maintenance.endTime}"/>
			<br>
			<br>
			For reasons : <c:out value="${maintenance.message}"/>
		</div>
	</c:forEach>
	</div>
</div>



</body>
</html>
