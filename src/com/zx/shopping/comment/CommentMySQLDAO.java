package com.zx.shopping.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.zx.shopping.product.Product;
import com.zx.shopping.user.User;
import com.zx.shopping.util.DB;

public class CommentMySQLDAO implements CommentDAO {

	public void add(Comment p) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "insert into comment values (null, ?, ?, ?, ?,?)";
			pstmt = DB.prepare(conn, sql);
			pstmt.setInt(1, p.getUid());
			pstmt.setInt(2, p.getPid());
			
			pstmt.setTimestamp(3, new Timestamp(p.getCdate().getTime()));
			pstmt.setString(4, p.getComment());
			pstmt.setInt(5, p.getItemid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	@Override
	public void update(Comment cm) {
		// TODO Auto-generated method stub
		
	}
	
	public int loadById(int id) {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		int p = 0;

		try {
			String sql = "select salesitem.orderid oid from salesitem where id = " + id;
			conn = DB.getConn();
			stmt = DB.getStatement(conn);
			rs = DB.getResultSet(stmt, sql);
			if (rs.next()) {
				p = rs.getInt("oid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(rs);
			DB.close(conn);
		}
		return p;
	}
	
	
	public List<Comment> loadByPid(int id) {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		List<Comment> list=new ArrayList<Comment>();

		try {
			String sql = "select comment.pid pid,comment.uid uid,comment.cdate cdate,comment.itemid itemid,comment.comment comment from comment where comment.pid = " + id;
			conn = DB.getConn();
			stmt = DB.getStatement(conn);
			rs = DB.getResultSet(stmt, sql);
			while (rs.next()) {
				Comment c=new Comment();
				c.setUid(rs.getInt("uid"));
				c.setPid(rs.getInt("pid"));
				c.setCdate(rs.getTimestamp("cdate"));
				c.setComment(rs.getString("comment"));
				c.setItemid(rs.getInt("itemid"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(rs);
			DB.close(conn);
		}
		return list;
	}
	public List<Comment> loadByUid(int id) {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		List<Comment> list=new ArrayList<Comment>();

		try {
			String sql = "select comment.pid pid,comment.uid uid,comment.cdate cdate,comment.itemid itemid,comment.comment comment from comment where comment.uid = " + id;
			conn = DB.getConn();
			stmt = DB.getStatement(conn);
			rs = DB.getResultSet(stmt, sql);
			while (rs.next()) {
				Comment c=new Comment();
				c.setUid(rs.getInt("uid"));
				c.setPid(rs.getInt("pid"));
				c.setCdate(rs.getTimestamp("cdate"));
				c.setComment(rs.getString("comment"));
				c.setItemid(rs.getInt("itemid"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(rs);
			DB.close(conn);
		}
		return list;
	}
		
	public static boolean delete(int pid) {
		boolean b = false;
		Connection conn = DB.getConn();
		String sql = "delete from comment where comment.itemid = " + pid;
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

}
