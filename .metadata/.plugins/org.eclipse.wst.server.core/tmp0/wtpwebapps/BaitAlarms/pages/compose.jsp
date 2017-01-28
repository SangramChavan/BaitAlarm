<!DOCTYPE html>
<%@page import="com.helper.SimpleCryptoAndroidJava"%>
<%@page import="org.apache.catalina.User"%>
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
                    <h1>Send Email</h1>
                </div>
               
            </div>
        </div>
    </section><!--/#title-->     
    <section id="registration" class="container">
        <form class="center" id="contact-form" action="javascript:fnSubmit();">
            <fieldset class="registration-form">
             <div class="form-group">
             <label for="name">Recepient: </label> 
                    <input type="text" id="to" name="to" title="Recepient Email Address" placeholder="Enter Recepient Email Address" class="form-control" required="required">
                </div>
                <div>
                 <label for="name">cc : </label> 
                    <input type="text" id="cc" name="cc" title="Sender Email Address" placeholder="Enter Your Address" class="form-control" required="required">
                </div>
                <div class="form-group">
                <label for="name">Enter Subject</label> 
                    <input type="text" id="sub" name="sub" title="Please Enter Subject"  placeholder="Enter Subject" class="form-control"  required="required">
                </div>
                <div class="form-group" >
                  <label for="name">Enter Mail Message</label><br/>
                  <textarea rows="3" cols="12" name="msg" id="msg"></textarea>
              	</div>
                <div class="form-group">
                    <button class="btn btn-success btn-md btn-block" type="submit">Send Email</button>
                </div>
            </fieldset>
        </form>
    </section><!--/#registration-->   
 
   <%@include file="../theme/tiles/footer.jsp" %>
   <script>
function fnSubmit()
{
	 var str = $( "#contact-form" ).serialize();
	 $.post("<%=request.getContextPath()%>/theme/tiles/ajax.jsp?methodId=sendMail",
			str,
			function(data) 
			{
				data=$.trim(data);  
				alert(data);
				$('#contact-form')[0].reset();
			});
	
}
function checkEmail() 
{
    var email = document.getElementById('email');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.value="";
    email.focus();
    return false;
 }
}
</script>
</body>
</html>