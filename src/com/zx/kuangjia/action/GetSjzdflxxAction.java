package com.zx.kuangjia.action;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.kuangjia.po.Sjzdfl;
import com.zx.kuangjia.po.Sjzdxx;
import com.zx.kuangjia.service.SjzdflService;
import com.zx.kuangjia.service.SjzdxxService;

public class GetSjzdflxxAction extends ActionSupport {
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

	public String execute() throws Exception {
		List<Sjzdfl> allSjzdfl1 = sjzdflService.getAllSjzdfl();
		
		List<Sjzdxx> allSjzdxx;
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("allSjzdfl", allSjzdfl1);
		int i=0;
		for(Iterator<Sjzdfl> it = allSjzdfl1.iterator(); it.hasNext(); ) {
	    
		Sjzdfl sf = it.next();
		//Sjzdfl sjzdfl = sjzdflService.findSjzdflBySjzdflId(1);
        i=sf.getSjzdflId();
		// 根据数据字典分类，获得该分类的所有数据字典信息
       // i++;
		allSjzdxx = sjzdxxService.getAllSjzdxxBySjzdfl(sf);
		request.setAttribute("allSjzdxx"+i, allSjzdxx);
		
		
		//request.setAttribute("allProducts", allProducts);
		}
		
		return this.SUCCESS;
	}
}
