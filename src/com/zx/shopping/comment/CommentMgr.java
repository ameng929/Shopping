package com.zx.shopping.comment;

import java.util.List;

import com.zx.shopping.client.Cart;
import com.zx.shopping.user.User;

public class CommentMgr {
	
	private static CommentMgr mgr = null;
	
	private static CommentDAO dao = new CommentMySQLDAO(); 
	
	private CommentMgr() {}
	
	public static CommentMgr getInstance() {
		if(mgr == null) {
			mgr = new CommentMgr();
		}
		return mgr;
	}
	
	public void add(Comment cm) {
		 dao.add(cm);
	}
}