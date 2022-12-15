package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String username = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String passrepeat = request.getParameter("passrepeat");
			String role = "user";
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection  = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/EWRRX7sJQL", "EWRRX7sJQL", "r23irMGwNn");
				if (password.equals(passrepeat))
				{
					PreparedStatement ps = connection.prepareStatement ("insert into users(name,email,password,role) values(?,?,?,?)");
					ps.setString(1, username);
					ps.setString(2, email);
					ps.setString(3, password);
					ps.setString(4, role);
					int i = ps.executeUpdate();
					if (i>0) 
					{
						out.print("Loading...");
					}
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.include(request,response);
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("wronginfo.jsp");
					rd.include(request,response);
				}
				

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.close();
	}
}
}