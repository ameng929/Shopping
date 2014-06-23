package com.zx.shopping.collect;

import java.util.List;

import com.zx.shopping.client.Cart;
import com.zx.shopping.user.User;

public class CollectMgr {

	private static CollectMgr mgr = null;

	private static CollectDAO dao = new CollectMySQLDAO();

	private CollectMgr() {
	}

	public static CollectMgr getInstance() {
		if (mgr == null) {
			mgr = new CollectMgr();
		}
		return mgr;
	}

	public void add(Collect cm) {
		dao.add(cm);
	}

}