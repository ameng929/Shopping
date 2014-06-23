package com.zx.kuangjia.service;

import java.util.List;

import com.zx.kuangjia.dao.ProductDAO;
import com.zx.kuangjia.po.Product;

public class ProductServiceImpl implements ProductService {

	private ProductDAO productDAO;
	public ProductDAO getProductDAO() {
		return productDAO;
	}

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public Product findProductByProductName(String name) {
		return (Product) productDAO.findByName(name).get(0);
	}

	@Override
	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		return productDAO.findAll();
	}

	@Override
	public void updateProduct(Product product) {
		productDAO.attachDirty(product);
	}

}
