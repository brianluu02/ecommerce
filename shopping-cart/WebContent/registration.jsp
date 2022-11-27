<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>

</body>
</html>

<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<title>Shooping Cart Login</title> -->
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%-- //<%@include file="includes/navbar.jsp"%> --%>
	<!-- <div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email address</label> <input type="email"
							class="form-control" name="login-email" placeholder="Enter email"
							required>
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="login-password"
							placeholder="**********" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div> -->



<!-- 	<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register Account</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei"
	rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body> -->

	<div class="container">
		<div class="regbox box">
			<img class="avatar" src="img/collaboration.png">
			<h1>Register Account</h1>
			<form action="register" method="post">
				<p>Username</p>
				<input type="text" placeholder="Username" name="name" required>
				<p>Useremail</p>
				<input type="text" placeholder="Useremail" name="email" required>
				<p>Password</p>
				<input type="password" placeholder="Password" name="password"
					required> <input type="submit" value="Register"> <a
					href="index.jsp">Already have Account?</a>
			</form>
		</div>
	</div>
</body>




<%@include file="includes/footer.jsp"%>
</body>

</html>