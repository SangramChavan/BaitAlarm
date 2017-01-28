<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="com.helper.DBUtils"%>
<%@page import="com.helper.PhishMailGuard"%>
<%@page import="com.helper.StringHelper"%>
<%@page import="javax.mail.Message"%>
<%@include file="../theme/tiles/inc.jsp" %>

    </head>
    <body>

<%

int index=StringHelper.n2i(request.getParameter("index")) ;

%>
<%=DBUtils.getMaxValueStr("Select body from emails where messageId="+index)%>
<%@include file="../theme/tiles/footer.jsp" %>
<script>
	function changeUrls(){
		obj=$('a');
		if(obj.length!='undefined'){
			
		
		for(i=0;i<obj.length;i++){
			link='';
			element=obj[i];
			link=element.href;
			link='<%=request.getContextPath()%>/pages/check.jsp?redirect=1&url='+encodeURI(link);
			obj[i].href=link;
		}
		}else{
			link='';
			element=obj;
			link=element.href;
			link='<%=request.getContextPath()%>/pages/check.jsp?redirect=1&url='+encodeURI(link);
			obj.href=link;
		}
		
	}
	$(document).ready(function() {
		changeUrls();	
	});
	
</script>
</body>
</html>