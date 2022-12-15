package cn.techtutorial.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.ProductDao;
import cn.techtutorial.model.Product;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/edit-product")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		try {
			conn = DbCon.getConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
 
        String idStr = (String) request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(idStr);
        } catch (Exception e) {
        }
        Product product = null;
        ProductDao productDAO = new ProductDao(conn);
        String errorString = null;
 
        try {
            product = productDAO.getSingleProduct(id);
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
 
        if (errorString != null && product == null) {
            response.sendRedirect("productsListView.jsp");
            return;
        }
 
        request.setAttribute("errorString", errorString);
        request.setAttribute("product", product);
 
        RequestDispatcher dispatcher = request.getRequestDispatcher("/editProductView.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		try {
			conn = DbCon.getConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String idStr = (String)request.getParameter("id");
		String name= (String)request.getParameter("name");
        String category = (String)request.getParameter("category");
        String priceStr = (String)request.getParameter("price");
        String image = (String)request.getParameter("image");
        
        Double price = 0.0;
        int id = 0;
        try {
        	id = Integer.parseInt(idStr);
            price = Double.parseDouble(priceStr);
        } catch (Exception e) {
        }
        
        if(image == "") {
        	image = (String)request.getParameter("image");
        }
        
        Product product = new Product(id, name, category, price, image);
         
        ProductDao productDAO = new ProductDao(conn);
 
        Boolean result = productDAO.updateProduct(product);
        
        request.setAttribute("product", product);
        
        if(result) {
        	response.sendRedirect(request.getContextPath() + "/productsListView.jsp");
        }
        else {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/editProductView.jsp");
            dispatcher.forward(request, response);
        }
	}
}
