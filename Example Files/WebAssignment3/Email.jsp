
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>E-mail Issue</title>
    <link rel="stylesheet" type="text/css" href="headerStyle.css">
</head>
<body>
<%@include file="header.jsp"%>

<div id="content">
    <div class='instructions'>
    Email.jsp
    </div>
    <form method="post" >
		<h4>E-mail Issue</h4>
		Title of issue : <input  type="text" name="title" id="title" maxlength='30'> 
		<br>
		<br>
		<input type='hidden' name='issueType' id='issueType' value='email'>
		Sub-category: <select name='subType' id='subType' default='general'>
			<option value='general'>General</option>
			<option value='cantSend'>Can't send Emails</option>
			<option value='cantReceive'>Can't receive Emails</option>
			<option value='spamPhishing'>SPAM/Phishing</option>
		</select>
		<br>
		<br>
		Your Email Address: <input  type="text" name="emailAddress" id="emailAddress" maxlength='50' default='dont know'>
		<br>
		<br>
		Operating System: <input  type="text" name="operatingSystem" id="operatingSystem" maxlength='20' default='dont know'>
		<br>
		<br>
		When the issue occured: <input  type="text" name="compName" id="compName" maxlength='20' default='dont know'>
		<br>
		<br>
		What browser are you using : <input  type="text" name="browser" id="browser" maxlength='30' default='dont know'> 
		<br>
		<br>
		Description of the problem : <br>
		<textarea name='body' id='body' rows='15' cols='100'>"enter a description of the problem here"</textarea>
		<br>
		<br>
		<input class='defaltButton' type="submit" value="Submit" onClick="form.action='Home.jsp';">
	</form>
</div>

</body>
</html>
