<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Create Product</title>
<script type="text/javascript">         
	function validateForm()  {
	 	var x = document.forms["createProductForm"]["name"].value;
	 	  if (x == "") {
	 	    alert("Enter Product Name!");
	 	    return false;
	 	  }
	 	  else
	 		  return true;
	}
	function checklink(){
		var image = document.getElementById("imageload");
		var url = document.getElementById("image").value;
		image.src = url;
	}
</script>
<%
	User auth =(User) request.getSession().getAttribute("auth");
	String check = "admin";
	if (auth!=null)
	{
		request.setAttribute("auth", auth);
		if (auth.getRole().equals(check) == false)
		{
			response.sendRedirect("index.jsp");
		}
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
%>
<%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
	<div class="card-header my-3">Create Products</div>
		<form method="POST" action="${pageContext.request.contextPath}/create-product"
	          name="createProductForm" onsubmit="return validateForm()" >
	            <table class="table">
	               <tr>
	                  <td>Name</td>
	                  <td><input type="text" name="name"/></td>                  
	               </tr>
	               <tr>
	                  <td>Category</td>
	                  <td><input type="text" name="category"/></td>
	               </tr>
	               <tr>
	                  <td>Price</td>
	                  <td><input type="text" name="price"/></td>
	               </tr>
	               <tr>
	                  <td>Image link:</td>      
	                  <td>
	                  	<input type="text" id="image" name="image" id="url-uploader"/>
	                  	<button type='button' id="checkimage" onclick="checklink()">Check link</button>
	                  </td>
	               </tr>
	                  <td>Check image:
	                  	<img id="imageload" alt="Loading..." width = "50%" height = "50%"/>
	                  </td>
	               <tr>
	               <tr></tr>
	               <tr>
	                  <td colspan = "2">
	                      <input class="btn btn-primary" type="submit" value="Create"/>
	                      <a class="btn btn-link" href="${pageContext.request.contextPath}/productsListView.jsp">Cancel</a>
	                  <script>
	          		  
	                  </script>
	                  </td>
	               </tr>
	            </table>
	         </form> 	  
	</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>