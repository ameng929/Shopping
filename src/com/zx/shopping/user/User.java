package com.zx.shopping.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zx.shopping.client.Cart;
import com.zx.shopping.client.CartItem;
import com.zx.shopping.order.OrderMgr;
import com.zx.shopping.order.SalesItem;
import com.zx.shopping.order.SalesOrder;
import com.zx.shopping.product.Product;
import com.zx.shopping.util.DB;

public class User {
	private int id;

	private String username="";

	private String password="";

	private String phone="";

	private String addr="";

	private Date rdate=new Date();
	
	private String email="";
	
	private int right=0;

	public int getRight() {
		return right;
	}

	public void setRight(int right) {
		this.right = right;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void save() {
		Connection conn = DB.getConn();
		String sql = "insert into user values (null, ?, ?, ?, ?, ?, ?,?)";
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, phone);
			pstmt.setString(4, addr);
			pstmt.setTimestamp(5, new Timestamp(rdate.getTime()));
			pstmt.setString(6, email);
			pstmt.setInt(7, right);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}

	}

	public static User loadbyID(int id) {
		Connection conn = DB.getConn();
		String sql = "select * from user where id ="+id;
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		User u = new User();
		try {
			if (rs.next()) {
				
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setEmail(rs.getString("email"));
				u.setRight(rs.getInt("right"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return u;
	}
	
	
	
	public static List<User> getUsers1(String name) {
		List<User> users = new ArrayList<User>();
		Connection conn = DB.getConn();
		String sql = "select * from user where username="+"匿名用户";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
//				u.setPassword(rs.getString("password"));
//				u.setPhone(rs.getString("phone"));
//				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
//				u.setEmail(rs.getString("email"));
//				u.setRight(rs.getInt("right"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return users;
	}
	
	public static List<User> getUsers() {
		List<User> users = new ArrayList<User>();
		Connection conn = DB.getConn();
		String sql = "select * from user";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setEmail(rs.getString("email"));
				u.setRight(rs.getInt("right"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return users;
	}

	/**
	 * 
	 * @param users
	 * @param pageNo
	 * @param pageSize
	 * @return 
	 */
	public static int getUsers(List<User> users, int pageNo, int pageSize) {

		int totalRecords = -1;

		Connection conn = DB.getConn();
		String sql = "select * from user limit " + (pageNo - 1) * pageSize
				+ "," + pageSize;
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);

		Statement stmtCount = DB.getStatement(conn);
		ResultSet rsCount = DB.getResultSet(stmtCount,
				"select count(*) from user");

		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);

			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setEmail(rs.getString("email"));
				u.setRight(rs.getInt("right"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rsCount);
			DB.close(stmtCount);
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}

		return totalRecords;
	}

	public static boolean delete(int id) {
		boolean b = false;
		Connection conn = DB.getConn();
		String sql = "delete from user where id = " + id;
		Statement stmt = DB.getStatement(conn);

		try {
			DB.executeUpdate(stmt, sql);
			b = true;
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
		return b;
	}

	public static User check(String username, String password)
			throws UserNotFoundException, PasswordNotCorrectException {
		User u = null;
		Connection conn = DB.getConn();
		String sql = "select * from user where username = '" + username + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		try {
			if(!rs.next()) {
				throw new UserNotFoundException("用户不存在:" + username);
			} else {
				if(!password.equals(rs.getString("password"))) {
				//	String p=rs.getString("password");
					throw new PasswordNotCorrectException("密码错误");
				}
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setEmail(rs.getString("email"));
				u.setRight(rs.getInt("right"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return u;
	}
	
	public static void update(User u) {
		u.update();
	}
	public boolean checkPassword(String username, String password){
		User u = null;
		Connection conn = DB.getConn();
		String sql = "select * from user where username = '" + username + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		try {
			if(!rs.next()) {
				return false;
			} else {
				if(!password.equals(rs.getString("password"))) {
					return false;
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return true;
	}
	
	public void updatePassword() {
		
	}
	
	public static void updatePassword(User u) {
		u.updatePassword();
	}
	
	public static void updatePassword(int userId, String newPassword) {
		
	}
	
	

	
	public void update() {
		Connection conn = DB.getConn();
		//String sql = "update user set username=?,phone = ?, addr = ? ,email = ? ,right =? where id = "+this.id;
		String sql = "update user u set u.username=?,u.phone = ?, u.addr = ? ,u.email = ? ,u.right =? where u.id = ?;";
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			pstmt.setString(1, username);
			pstmt.setString(2, phone);
			pstmt.setString(3, addr);
			pstmt.setString(4, email);
			pstmt.setInt(5, right);
			pstmt.setInt(6, this.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	public void updatesecret() {
		Connection conn = DB.getConn();
		String sql = "update user set password = ?where id ="+this.id;
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			pstmt.setString(1, password);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	


	public static void main(String[] args) {
		List<User> users = new ArrayList<User>();
		int totalRecords = User.getUsers(users, 1, 10);
		for (int i = 0; i < users.size(); i++) {

		}
	}
	
	public int buy(Cart c) {
		SalesOrder so = new SalesOrder();
		so.setUser(this);
		so.setAddr(this.getAddr());
		so.setStatus(0);
		so.setPhone(this.getPhone());
		so.setODate(new Date());
		List<SalesItem> salesItems = new ArrayList<SalesItem>();
		List<CartItem> cartItems = c.getItems();
		for(int i=0; i<cartItems.size(); i++) {
			SalesItem si = new SalesItem();
			CartItem ci = cartItems.get(i);
			si.setProduct(ci.getProduct());
			si.setCount(ci.getCount());
			si.setUnitPrice(ci.getProduct().getMemberPrice());
			salesItems.add(si);
		}
		so.setItems(salesItems);
		return OrderMgr.getInstance().add(so); 
	}
}
