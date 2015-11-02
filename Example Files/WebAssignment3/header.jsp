<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
   <c:out value="${user.name}"/>
</header>
<nav>
<div id='cssmenu'>
<ul>
   <li><a href='Home.jsp'><span>Home</span></a></li>
   <c:choose>
   <c:when test="${!user.staff}">
   <li class='has-sub'><a href='#'><span>Submit an issue</span></a>
      <ul>
         <li><a href='#'><span>Hardware</span></a></li>
         <li><a href='#'><span>Email</span></a></li>
         <li><a href='#'><span>Account</span></a></li>
         <li><a href='#'><span>Network</span></a></li>
         <li class='last'><a href='#'><span>Software</span></a></li>
      </ul>
   </li>
   </c:when>
   <c:otherwise>
   <li><a href='AnswerIssue.jsp'><span>Answer Reports</span></a></li>
   <li class='last'><a href='ResolvedIssues.jsp'><span>Resolved Issues</span></a></li>
   </c:otherwise>
</c:choose>
   <li><a href='KnowledgeBase.jsp'><span>Knowledge Base</span></a></li>
</ul>
</div>
</nav>