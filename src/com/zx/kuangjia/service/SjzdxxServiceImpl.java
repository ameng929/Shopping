package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.dao.SjzdxxDAO;
import com.zx.kuangjia.po.Sjzdfl;
import com.zx.kuangjia.po.Sjzdxx;

public class SjzdxxServiceImpl implements SjzdxxService {
	private SjzdxxDAO sjzdxxDAO;

	public SjzdxxDAO getSjzdxxDAO() {
		return sjzdxxDAO;
	}

	public void setSjzdxxDAO(SjzdxxDAO sjzdxxDAO) {
		this.sjzdxxDAO = sjzdxxDAO;
	}

	public List<Sjzdxx> getAllSjzdxxBySjzdfl(Sjzdfl sjzdfl) {
		return sjzdxxDAO.findByProperty("sjzdfl", sjzdfl);
	}

	public void updateSjzdxx(Sjzdxx sjzdxx) {
		sjzdxxDAO.attachDirty(sjzdxx);
	}

}
