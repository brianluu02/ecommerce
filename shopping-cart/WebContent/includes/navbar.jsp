<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">E-Commerce Cart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class =" badge badge-danger px-1"> ${ cart_list.size() } </span> </a></li>
				<%
				String admin = "admin";
				if (auth!=null)
				{
					//System.out.println(auth.toString()); - In ra console info tai khoan va role
					if (auth.getRole().equals(admin))
					{%>
						<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
						<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
						<li class="nav-item"><a class="nav-link" href="manager.jsp">Manager</a></li>
					<%}
					else
					{%>
						<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
						<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
						
					<%}
				}
				else
				{%>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="registration.jsp">Register</a></li>
					
				<%}
				%>			
				
			</ul>
		</div>
	</div>
</nav>