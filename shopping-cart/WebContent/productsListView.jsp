<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
	DecimalFormat dcf= new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	
	List<Product>  products = null;
	products = new ProductDao(DbCon.getConnection()).getAllProducts();
	%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>List Products</title>
	<%@include file = "includes/head.jsp" %>

	<script type="text/javascript">         
	    function testConfirmDialog(id)  {	   	 
	        var result = confirm("Do you want to delete this product?");
	        if(result)  {            	
	      	  window.location.href= "delete-product?id=" + id;
	        } else {
	            return false;
	        }
	   }    
	 </script>
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
		<div class="card-header my-3">All Products</div>
      		<div>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="text" id="search" name="search" maxlength="128" placeholder="Enter name product" >
					<input class="btn btn-outline-success" type="submit" value="Search/Refresh">
				</form>
				<%
					String text = null;
					text = (String) request.getParameter("search");
					System.out.println(text);
					if (!text.isEmpty())
					{
						ProductDao temp = new ProductDao(DbCon.getConnection());
						products = null;
						products = temp.searchProducts(text);
					}
					else
					{
						ProductDao temp = new ProductDao(DbCon.getConnection());
						products = null;
						products = temp.getAllProducts();
					}
				%>		
			</div>
			<br>
    	<div>
    	<a class="btn btn-primary" href="create-product" >Create Product</a>
    	</div>
    	<br>
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
						<td width = "25%" height = "25%"> <img class="card-img-top" src = "<%=p.getImage() %>" width = "25%" height = "25%" alt="Card image cap"/></td>
						<td><a class="btn btn-sm btn-outline-primary" href="edit-product?id=<%= p.getId() %>">Edit</a></td>
						<td><a class="btn btn-sm btn-outline-danger" href="#" onclick="testConfirmDialog(<%= p.getId()%>);">Delete</a></td>
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