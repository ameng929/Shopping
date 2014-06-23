package com.zx.shopping.order;

import com.zx.shopping.product.Product;

public class SalesItem {
	private int id;
	private Product product;
	private double unitPrice;
	private int count;
	private int orderId;
	private int judgec;
	private int productid;
	
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getJudgec() {
		return judgec;
	}
	public void setJudgec(int judgec) {
		this.judgec = judgec;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
}
