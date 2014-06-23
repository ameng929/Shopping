package com.zx.shopping.product;

import java.util.ArrayList;
import java.util.List;

import com.zx.shopping.product.*;

public class test {

	/**
	 * @param args
	 */
	
	public static void main(String[] args) {
		List<Product> products = new ArrayList<Product>();
		products = ProductMgr.getInstance().getProducts();
		for (int i = 0; i < products.size(); i++) {
			Product p = products.get(i);
			System.out.println(p.getId());}

	}

}
