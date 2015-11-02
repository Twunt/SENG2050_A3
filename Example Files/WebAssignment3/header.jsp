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
         <li><a href='Hardware.jsp'><span>Hardware</span></a></li>
         <li><a href='Email.jsp'><span>Email</span></a></li>
         <li><a href='Account.jsp'><span>Account</span></a></li>
         <li><a href='Network.jsp'><span>Network</span></a></li>
         <li class='last'><a href='Software.jsp'><span>Software</span></a></li>
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