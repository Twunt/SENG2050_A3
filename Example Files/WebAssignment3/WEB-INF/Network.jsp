
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Network Issue</title>
    <link rel="stylesheet" type="text/css" href="headerStyle.css">
</head>
<body>
<%@include file="header.jsp"%>
<jsp:useBean id='issue' class='Beans.Issue' scope='page'/>
<jsp:useBean id='user' class='Beans.User' scope='session'/>
<jsp:setProperty name='issue' property='*'/>
Welcome <jsp:getProperty name='user' property='name'/> what is your issue?
<br>
<div id="content">
    <div class='instructions'>
    Network.jsp
    </div>
    <form method="post" >
		<h4>Network Issue</h4>
		Title of issue : <input  type="text" name="title" id="title" maxlength='30'> 
		<br>
		<br>
		<input type='hidden' name='issueType' id='issueType' value='network'>
		<input type='hidden' name='state' id='state' value='new'>
		Sub-category: <select name='subType' id='subType' default='general'>
			<option value='general'>General</option>
			<option value='cantConnect'>Can't Connect</option>
			<option value='speed'>Speed</option>
			<option value='constantDropouts'>Constant dropouts</option>
		</select>
		<br>
		<br>
		Room location : <input  type="text" name="location" id="location" maxlength='10' default='dont know'> 
		<br>
		<br>
		Have you restarted the computer yet : <input type='checkbox' name='haveRestarted' id='haveRestarted' value='true'>
		<br>
		<br>
		Is the cable connected : <input type='checkbox' name='cableConnected' id='cableConnected' value='true'>
		<br>
		<br>
		Are people in the area having similar issues : <input type='checkbox' name='similarIssues' id='similarIssues' value='true'>
		<br>
		<br>
		Description of the problem : <br>
		<textarea name='body' id='body' rows='15' cols='100'>"enter a description of the problem here"</textarea>
		<br>
		<br>
		<input class='defaltButton' type="submit" value="Submit" onClick="form.action='SubmitIssue';">
	</form>
</div>

</body>
</html>
