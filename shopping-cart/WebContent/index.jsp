<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) 
	{
		request.setAttribute("auth", auth);
	}
	ProductDao pd = new ProductDao(DbCon.getConnection());
	List<Product> products = pd.getAllProducts();
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list != null){
		request.setAttribute("cart_list", cart_list);
		
	}
%>


<!DOCTYPE html>
<html>
<head>
<title>Wellcome to Shopping</title>
<%@include file="includes/head.jsp"%>
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
					String text = "";
					text = (String) request.getParameter("search");
					System.out.println(text);
					if (text != null)
					{
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
					}
				%>		
			</div>
		<br>
		<div class="row">
		<%
			if (!products.isEmpty()){
				for(Product p:products){%>
					<div class="col-md-3 my-3">
					<div class="card w-100" style="width: 18rem;">
						<img class="card-img-top" src = "<%= p.getImage() %>" width = "15%" height = "30%" alt="Card image cap"/>
						<div class="card-body">
							<h5 class="card-title"><%= p.getName() %></h5>
							<h6 class="price">Price: $<%=p.getPrice()%> </h6>
							<h6 class="category">Category:<%= p.getCategory() %></h6>
							<div class="mt-3 d-flex justify-content-between" style="height: 100%; width: 100%; object-fit: contain; display: flex;">
								<a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-dark">Add to cart</a> 
								<a href="order-now?quantity=1&id=<%= p.getId() %>" class="btn btn-primary">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
				<%}
			}
		%>					
		</div>
	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>