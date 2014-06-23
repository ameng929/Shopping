package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.po.Sjzdfl;
import com.zx.kuangjia.po.Sjzdxx;

public interface SjzdxxService {
	public List<Sjzdxx> getAllSjzdxxBySjzdfl(Sjzdfl sjzdfl);

	public void updateSjzdxx(Sjzdxx sjzdxx);
}
