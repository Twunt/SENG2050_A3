
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Software Issue</title>
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
    Software.jsp
    </div>
    <form method="post" >
		<h4>Software Issue</h4>
		Title of issue : <input  type="text" name="title" id="title" maxlength='30'> 
		<br>
		<br>
		<input type='hidden' name='issueType' id='issueType' value='software'>
		<input type='hidden' name='state' id='state' value='new'>
		Sub-category: <select name='subType' id='subType' default='general'>
			<option value='general'>General</option>
			<option value='slowToLoad'>Computer is slow to load</option>
			<option value='wontLoadAtAll'>Computer won't load at all</option>
		</select>
		<br>
		<br>
		Software Name: <input  type="text" name="softwareName" id="softwareName" maxlength='30' default='dont know'>
		<br>
		<br>
		Operating System: <input  type="text" name="softwareVersion" id="softwareVersion" maxlength='30' default='dont know'>
		<br>
		<br>
		Mac or PC: <select name='issueType' id='issueType' default='pc'>
			<option value='mac'>Mac</option>
			<option value='pc'>PC</option>
		</select>
		<br>
		<br>
		Operating System: <input  type="text" name="operatingSystem" id="operatingSystem" maxlength='20' default='dont know'>
		<br>
		<br>
		Computer type : <input  type="text" name="compType" id="compType" maxlength='10' default='dont know'> 
		<br>
		<br>
		Computer name: <input  type="text" name="compName" id="compName" maxlength='20' default='dont know'>
		<br>
		<br>
		Room location : <input  type="text" name="location" id="location" maxlength='10' default='dont know'> 
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
