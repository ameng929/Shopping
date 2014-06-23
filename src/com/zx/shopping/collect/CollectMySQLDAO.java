package com.zx.shopping.collect;

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

public class CollectMySQLDAO implements CollectDAO {

	public void add(Collect p) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			String sql = "insert into collect values (null, ?, ?, ?)";
			pstmt = DB.prepare(conn, sql);
			pstmt.setInt(1, p.getUid());
			pstmt.setInt(2, p.getPid());
		    pstmt.setTimestamp(3, new Timestamp(p.getCdate().getTime()));
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}


	
	
	public List<Collect> loadByUid(int uid) {
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		List<Collect> list=new ArrayList<Collect>();

		try {
			String sql = "select collect.pid pid,collect.id id,collect.cdate cdate from collect where collect.uid = " + uid;
			conn = DB.getConn();
			stmt = DB.getStatement(conn);
			rs = DB.getResultSet(stmt, sql);
			while (rs.next()) {
				Collect c=new Collect();
				c.setUid(uid);
				c.setId(rs.getInt("id"));
				c.setPid(rs.getInt("pid"));
				c.setCdate(rs.getTimestamp("cdate"));
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

	@Override
	public void update(Collect cm) {
		// TODO Auto-generated method stub
		
	}
	public static boolean delete(int pid) {
		boolean b = false;
		Connection conn = DB.getConn();
		String sql = "delete from collect where collect.pid = " + pid;
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
