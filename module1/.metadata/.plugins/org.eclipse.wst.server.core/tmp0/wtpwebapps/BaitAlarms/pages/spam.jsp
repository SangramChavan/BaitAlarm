<!DOCTYPE html>
<%@page import="com.helper.EmailModel"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.SpamModel"%>
<%@page import="com.helper.PhishMailGuard"%>
<%@page import="javax.mail.Message"%>
<%@page import="com.helper.ReadRecentMail"%>
<%@page import="com.helper.SimpleCryptoAndroidJava"%>
<html lang="en">
<head>
<%@include file="../theme/tiles/inc.jsp" %>
    <link href="<%=request.getContextPath()%>/theme/css/looks.css" rel="stylesheet">
</head><!--/head-->
<body>
   <%@include file="../theme/tiles/menu.jsp" %>
<%
int size=0;
List<EmailModel> msg1=null; 
	if(um!=null){
		String email=um.getEmail();
		String pass=SimpleCryptoAndroidJava.decryptString(um.getPass());
		msg1=ReadRecentMail.getSpamEmails(email, pass, um.getUserid());
		session.setAttribute("MAILS", msg1);
		if(msg1!=null){
			size=msg1.size();
		}
	}
%>

        <section id="title" class="emerald" style="padding: 20px;">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h1>Spam Mails (<%=size%>) </h1>
                    
                </div>   
               
            </div>
        </div>
    </section><!--/#title-->  
 <section id="recent-works1">
        <div class="container">
            <div class="row">
               
                <div class="col-md-10">
       

 <display:table name="sessionScope.MAILS" class="simple"  
							requestURI="spam.jsp" id="ipanalysisTableId" pagesize="10" 
							style="simple" defaultsort="1"
				  			export="false"  sort="list">	<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
<%
EmailModel m=(EmailModel)pageContext.getAttribute("ipanalysisTableId");
%>
							<display:column title="From" property="fromid" sortable="true"> </display:column>
							
							
							<display:column title="Subject" sortable="true">
							<a href="#" onclick='javascript:window.open ("<%=request.getContextPath()%>/pages/showMessage.jsp?index=<%=m.getMessageId()%>", "Email Content","scrollbars=yes,status=0,toolbar=0,width=800,height=400");' ><%=m.getSub()%></a>
							
							</display:column>
							<display:column sortProperty="messageId" title="Sent" sortable="true" property="mdate"></display:column>
							<display:column title="Anchor" sortable="true" property="anchorHrefURLDiffs"></display:column>
							<display:column title="IpAddress" sortable="true" property="ipAddressURLs"></display:column>
							<display:column title="ShortenURL" sortable="true" property="shortenedURLS"></display:column>
							<display:column title="WhiteList" sortable="true" property="whitelistURLs"></display:column>
							<display:column title="InputTypes" sortable="true" property="inputTypes"></display:column>
							<display:column title="SpamKeywords" sortable="true" property="hasSpamKeywords"></display:column>
							<display:column title="MultipleTo" sortable="true" property="multipleTo"></display:column>
							

						</display:table>
	  					
			
    
    	
    	
                </div>
            </div><!--/.row-->
        </div>
    </section><!--/#recent-works-->





   <%@include file="../theme/tiles/footer.jsp" %>
</body>
</html>