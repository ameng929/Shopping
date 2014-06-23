package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.dao.SjzdflDAO;
import com.zx.kuangjia.po.Sjzdfl;

public class SjzdflServiceImpl implements SjzdflService {
	private SjzdflDAO sjzdflDAO;

	public SjzdflDAO getSjzdflDAO() {
		return sjzdflDAO;
	}

	public void setSjzdflDAO(SjzdflDAO sjzdflDAO) {
		this.sjzdflDAO = sjzdflDAO;
	}

	public List<Sjzdfl> getAllSjzdfl() {
		return sjzdflDAO.findAll();
	}

	public void updateSjzdfl(Sjzdfl sjzdfl) {
		sjzdflDAO.attachDirty(sjzdfl);
	}

	public Sjzdfl findSjzdflBySjzdflId(int sjzdflId) {
		return (Sjzdfl) sjzdflDAO.findByProperty("sjzdflId", sjzdflId).get(0);
	}

}
