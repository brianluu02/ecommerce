<%@page import="java.util.*"%>
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
      </script>
<%@include file="includes/head.jsp"%>
</head>
<body>
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
	                  <td>Image</td>      
	                  <td><input type="file" name="file" id="file-uploader" accept=".jpg, .png"/></td>
	               </tr>
	               <tr></tr>
	               <tr>
	                  <td colspan = "2">
	                      <input class="btn btn-primary" type="submit" value="Create" />
	                      <a class="btn btn-link" href="${pageContext.request.contextPath}/productsListView.jsp">Cancel</a>
	                  </td>
	               </tr>
	            </table>
	         </form> 	  
	</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>