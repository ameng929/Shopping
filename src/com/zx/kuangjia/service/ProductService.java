package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.po.Product;

public interface ProductService {
	public List<Product> getAllProduct();

	// ���������ֵ����
	public void updateProduct(Product product);

	// ���������ֵ����ID����������ֵ����
	public Product findProductByProductName(String name);
}
