<header>
</header>
<nav>
<div id='cssmenu'>
<ul>
   <li><a href='Home.jsp'><span>Home</span></a></li>
   <% if(false) {%>
   <li class='has-sub'><a href='#'><span>Submit an issue</span></a>
      <ul>
         <li><a href='#'><span>Hardware</span></a></li>
         <li><a href='#'><span>Email</span></a></li>
         <li><a href='#'><span>Account</span></a></li>
         <li><a href='#'><span>Network</span></a></li>
         <li class='last'><a href='#'><span>Software</span></a></li>
      </ul>
   </li>
   <%} else{%>
   <li><a href='AnswerIssue.jsp'><span>Answer Reports</span></a></li>
   <li class='last'><a href='ResolvedIssues.jsp'><span>Resolved Issues</span></a></li>
   <%}%>
   <li><a href='KnowledgeBase.jsp'><span>Knowledge Base</span></a></li>
</ul>
</div>
</nav>