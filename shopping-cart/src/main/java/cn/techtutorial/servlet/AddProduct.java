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
 * Servlet implementation class AddProduct
 */
@WebServlet("/create-product")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("/createProductView.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			conn = DbCon.getConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
        String name= (String)request.getParameter("name");
        String category = (String)request.getParameter("category");
        String priceStr = (String)request.getParameter("price");
        String image = (String)request.getParameter("file");
        
        Double price = 0.0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (Exception e) {
        }
        
        Product product = new Product(0, name, category, price, image);
         
        ProductDao productDAO = new ProductDao(conn);
		
        Boolean result = productDAO.insertProduct(product);
        if(result){
        	response.sendRedirect("productsListView.jsp");
        }
        else{
        	response.sendRedirect("createProductView.jsp");
        }
	}

}
