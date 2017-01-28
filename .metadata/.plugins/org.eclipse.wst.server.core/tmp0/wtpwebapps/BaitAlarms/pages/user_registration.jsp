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
                    <h1>New User Registration</h1>
                    
                </div>
               
            </div>
        </div>
    </section><!--/#title-->     
    <section id="registration" class="container">
        <form class="center" id="contact-form" action="javascript:fnSubmit();">
            <fieldset class="registration-form">
             <div class="form-group">
             <label for="name">First Name</label> 
                    <input type="text" id="fname" name="fname" title="Please Enter First Name(Only Alphabets Minimum 3 Chars)" pattern="^[A-Za-z]{3,20}$" style="text-transform: capitalize;" placeholder="Enter First Name" class="form-control" required="required">
                </div>
                <div class="form-group">
                <label for="name">Last Name</label> 
                    <input type="text" id="lname" name="lname" title="Please Enter Last Name(Only Alphabets Minimum 3 Chars)" pattern="^[A-Za-z]{3,20}$"  style="text-transform: capitalize;"  placeholder="Enter Last Name" class="form-control"  required="required">
                </div>
              
                <div class="form-group">
                <label for="name">Username</label>
                    <input type="text" id="username" onchange="fnCheckUser();" name="username" placeholder="Username" class="form-control"  required="required">
                </div>
                
                <div class="form-group">
                <label for="name">Email Address</label>
                    <input type="text" id="email" onchange="fnCheckEmail();"   name="email" placeholder="E-mail"  class="form-control"  required="required">
                </div>
                <div class="form-group">
                <label for="name">Email Password</label>
                    <input type="password" id="userpass" name="userpass" placeholder="Password" title="Please enter Minimum of 8 Chars" pattern=".{8,}" class="form-control"  required="required">
                </div>
                <div class="form-group">
                <label for="name">Confirm Email Password</label>
                    <input type="password" id="cuserpass" name="cuserpass" placeholder="Password (Confirm)" title="Please enter Minimum of 8 Chars"  pattern=".{8,}"  class="form-control"   required="required">
                </div>
                <div class="form-group">
                    <button class="btn btn-success btn-md btn-block" type="submit">Register</button>
                </div>
            </fieldset>
        </form>
    </section><!--/#registration-->   
 

   

   <%@include file="../theme/tiles/footer.jsp" %>
   <script>
   
   function fnCheckUser(){
		
		 var str = $( "#contact-form" ).serialize();
		$.post("<%=request.getContextPath()%>/theme/tiles/ajax.jsp?methodId=checkUserName",
				str,
				function(data) {
	data=$.trim(data);  
	if(data=='true'){
		
		$('#username').val("");
		$('#username').focus();
		alert('UserName already Exists!. Kindly Choose a diffrent User Name');		
	}
				});


	}
   function fnCheckEmail(){
		
		 var str = $( "#contact-form" ).serialize();
		$.post("<%=request.getContextPath()%>/theme/tiles/ajax.jsp?methodId=checkEmailId",
				str,
				function(data) {
	data=$.trim(data);  
	if(data=='true'){
		$('#email').val("");
		$('#email').focus();
		alert('Email Id already Exists!. Kindly Choose a diffrent Email Id');
	}
				});


	}
 
   
function fnSubmit(){
	if(!checkEmail()){
		return;
	}
	
	if($('#userpass').val()!=$('#cuserpass').val()){
		alert('Password and confirm password do not match!');
		return;
	}
	
	 var str = $( "#contact-form" ).serialize();
	$.post("<%=request.getContextPath()%>/theme/tiles/ajax.jsp?methodId=registerNewUser",
			str,
			function(data) {
data=$.trim(data);  
alert(data);
$('#contact-form')[0].reset();

			});


}
function checkEmail() {

    var email = document.getElementById('email');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.value="";
    email.focus();
    return false;
 }
    return true;
}
</script>
</body>
</html>