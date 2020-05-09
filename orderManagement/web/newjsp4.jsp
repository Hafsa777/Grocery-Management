<%-- 
    Document   : Login
    Created on : Aug 11, 2018, 11:14:01 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>
body{
	margin: 0;
	padding:0;
	background-image:url("images/aaa.jpeg");
	background-size:cover;
	background-position:auto;
	font-family:sans-serif;
	
	
}
.loginbox{
	width: 420px;
	heifht:420px;

	top:50%;
	left:50%;
	position: absolute;
	transform: translate(-50%,-50%);
	box-sizing:border-box;
	padding:70px 30px;
	background:transparent;
}
.avatar{
	width:100px;
	height:100px;
	border-radius:50%;
	position:absolute;
	top:-50px;
	left:35%;


}
h1{
	margin:0;
	padding:0 0 20px;
	text-size:center;
	font-size:22px;
}
.loginbox p{
	margin:0;
	padding:0;
	font-weight:bold;
}

.loginbox h1{
	color:blueviolet;
	position:absolute;
	top:12%;
	left:32%;
}
.loginbox input{
	border:none;
	border-bottom:1px solid #fff;
	background:transparent;
	outline:none;
	height: 40px;
	width:auto;
	color:#fff;
	font-size:16px;
}
.loginbox p{
	color:aqua;
}
.loginbox input[type="text"],input[type="password"]
{
	border:none;
	border-bottom:1px solid #fff;
	background:transparent;
	outline:none;
	height: 40px;
	width:auto;
	color:#fff;
	font-size:16px;
}
.loginbox input[type="submit"]
{
	border: none;
	outline:none;
	height: 40px;
	background: #fb2525;
	color:#fff;
	font-size:18px;
	border-radius: 20px;
	position: absolute;
	top:80%;
	left:35%;
}
.loginbox input[type="submit"]:hover
{
	cursor:pointer;	
	background: #ffc107;
	color: #000;
}
.loginbox a{
	text-decoration: none;
	font-size:12px;
	line-height: 20px;
	color: darkgrey;


}
.loginbox a1{
	text-decoration: none;
	font-size:12px;
	line-height: 20px;
	color: darkgrey;
	position:absolute;
	top:64%;
	left:9%;
}




	

</style>
 <script>
var finished_rendering = function() {
  console.log("finished rendering plugins");
  var spinner = document.getElementById("spinner");
  spinner.removeAttribute("style");
  spinner.removeChild(spinner.childNodes[0]);
}
FB.Event.subscribe('xfbml.render', finished_rendering);
</script>
</head>
<body>
    <div class="oauth">
	<div class="loginbox">
	<img src="images/avatar.png" class="avatar">
<h1>Login Here</h1>
<form name="log1" method="POST" action="LoginHandler">
		<p>Email</p>
		<input type="email" name="email" placeholder="Enter Email"required="required style="padding-right:10">
		<p>Password</p>
		<input type="Password" name="password" placeholder="Enter Password" required="required">
		<input type="submit" name="" value="Login">
		
<p>
    <a href="Register.jsp">Register</a>
  
<div id="spinner"
    style="
        background: #4267b2;
        border-radius: 5px;
        color: white;
        height: 40px;
        text-align: center;
        width: 250px;">
    Continue with Facebook
    <div
    class="fb-login-button"
    data-max-rows="1"
    data-size="large"
    data-button-type="continue_with"
    data-use-continue-as="true"
    ></div>
    <div
    class="fb-login-button"
    data-max-rows="1"
    data-size="<medium, large>"
    data-button-type="continue_with"
    data-width="<100% or px>"
    data-scope="<comma separated list of permissions, e.g. public_profile, email>"
></div>

</div>
    <a href="https://theoldreader.com/users/auth/facebook">Sign in with Facebook</a>
</p>
	
</div>

 
	 
    </form>
</body>
</head>
</html>

