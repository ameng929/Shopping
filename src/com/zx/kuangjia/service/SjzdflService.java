package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.po.Sjzdfl;

public interface SjzdflService {

	// 查询所有的数据字典分类
	public List<Sjzdfl> getAllSjzdfl();

	// 更新数据字典分类
	public void updateSjzdfl(Sjzdfl sjzdfl);

	// 根据数据字典分类ID来获得数据字典分类
	public Sjzdfl findSjzdflBySjzdflId(int sjzdflId);
}
