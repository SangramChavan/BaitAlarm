<%@page import="com.action.CrawlWebsite"%>
<%@page import="com.action.GoogleSafeBrowsing"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.helper.UserModel"%>
<%@page import="com.helper.ConnectionManager"%>
<%@page import="java.util.List"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@page import="org.jfree.chart.JFreeChart"%>

<%@page import="java.io.ObjectOutputStream"%>

<%@page import="com.helper.StringHelper"%>
<%@page import="java.util.HashMap"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String sMethod = StringHelper.n2s(request
	.getParameter("methodId"));
	String returnString = "";
	boolean bypasswrite=false;

	HashMap parameters = StringHelper.displayRequest(request);
	if (sMethod.equalsIgnoreCase("registerNewUser")) {
		returnString = ConnectionManager.insertUser(parameters);  
	}
	else if (sMethod.equalsIgnoreCase("checkEmailId")) {
		boolean um= ConnectionManager.checkEmailId(parameters);
	returnString=um+"";
	}
	else if (sMethod.equalsIgnoreCase("checkUserName")) {
		boolean um= ConnectionManager.checkUserName(parameters);
	returnString=um+"";
	}
	else if (sMethod.equalsIgnoreCase("checkLogin")) {
		UserModel um= ConnectionManager.checkLogin(parameters);
		if(um!=null){
	session.setAttribute("USER_MODEL", um);
	returnString="true";
		}else{
	returnString="false";
		}
	}
	else if (sMethod.equalsIgnoreCase("checkSite")) {
		String url=URLDecoder.decode(request.getParameter("url")) ;
		String redirect=URLDecoder.decode(request.getParameter("redirect")) ;
		int i=GoogleSafeBrowsing.isPhishing(url);
		if(i==-1){
		boolean phishing=CrawlWebsite.checkIfPhishing(url);
		if(phishing){
			returnString="1";
		}else{
			returnString="-1";
			
		}
	}
	}
	
	   
	
	else if (sMethod.equalsIgnoreCase("logout")) {
	session.removeAttribute("USER_MODEL");
	bypasswrite=true;
%>
			<script>
			window.location.href='<%=request.getContextPath()%>/pages/login.jsp';
			</script>
			<%
	}
	if(!bypasswrite){
	out.println(returnString);
	
	}
%>
