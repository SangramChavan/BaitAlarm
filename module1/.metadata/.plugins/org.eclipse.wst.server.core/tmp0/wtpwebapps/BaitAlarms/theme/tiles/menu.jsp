<%@page import="com.helper.UserModel"%>
<%
UserModel um=null;
String role="";
boolean isLogin=false;
String name="";
if(session.getAttribute("USER_MODEL")!=null){
	um=(UserModel)session.getAttribute("USER_MODEL");
	name=um.getFname()+" "+um.getLname();
	isLogin=true;
}
%>

 <header class="navbar navbar-inverse navbar-fixed-top wet-asphalt" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>/pages/login.jsp"><img src="<%=request.getContextPath()%>/theme/images/phil.png" height="40" alt="logo">MailGuard</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                      <li><a href="<%=request.getContextPath()%>/pages/user_registration.jsp">Register</a></li>
                    
                        <%if(isLogin){ %>
                        <li><a href="<%=request.getContextPath()%>/pages/inbox.jsp">Inbox</a></li>
<!--                          class="active" -->
                          <li><a href="<%=request.getContextPath()%>/pages/spam.jsp">Spam</a></li>
                          <li><a href="<%=request.getContextPath()%>/pages/algorithm.jsp">Algorithm</a></li>
                    <li><a href="<%=request.getContextPath()%>/theme/tiles/ajax.jsp?methodId=logout">Logout</a></li>   
                    <%}else{ %>
                    <li><a href="<%=request.getContextPath()%>/pages/login.jsp">Home</a></li>
                    <li><a href="<%=request.getContextPath()%>/pages/aboutProject.jsp">About Project</a></li>
                    <%} %>
                  
                    
<!--                     <li><a href="portfolio.html">Portfolio</a></li> -->
<!--                     <li class="dropdown"> -->
<!--                         <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="icon-angle-down"></i></a> -->
<!--                         <ul class="dropdown-menu"> -->
<!--                             <li><a href="career.html">Career</a></li> -->
<!--                             <li><a href="blog-item.html">Blog Single</a></li> -->
<!--                             <li><a href="pricing.html">Pricing</a></li> -->
<!--                             <li><a href="404.html">404</a></li> -->
<!--                             <li><a href="registration.html">Registration</a></li> -->
<!--                             <li class="divider"></li> -->
<!--                             <li><a href="privacy.html">Privacy Policy</a></li> -->
<!--                             <li><a href="terms.html">Terms of Use</a></li> -->
<!--                         </ul> -->
<!--                     </li> -->
<!--                     <li><a href="blog.html">Blog</a></li>  -->
<!--                     <li><a href="contact-us.html">Contact</a></li> -->
                </ul>
            </div>
        </div>
    </header><!--/header-->