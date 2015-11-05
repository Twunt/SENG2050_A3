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
         <li><a href='Hardware.jsp'><span>Hardware</span></a></li>
         <li><a href='Email.jsp'><span>Email</span></a></li>
         <li><a href='Account.jsp'><span>Account</span></a></li>
         <li><a href='Network.jsp'><span>Network</span></a></li>
         <li class='last'><a href='Software.jsp'><span>Software</span></a></li>
      </ul>
   </li>
   </c:when>
   <c:otherwise>
   <li><a href='#'><span>Answer reports</span></a></li>
   <li class='last'><a href='#'><span>Resolved Issues</span></a></li>
      </c:otherwise>
</c:choose>
<li class='has-sub'><a href='KBase?issueType=null&amp;subType=null'><span>Knowledge Base</span></a>
      <ul>
         <li class='has-sub'><a href='KBase?issueType=hardware&amp;subType=null'><span>Hardware</span></a>
            <ul>
               <li><a href='KBase?issueType=null&amp;subType=computerWontTurnOn'><span>Computer won't turn on</span></a></li>
               <li><a href='KBase?issueType=null&amp;subType=computerBlueScreens'><span>Computer "Blue Screens"</span></a></li>
               <li><a href='KBase?issueType=null&amp;subType=diskDrive'><span>Disk Drive</span></a></li>
               <li class='last'><a href='KBase?issueType=null&amp;subType=peripherals'><span>Peripherals</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='KBase?issueType=email&amp;subType=null'><span>Email</span></a>
            <ul>
               <li><a href='KBase?issueType=null&amp;subType=cantSend'><span>Can't Send</span></a></li>
               <li><a href='KBase?issueType=null&amp;subType=cantRecieve'><span>Can't Recieve</span></a></li>
               <li class='last'><a href='KBase?issueType=null&amp;subType=spamPhishing'><span>Spam/Phishing</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='KBase?issueType=account&amp;subType=null'><span>Account</span></a>
            <ul>
               <li><a href='KBase?issueType=null&amp;subType=passwordReset'><span>Password reset</span></a></li>
               <li class='last'><a href='KBase?issueType=null&amp;subType=wrongDetails'><span>Wrong Details</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='KBase?issueType=network&amp;subType=null'><span>Network</span></a>
            <ul>
               <li><a href='KBase?issueType=null&amp;subType=cantConnect'><span>Can't Connect</span></a></li>
               <li><a href='KBase?issueType=null&amp;subType=speed'><span>Speed</span></a></li>
               <li class='last'><a href='KBase?issueType=null&amp;subType=dropouts'><span>Dropouts</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='KBase?issueType=software&amp;subType=null'><span>Software</span></a>
            <ul>
               <li><a href='KBase?issueType=null&amp;subType=slowToLoad'><span>Slow to load</span></a></li>
               <li class='last'><a href='KBase?issueType=null&amp;subType=wontLoadAtAll'><span>Won't load at all</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
</ul>
</div>
</nav>