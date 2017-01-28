<%
String url=URLDecoder.decode(request.getParameter("url")) ;
String redirect=URLDecoder.decode(request.getParameter("redirect")) ;
%>
<%-- <%@page import="sun.font.Script"%> --%>
<%@page import="com.action.GoogleSafeBrowsing"%>   
<%@page import="java.net.URLDecoder"%>
<%@page import="com.action.CrawlWebsite"%>
  <script src="<%=request.getContextPath()%>/theme/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/theme/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/theme/js/jquery.prettyPhoto.js"></script>
    <script src="<%=request.getContextPath()%>/theme/js/main.js"></script>
<script>
function fnRedirect(url)
{
	
	setInterval(function(){window.location.href=url;}, 2000);
	
}
function fnSubmit(){
	str='url=<%=request.getParameter("url")%>&redirect=<%=redirect%>';
	$.post("<%=request.getContextPath()%>/theme/tiles/ajax.jsp?methodId=checkSite",
			str,
			function(data) {
data=$.trim(data);  
//alert(data);
if(data=='1'){
	fnRedirect('<%=request.getContextPath()%>/pages/phishing.jsp?url=<%=request.getParameter("url")%>');
}else{
	fnRedirect('<%=url%>');
}

			});


}
</script>
    Checking For Phishing Site 
    <img src="<%=request.getContextPath()%>/theme/images/loading.gif"/>
    
    
<script>
fnSubmit();
</script>
