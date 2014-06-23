package com.zx.shopping.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.zx.shopping.util.DB;

public class UserMSQL {
	public void updateright(User p) {
		Connection conn = DB.getConn();
		Statement stmt = DB.getStatement(conn);
		try {
			String sql = "update user set right = " + p.getRight() + " where id = " + p.getId();
			DB.executeUpdate(stmt, sql);
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}		
	}
	
	public void update(User u) {
		Connection conn = DB.getConn();
		String sql = "update user u set u.right =? where u.id = ?;";
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			
			pstmt.setInt(1, u.getRight());
			pstmt.setInt(2, u.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
}
