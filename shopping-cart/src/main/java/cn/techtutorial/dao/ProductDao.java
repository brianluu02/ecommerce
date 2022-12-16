package cn.techtutorial.dao;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
//import java.util.*;
/*import java.sql.*;
import java.util.*;*/
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.techtutorial.model.Cart;
import cn.techtutorial.model.Product;

public class ProductDao {

	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	//private Cart item;
	public ProductDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertProduct(Product model ) {
    	boolean result = false;
    	
    	try{
    		query = "insert into products (name, category, price, image) values (?,?,?,?)";
    		pst = this.con.prepareStatement(query);
    		pst.setString(1, model.getName());
    		pst.setString(2, model.getCategory());
    		pst.setDouble(3, model.getPrice());
    		pst.setString(4, model.getImage());
    		pst.executeUpdate();
    		result = true;
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	 return result;
    }
	public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try {

            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs .getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
            //System.out.println(e.getMessage());
        }
        return products;
	
	}
	public void deleteProduct(int id ){
		   try {
			   query = "delete from products where id=?";
			   pst = this.con.prepareStatement(query);
			   pst.setInt(1, id);
			   pst.execute();
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	
	public void deleteOrder(){
		   try {
			   query = "DELETE FROM orders WHERE orders.p_id NOT IN (SELECT products.id FROM products);";
			   pst = this.con.prepareStatement(query);
			   pst.execute();
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	
	public boolean updateProduct(Product model ) {
    	boolean result = false;

    	try{
    		query = "update products set name=?, category=?, price=?, image=? where id=?";
    		pst = this.con.prepareStatement(query);
    		pst.setString(1, model.getName());
    		pst.setString(2, model.getCategory());
    		pst.setDouble(3, model.getPrice());
    		pst.setString(4, model.getImage());
    		pst.setInt(5, model.getId());
    		
    		pst.executeUpdate();
    		
    		result = true;
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return result;
    }
	public List<Product> findProducts(String name) {
        List<Product> products = new ArrayList<>();
        try {

            query = "select * from products where name like '%?%'";
            pst = this.con.prepareStatement(query);
            pst.setString(1, name);
            
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs .getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
            //System.out.println(e.getMessage());
        }
        return products;
	
	}
	
	public List<Product> searchProducts(String text) 
	{
		String lowertext = text.toLowerCase();
		String finaltext = lowertext.replace(" ", "|");
        List<Product> products = new ArrayList<>();
        try {

            //query = "SELECT * FROM products WHERE CONCAT(products.name, '', products.category) LIKE \"%" + text +"%\";";
            query = "SELECT * FROM products WHERE products.name REGEXP '" + finaltext + "' or products.category REGEXP '" + finaltext + "';";
            
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs .getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
            //System.out.println(e.getMessage());
        }
        return products;
	
	}
	
	/*
	 * public List<Cart> getCartProducts(ArrayList<Cart> cartList) { List<Cart>
	 * products = new ArrayList<>(); try { if(cartList.size()>0) { for (Cart item :
	 * cartList) { query = "select * from products"; pst =
	 * this.con.prepareStatement(query); pst.setInt(1, item .getId()); rs =
	 * pst.executeQuery(); } } while (rs.next()) { Cart row = new Cart();
	 * row.setId(rs.getInt("id")); row.setName(rs.getString("name"));
	 * row.setCategory(rs.getString("category"));
	 * row.setPrice(rs.getDouble("price")*item.getQuantity());
	 * row.setQuantity(item.getQuantity());
	 * 
	 * products.add(row); }
	 * 
	 * } catch (Exception e) { //e.printStackTrace();
	 * System.out.println(e.getMessage()); } return products; }
	 */
    public List<Cart> getCartProducts(ArrayList<Cart> cartList){
    	List<Cart> products =new ArrayList<Cart>();
    	
    	try {
    		
    		if (cartList.size()> 0 ) {
    			for ( Cart item:cartList) {
    				query = "select * from products where id=?";
    				pst = this.con.prepareStatement(query);
    				pst.setInt(1,item.getId());
    				rs = pst.executeQuery();
    				
    				while (rs.next()) {
    					Cart row = new Cart();
    					row.setId(rs.getInt("id"));
    					row.setName(rs.getString("name"));
    					row.setCategory(rs.getString("category"));
    					row.setPrice(rs.getDouble("price")*item.getQuantity() );
    					row.setQuantity(item.getQuantity());
    					products.add(row);
    				}
    			}
    		}
    	}catch(Exception e ) {
    		System.out.println(e.getMessage());
    		//e.printStackTrace();
    	}
    	return products;
    	
    }
    
    public Product getSingleProduct (int id)
    {
    	Product row = null;
    	
    	try
    	{
    		query = "select *from products where id =?" ;
    		pst=this.con.prepareStatement(query);
    		pst.setInt(1, id);
    		rs = pst.executeQuery();
    		while(rs.next()){
    			row = new Product();
    			row.setId(rs.getInt("id"));
    			row.setName(rs.getString("name"));
    			row.setCategory(rs.getString("category"));
    			row.setPrice(rs.getDouble("price"));
    			row.setImage(rs.getString("image"));
    		}
    		
    	}catch(Exception e ){
    		e.printStackTrace();
    	}
    	return row;
    }
    
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
    	double sum = 0;
    	try{
    		if (cartList.size()> 0 )
    		{
    			for (Cart item:cartList) {
    				query ="select price from products where id=?";
    				pst = this.con.prepareStatement(query);
    				pst.setInt(1, item.getId());
    				rs = pst.executeQuery();
    				while (rs.next()) {
    					sum+= rs.getDouble("price") *item.getQuantity();
    					
    				}
    			}
    		}
    		
    		
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    	return sum;
    }
    
    public String getBase64EncodedImage(String imageURL) throws MalformedURLException{
    	URL url = new URL(imageURL);
    	BufferedInputStream bis = null;
		try {
			bis = new BufferedInputStream(url.openConnection().getInputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return bis.toString();
    }
}
