
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    
    <form method="post" >
		User Name : <input type="text" name="userID" id="userID" > <br><br>

		Password : <input type="text" name="userPassword" id="userPassword" > <br><br>

		<input class='defaltButton' type="submit" value="Log In" onClick="form.action='Home.jsp';">
	</form>
</div>



</body>
</html>
