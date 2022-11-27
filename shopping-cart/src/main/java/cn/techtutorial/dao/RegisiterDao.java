package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.techtutorial.model.User;

public class RegisiterDao {
	private Connection con;

	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public RegisiterDao(Connection con) {
		this.con = con;
	}
	/*
	 * public boolean saveUser(User user){ boolean set = false; try{ //Insert
	 * register data to database String query =
	 * "insert into user(name,email,password) values(?,?,?)";
	 * 
	 * PreparedStatement pt = this.con.prepareStatement(query);
	 * 
	 * pst.setString(1, user.getName()); pst.setString(2, user.getEmail());
	 * pst.setString(3, user.getPassword());
	 * 
	 * 
	 * rs = pst.executeUpdate(); set = true; }catch(Exception e){
	 * e.printStackTrace(); } return set; }
	 */

	public User regisiterDao(String email, String password, String name) {
		User user = null;
		try {
			String query = "insert into user(name,email,password) values(?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, name);
			pst.executeUpdate();
			
			/*
			 * if (rs.next()) { user = new User(); user.setId(rs.getInt("id"));
			 * user.setName(rs.getString("name")); user.setEmail(rs.getString("email")); }
			 */
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;
	}

	/*
	 * public User regisiterDao(String email, String password) { // TODO
	 * Auto-generated method stub return null; }
	 */
}
