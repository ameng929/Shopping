package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.po.Sjzdfl;

public interface SjzdflService {

	// ��ѯ���е������ֵ����
	public List<Sjzdfl> getAllSjzdfl();

	// ���������ֵ����
	public void updateSjzdfl(Sjzdfl sjzdfl);

	// ���������ֵ����ID����������ֵ����
	public Sjzdfl findSjzdflBySjzdflId(int sjzdflId);
}
