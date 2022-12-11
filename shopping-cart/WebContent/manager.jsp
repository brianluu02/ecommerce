<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	DecimalFormat dcf= new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	
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
		List<Product>  products = null;
		products = new ProductDao(DbCon.getConnection()).getAllProducts();
	%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Manager Page</title>
<link rel="stylesheet" type="text/css" href="css/managerstyle.css">
<%@include file = "includes/head.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>List Products</title>
	<%@include file = "includes/head.jsp" %>

	<script type="text/javascript">         
	    function testConfirmDialog(id)  {
	   	 
	        var result = confirm("Do you want to delete this product?");
	
	        if(result)  {            	
	      	  window.location.href= "delete-order?id=" + id;
	      	 
	        } else {
	            return false;
	        }
	   }  
	 </script>
</head>

<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">  
    <h1>Product Manager</h1>  
    <input type="hidden" id="inputbox" />  
    <b>Product Id:</b><input type="text" id="product_id" /><br /> 
    <br /> 
    <b>Product name:</b><input type="text" id="product_name" /><br />
    <br />   
    <b>Category:</b><input type="text" id="category" /><br />  
    <br /> 
    <b>Price:</b><input type="text" id="price" /><br /> 
    <br />  
    <b>Image:</b><input type="file" id="image" /><br />
    <br />  
    <br />
    <div class="row">
      		<input class="center-block" type="submit" value="Add/Update">
      		<input class="center-block" type="submit" value="Clear">
    </div>
</div>

<div class="container">
		<div class="card-header my-3">All Products</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Image</th>
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(products != null){
				for(Product p:products){%>
					<tr>
						<td><%=p.getId() %></td>
						<td><%=p.getName() %></td>
						<td><%=p.getCategory() %></td>
						<td><%=dcf.format(p.getPrice()) %></td>
						<td><%=p.getImage() %></td>
						<td><a class="btn btn-sm" href="edit-product?id=<%= p.getId() %>">Edit</a></td>
						<td><a class="btn btn-sm btn-danger" href="#" onclick="testConfirmDialog(<%= p.getId()%>);">Delete</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
<%@include file = "includes/footer.jsp" %>
</body>
</html>