<!DOCTYPE html>

<%@page import="com.helper.EmailModel"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.SpamModel"%>
<%@page import="com.helper.PhishMailGuard"%>
<%@page import="javax.mail.Message"%>
<%@page import="com.helper.ReadRecentMail"%>
<%@page import="com.helper.SimpleCryptoAndroidJava"%>
<%@taglib uri="/WEB-INF/displaytag-12.tld" prefix="display"%>
<html lang="en">
<head>
<%@include file="../theme/tiles/inc.jsp"%>
</head>   
<!--/head-->
<body>
	<%@include file="../theme/tiles/menu.jsp"%>
<%
 	List<EmailModel> msg = null;
					int size=0;		
 	if (um != null) 
 	{
 		String email = um.getEmail();
 		String pass = SimpleCryptoAndroidJava.decryptString(um
 				.getPass());
 		msg = ReadRecentMail.getMyEmails(email, pass, um.getUserid());
 		session.setAttribute("MAILS", msg);
 		if(msg!=null){
			size=msg.size();
		}

 	}
 %>
       <section id="title" class="emerald" style="padding: 20px;">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h1>Inbox Mails(<%=size%>)</h1>
                    
                </div>   
               
            </div>
        </div>
    </section><!--/#title-->  
	<section id="recent-works" style="padding: 20px;">
		<div class="container">
			<div class="row">

				<div class="col-md-10">
				
 <display:table name="sessionScope.MAILS" class="simple"  
							requestURI="inbox.jsp" id="ipanalysisTableId" pagesize="10" 
							style="simple" defaultsort="1" 
							export="false"  sort="list">
							<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
	<%
EmailModel m=(EmailModel)pageContext.getAttribute("ipanalysisTableId");
%>
						
							<display:column title="From" property="fromid" sortable="true"></display:column>
<%-- 							<display:column title="Subject" sortable="true" property="sub"></display:column> --%>
							<display:column title="Subject" sortable="true">
							<a href="#" onclick='javascript:window.open ("<%=request.getContextPath()%>/pages/showMessage.jsp?index=<%=m.getMessageId()%>", "Email Content","scrollbars=yes,status=0,toolbar=0,width=800,height=400");' ><%=m.getSub()%></a>
							
							</display:column>
							<display:column title="Date" sortProperty="messageId" sortable="true" property="mdate"></display:column>

						</display:table>
  


					
				</div>
			</div>
			<!--/.row-->
		</div>
	</section>
	<!--/#recent-works-->




	<%@include file="../theme/tiles/footer.jsp"%>
</body>
</html>