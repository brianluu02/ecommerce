package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.RegisiterDao;
import cn.techtutorial.dao.UserDao;
import cn.techtutorial.model.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter())
		{
			String username =request.getParameter("name");
			String email =request.getParameter("email");
			String password =request.getParameter("password");
			
			try {
				RegisiterDao udao = new RegisiterDao(DbCon.getConnection());
				User user = udao.regisiterDao(username, email, password);
				
					request.getSession().setAttribute("auth", user);
					
//					System.out.print("user logged in");
					response.sendRedirect("index.jsp");
				} catch (Exception e) {
				
				e.printStackTrace();
			}
			
		}
	}

}
