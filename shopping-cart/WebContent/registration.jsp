<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registration</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<%@page import="cn.techtutorial.model.*"%>
	<%@page import="java.util.*"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	
	<%@include file="includes/head.jsp"%>
</head>
<body>
	<div class="container">
		<div class="regbox box">
			<img class="avatar" src="">
			<h1>Register Account</h1>
			<form action="register" method="post">
                <div class="container">
                    <h1>Register</h1>
                    <p>Please fill in this form to create an account.</p>
                    <hr>
                    
                    <label for="name"><b>Username</b></label>
                    <input type="text" placeholder="Enter Username" name="name" id="name" required>

                    <label for="email"><b>Email</b></label>
                    <input type="text" placeholder="Enter Email" name="email" id="email" required>
                
                    <label for="password"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="password" id="password" required>
                
                    <label for="passrepeat"><b>Repeat Password</b></label>
                    <input type="password" placeholder="Repeat Password" name="passrepeat" id="passrepeat" required>
                    <hr>
                
                    <button type="submit" class="registerbtn" value="Register">Register</button>
                    
                  </div>
                
                  <div class="container signin">
                    <p>Already have an account? <a href="index.jsp">Sign in</a>.</p>
                </div>
			</form>
		</div>
	</div>
</body>
<%@include file="includes/footer.jsp"%>
</body>

</html>