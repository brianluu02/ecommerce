package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.OrderDao;
import cn.techtutorial.model.Cart;
import cn.techtutorial.model.Order;
import cn.techtutorial.model.User;

/**
 * Servlet implementation class OrderNowServlet
 */
@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			SimpleDateFormat formatter = new SimpleDateFormat("EEEE, dd/MM/yyyy hh:mm a");
			Date date = new Date();
			User auth = (User) request.getSession().getAttribute("auth");
			if (auth != null) {
				String productId = request.getParameter("id");
				System.out.print(productId);
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				if (productQuantity <= 0) {
					productQuantity = 1;

				}
				Order orderModel = new Order();
				orderModel.setId(Integer.parseInt(productId));
				orderModel.setUid(auth.getId());
				orderModel.setQuantity(productQuantity);
				// orderModel.setDate(formatter.format(date));
				orderModel.setDate(formatter.format(date));

				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				boolean result = orderDao.insertOrder(orderModel);
				if (result) {
					ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
					if (cart_list != null) {
						for (Cart c : cart_list) {
							if (c.getId() == Integer.parseInt(productId)) {
								cart_list.remove(cart_list.indexOf(c));
								break;
							}
						}
						
					}
					response.sendRedirect("orders.jsp");
				} else {
					out.print("Orders failed" );
				}
			} else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			/*
			 * SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); Date data =
			 * new Date();
			 * 
			 * 
			 * SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			 * 
			 * Date date = new Date();
			 * 
			 * // SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // Date
			 * date = new Date(); // LocalDateTime formatter = LocalDateTime.formatter(); //
			 * System.out.println("Before Formatting: " + now); // DateTimeFormatter
			 * formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy // HH:mm:ss"); // String
			 * formatDateTime = format(); // System.out.println("After Formatting: " +
			 * formatDateTime);
			 * 
			 * User auth = (User) request.getSession().getAttribute("auth"); if (auth !=
			 * null) { String productId = request.getParameter("id");
			 * System.out.print(productId); int productQuantity =
			 * Integer.parseInt(request.getParameter("quantity")); if (productQuantity <= 0)
			 * { productQuantity = 1; }
			 * 
			 * Order orderModel = new Order();
			 * orderModel.setId(Integer.parseInt(productId));
			 * orderModel.setUid(auth.getId()); orderModel.setQuantity(productQuantity); //
			 * orderModel.setDate(formatter.format(date));
			 * orderModel.setDate(formatter.format(data)); OrderDao orderDao = new
			 * OrderDao(DbCon.getConnection()); boolean result =
			 * orderDao.insertOrder(orderModel); if (result) { ArrayList<Cart> cart_list =
			 * (ArrayList<Cart>) request.getSession().getAttribute("cart-list"); if
			 * (cart_list != null) { for (Cart c : cart_list) { if (c.getId() ==
			 * Integer.parseInt(productId)) { cart_list.remove(cart_list.indexOf(c)); break;
			 * } } } response.sendRedirect("login.jsp"); } else { out.print("loi nuaw r ");
			 * } } else { response.sendRedirect("login.jsp"); } } catch (Exception e) {
			 * e.printStackTrace(); } }
			 */

		}
	}
}