package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.po.Product;

public interface ProductService {
	public List<Product> getAllProduct();

	// 更新数据字典分类
	public void updateProduct(Product product);

	// 根据数据字典分类ID来获得数据字典分类
	public Product findProductByProductName(String name);
}
