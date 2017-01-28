<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="../theme/tiles/inc.jsp" %>
</head><!--/head-->
<body>
   <%@include file="../theme/tiles/menu.jsp" %>
 

       <section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h1>Login</h1>
                    
                </div>   
               
            </div>
        </div>
    </section><!--/#title-->     
    <section id="registration" class="container">
        <form class="center" id="contact-form" action="javascript:fnSubmit();">
            <fieldset class="registration-form">
         
             
           
                <div class="form-group">
                <label for="name">Username</label>
                    <input type="text" id="username" name="username" placeholder="Username" class="form-control"  required="required" >
                </div>
                
             
                <div class="form-group">
                <label for="name">Password</label>
                    <input type="password" id="userpass" name="userpass" placeholder="Password" class="form-control" required="required">
                </div>
             
                <div class="form-group">
                    <button class="btn btn-success btn-md btn-block" type="submit">Login</button>
                </div>
                
            </fieldset>
        </form>
        <DIV id="mainDivId" style="display: none;text-align: center;">
        Loading...<img src="<%=request.getContextPath()%>/theme/images/loading.gif"/><BR>
        <span id="textId1" style="display: none;text-decoration: blink;">Loading Emails From Your Inbox</span><BR>
        <span id="textId1" style="display: none;text-decoration: blink;">1st time Fetching of Email might take a lot of time</span><BR>
        <span id="textId2" style="display: none;text-decoration: blink;">&nbsp;</span>
        </DIV>
        
    </section><!--/#registration-->   
 

   

   <%@include file="../theme/tiles/footer.jsp" %>
   <script>
function fnSubmit(){
	
	
	 var str = $( "#contact-form" ).serialize();
	$.post("<%=request.getContextPath()%>/theme/tiles/ajax.jsp?methodId=checkLogin",
			str,
			function(data) {
data=$.trim(data);  

if(data=='false'){
	alert('Login Id/password is invalid!');
$('#contact-form')[0].reset();
return;
}else{
	$('#contact-form').hide();
	$('#mainDivId').show();
	myVar =setInterval("fn1()", 2000);
	
	
}

			});


}
myVar = 0;
function fn1(){
	$('#textId1').show();
	clearInterval(myVar);
	myVar =setInterval("fn2()",3000);
}
function fn2(){
	$('#textId2').show();
	clearInterval(myVar);
	myVar=setInterval("fn3()",3000);
	window.location.href='<%=request.getContextPath()%>/pages/inbox.jsp';
}
function fn3(){
	$('#textId3').show();
	clearInterval(myVar);
}

</script>
</body>
</html>