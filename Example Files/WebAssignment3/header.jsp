<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
   <c:out value="${user.name}"/>
</header>
<nav>
<div id='cssmenu'>
<ul>
   <li class='active'><a href='index.html'><span>Home</span></a></li>
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
   <li><a href='#'><span>Answer reports</span></a></li>
   <li class='last'><a href='#'><span>Resolved Issues</span></a></li>
      </c:otherwise>
</c:choose>
<li class='has-sub'><a href='#'><span>Knowledge Base</span></a>
      <ul>
         <li class='has-sub'><a href='#'><span>Hardware</span></a>
            <ul>
               <li><a href='#'><span>Computer won't turn on</span></a></li>
               <li><a href='#'><span>Computer "Blue Screens"</span></a></li>
               <li><a href='#'><span>Disk Drive</span></a></li>
               <li class='last'><a href='#'><span>Peripherals</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>Email</span></a>
            <ul>
               <li><a href='#'><span>Can't Send</span></a></li>
               <li><a href='#'><span>Can't Recieve</span></a></li>
               <li class='last'><a href='#'><span>Spam/Phishing</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>Account</span></a>
            <ul>
               <li><a href='#'><span>Password reset</span></a></li>
               <li class='last'><a href='#'><span>Wrong Details</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>Network</span></a>
            <ul>
               <li><a href='#'><span>Can't Connect</span></a></li>
               <li><a href='#'><span>Speed</span></a></li>
               <li class='last'><a href='#'><span>Dropouts</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>Software</span></a>
            <ul>
               <li><a href='#'><span>Slow to load</span></a></li>
               <li class='last'><a href='#'><span>Won't load at all</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
</ul>
</div>
</nav>