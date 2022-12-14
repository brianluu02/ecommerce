<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Edit Product</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
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
	                  <td><input type="text" name="price" value="${product.price}"/></td>
	               </tr>
	               <tr>
	                  <td>Image</td>
	                  <td>
	                  	<input type="text" name="image" value="${product.image}"/>
	                  	<input type="file" name="file" id="file-uploader" accept=".jpg, .png, .jpeg" value="">
	                  </td>  
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