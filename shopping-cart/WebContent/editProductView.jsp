<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Edit Product</title>
<%@include file="includes/head.jsp"%>
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
<script type="text/javascript">
function checklink(){
	var image = document.getElementById("imageload");
	var url = document.getElementById("image").value;
	image.src = url;
}
</script>
<style type="text/css">
	table {
	  table-layout: fixed ;
	  width: 100% ;
	}
	td {
	  width: 25% ;
	}
</style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
	<div class="card-header my-3">Edit Products</div>
	<c:if test="${not empty product}">
		<form method="POST" action="${pageContext.request.contextPath}/edit-product"
	          name="editProductForm" onsubmit="return validateForm()" >
	          <input type="hidden" name="id" value="${product.id}" />
	            <table class="table">
	            	<tr>
	                  <td>ID</td>
	                  <td style="color:red;">${product.id}</td>                  
	               </tr>
	               <tr>
	                  <td>Name</td>
	                  <td><input type="text" name="name" value="${product.name}"/></td>
	               </tr>
	               <tr>
	                  <td>Category</td>
	                  <td><input type="text" name="category" value="${product.category}"/></td>
	               </tr>
	               <tr>
	                  <td>Price</td>
	                  <td>
	                  	<input type="text" name="price" value="${product.price}"/>
	             	  </td>
	               </tr>
	               <tr>
	                  <td>Image link:</td>
	                  <td>
	                  	<input type="text" id="image" name="image" value="${product.image}"/>
	                  	<button type='button' id="checkimage" onclick="checklink()">Check link</button>
						    
	                  </td>
	                  
	               </tr>
	               	  <td>Old image:
	                  	<img src = "${product.image}" width = "50%" height = "50%" alt="Old image wrong link!"/>
	                  </td>
	                  <td>New image:
	                  	<img id="imageload" alt="Loading..." width = "50%" height = "50%" alt="New image wrong link!"/>
	                  </td>
	               <tr>
	               </tr>
	               <tr></tr>
	               <tr>
	                  <td colspan = "2">
	                      <input class="btn btn-primary" type="submit" value="Edit" />
	                      <a class="btn btn-link" href="${pageContext.request.contextPath}/productsListView.jsp">Cancel</a>
	                  </td>
	               </tr>
	            </table>
	         </form> 
	     </c:if>	  
	</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>