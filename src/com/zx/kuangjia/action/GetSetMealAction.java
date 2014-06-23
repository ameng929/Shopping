package com.zx.kuangjia.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.kuangjia.dao.ProductDAO;
import com.zx.kuangjia.dao.ProductDAOImpl;
import com.zx.kuangjia.po.Product;
import com.zx.kuangjia.po.Sjzdfl;
import com.zx.kuangjia.po.Sjzdxx;
import com.zx.kuangjia.service.ProductService;
import com.zx.kuangjia.service.SjzdflService;
import com.zx.kuangjia.service.SjzdxxService;

public class GetSetMealAction extends ActionSupport {
	private Integer id;
	private ProductService productService;
	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	private SjzdflService sjzdflService;
	private SjzdxxService sjzdxxService;

	public SjzdxxService getSjzdxxService() {
		return sjzdxxService;
	}

	public void setSjzdxxService(SjzdxxService sjzdxxService) {
		this.sjzdxxService = sjzdxxService;
	}

	public SjzdflService getSjzdflService() {
		return sjzdflService;
	}

	public void setSjzdflService(SjzdflService sjzdflService) {
		this.sjzdflService = sjzdflService;
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String execute() throws Exception {
		// 获得数据字典分类名称
		System.out.println("选择的套餐的id为："+id);
		//List<Product> allProducts=productService.getAllProduct();
		//System.out.println(allProducts.size());
		Sjzdfl sjzdfl = sjzdflService.findSjzdflBySjzdflId(id);
		HttpServletRequest request = ServletActionContext.getRequest();
		//request.setAttribute("sjzdflmc", sjzdfl.getSjzdflmc());

		// 根据数据字典分类，获得该分类的所有数据字典信息
		List<Sjzdxx> allSjzdxx = sjzdxxService.getAllSjzdxxBySjzdfl(sjzdfl);
		request.setAttribute("allSjzdxx2", allSjzdxx);
		//request.setAttribute("allProducts", allProducts);

		return this.SUCCESS;
	}

}
