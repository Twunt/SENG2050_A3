<header>
</header>
<nav>
<div id='cssmenu'>
<ul>
   <li><a href='Home.jsp'><span>Home</span></a></li>
   <% if(true) {%>
   <li class='has-sub'><a href='#'><span>Submit an issue</span></a>
      <ul>
         <li><a href='Hardware.jsp'><span>Hardware</span></a></li>
         <li><a href='Email.jsp'><span>Email</span></a></li>
         <li><a href='Account.jsp'><span>Account</span></a></li>
         <li><a href='Network.jsp'><span>Network</span></a></li>
         <li class='last'><a href='Software.jsp'><span>Software</span></a></li>
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