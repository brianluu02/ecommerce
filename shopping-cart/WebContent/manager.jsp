<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html lang="en">
<head>
<title>Manager Page</title>
<link rel="stylesheet" type="text/css" href="css/managerstyle.css">
<%@include file = "includes/head.jsp" %>
<%@include file="includes/head.jsp"%>
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
	      		<input class="center-block" type="submit" value="Add">
	      		<input class="center-block" type="submit" value="Update">
	      		<input class="center-block" type="submit" value="Clear">
	    </div>
	</div>
	
	<table id="customers">
	<%
	try {          
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
    	
        Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DbCon.getConnection();
        statement = connection.createStatement();
        String SQLQuery = "SELECT * FROM products";
        rs = statement.executeQuery(SQLQuery);
        out.println("<tr><th>ID</th><th>Name</th><th>Categories</th><th>Price</th><th>Image</th></tr>");
        while (rs.next()) {           
        	String id = rs.getString("id");
         	String name = rs.getString("name");
         	String category = rs.getString("category");
         	String price = rs.getString("price");
         	String image = rs.getString("image");
         
    		out.println(
    		"<tr>" +
    			"<td>" + id + "</td>" +
    			"<td>" + name + "</td>" +
    			"<td>" + category + "</td>" +
    			"<td>" + price + "</td>" +
    			"<td>" + image + "</td>" +
    		"</tr>");
		}
		statement.close();
		}
		catch(SQLException e) {
		out.println("SQLException caught: " +e.getMessage());
		}
	%>
	</table>
</body>
</html>