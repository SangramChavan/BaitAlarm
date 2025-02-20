
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<%@page import="java.net.URLDecoder"%>
<html>
<head>
<title>Phishing Site</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href='http://fonts.googleapis.com/css?family=Fjalla+One' rel='stylesheet' type='text/css'>
<style type="text/css">
body{
	background:url(./images/bg.jpg) ;
}	
.wrap{
	margin:0 auto;
	width:1000px;
}
.title{
	margin-bottom: 40px;
}	
.title h1{
	font-size:60px;
	color:RED;
	text-align:center;
	margin-top:100px;
	text-shadow:6px 1px 6px #333;
	font-family: 'Fjalla One', sans-serif;
}
.title h2{
	font-size:40px;
	color:RED;
	text-align:center;
	margin-bottom:1px;
	text-shadow:6px 1px 6px #333;
	font-family: 'Fjalla One', sans-serif;
	margin-top: -20px;
}		
.logo p{
	color:white;
	font-size:25px;
	margin-top:1px;
	font-family: 'Fjalla One', sans-serif;
}	
.gray {
	margin-bottom: 20px;
	background: rgba(12, 52, 77, 0.34);
	text-shadow: 0 -1px 1px rgba(0, 0, 0, 0.25);
	border-radius: 4px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-o-border-radius: 4px;
	color:yellow;
	text-decoration:none;
	padding:30px 30px;
	font-size: 20px;
	font-weight:bold;
	font-family: 'Fjalla One', sans-serif;
	text-align: center;
}	
.ag-3d_button.orange {
	box-shadow: rgba(155, 142, 50, 0.98) 0 3px 0px, rgba(0, 0, 0, 0.3) 0 3px 3px;
}
.ag-3d_button {
	vertical-align: top;
	border-radius: 4px;
	border: none;
	padding: 10px 25px 12px;
}
.orange {
	background: #fdde02;
	background: -moz-linear-gradient(top,  #fdde02 0%, #dec829 99%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fdde02), color-stop(99%,#dec829));
	background: -webkit-linear-gradient(top,  #fdde02 0%,#dec829 99%);
	background: -o-linear-gradient(top,  #fdde02 0%,#dec829 99%);
	background: -ms-linear-gradient(top,  #fdde02 0%,#dec829 99%);
	background: linear-gradient(to bottom,  #fdde02 0%,#dec829 99%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fdde02', endColorstr='#dec829',GradientType=0 );
	color:#fff;
	text-shadow:1px 1px 3px rgba(155, 142, 50, 0.98);
	border: 1px solid rgba(155, 142, 50, 0.98);
	text-decoration: none;
}
.orange:hover {
	background: #dec829;
	background: -moz-linear-gradient(top,  #dec829 1%, #fdde02 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(1%,#dec829), color-stop(100%,#fdde02));
	background: -webkit-linear-gradient(top,  #dec829 1%,#fdde02 100%);
	background: -o-linear-gradient(top,  #dec829 1%,#fdde02 100%);
	background: -ms-linear-gradient(top,  #dec829 1%,#fdde02 100%);
	background: linear-gradient(to bottom,  #dec829 1%,#fdde02 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#dec829', endColorstr='#fdde02',GradientType=0 );
}
.footer{
	color:white;
	position:absolute;
	right:10px;
	bottom:10px;
}	
.footer a{
	color:yellow;
}	
</style>
</head>
<body style="background-color: black;">
<%
String url=URLDecoder.decode(request.getParameter("url"));
%>
  
	<div class="wrap">
	   <div class="logo">
	   		<p>Phishing Site</p>
	   </div>
	   <div class="title" style="text-align: left;color: yellow">
	  		 <h1>Site that you are trying to access is a phishing site. </h1>
	   		 <h2>Possible Reasons:<BR>
	   		 Site URL may be diffrent.<BR>
	   		 Site host name may be diffrent.<BR>
	   		 Site may contain a malware or may be a phishing site.<BR>
	   		
	   		 </h2>
	  </div>
	</div>   
	<div class="wrap">
	    <div class="gray">
  	    	<a href="<%=url%>" class="ag-3d_button orange">Continue Access </a><a href="javascript:window.close();" class="ag-3d_button orange">Close  </a>
  	     </div>
   </div>  
	<div class="footer">
	 Design by-<a href="http://w3layouts.com">W3Layouts</a>
	</div>
</body>
</html>