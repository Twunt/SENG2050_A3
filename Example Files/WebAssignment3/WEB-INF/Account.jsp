
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account Issue</title>
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
    Account.jsp
    </div>
    <form method="post" >
		<h4>Account Issue</h4>
		Title of issue : <input  type="text" name="title" id="title" maxlength='30'> 
		<br>
		<br>
		<input type='hidden' name='issueType' id='issueType' value='account'>
		<input type='hidden' name='state' id='state' value='new'>
		Sub-category: <select name='subType' id='subType' default='general'>
			<option value='general'>General</option>
			<option value='passwordReset'>Password reset</option>
			<option value='wrongDetails'>Wrong detatils</option>
		</select>
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
