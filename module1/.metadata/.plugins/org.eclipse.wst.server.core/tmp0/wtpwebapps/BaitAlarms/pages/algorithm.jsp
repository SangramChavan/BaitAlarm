<!DOCTYPE html>

<%@page import="com.helper.StringHelper"%>
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
</head><!--/head-->
<body>
   <%@include file="../theme/tiles/menu.jsp" %>


    <section id="recent-works">
        <div class="container">
            <div class="row">
             
                <div class="col-md-10">
                <h2>Algorithm</h2>   
                <span >
                <form method="post">
                Kindly Paste the html code of the email<BR>
              <textarea rows="5" cols="80" name="htmltext" id="htmltext"></textarea>
              
              <input type="submit" name="Check Phishing Attributes" value="Check Phishing Attributes"/>
              <%
              	String htmltext=StringHelper.n2s(request.getParameter("htmltext")) ;
              if(htmltext.length()>0){
            	  SpamModel m= PhishMailGuard.processMessage(htmltext, "", "", "");
            	  %>
            	  <table>
            	  <tr>
            	  
            	      	<td>Anchor Text & Href Mismatch </td>		<td style="text-align: center;"><%=m.getAnchorHrefURLDiffs() %></td>
            	      	
    			<tr><td>IP Address in Href</td><td style="text-align: center;" >&nbsp;<%=m.getIpAddressURLs() %></td></tr>
    			<tr><td>Shortened URLs</td><td style="text-align: center;">&nbsp;<%=m.getShortenedURLS() %></td></tr>
    			<tr><td>Blacklisted Urls</td><td style="text-align: center;">&nbsp;<%=m.getWhitelistURLs() %></td></tr>
    			<tr><td>Email has input Types</td><td style="text-align: center;">&nbsp;<%=m.isInputTypes() %></td></tr>
    			<tr><td>Has Spam Keywords</td><td style="text-align: center;">&nbsp;<%=m.isHasSpamKeywords() %></td></tr>
    			<tr><td>Multiple To</td><td style="text-align: center;">&nbsp;<%=m.isMultipleTo()%></td></tr>
    			</tr>
    			</table>
            	  <%
              }
              
              %>
              
              </form>
    	
    	</span>
                </div>
            </div><!--/.row-->
        </div>
    </section><!--/#recent-works-->




   <%@include file="../theme/tiles/footer.jsp" %>
   

</body>
</html>