package com.zx.kuangjia.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.kuangjia.po.Sjzdfl;
import com.zx.kuangjia.service.SjzdflService;

public class GetSjzdflAction extends ActionSupport {
	private SjzdflService sjzdflService;

	public SjzdflService getSjzdflService() {
		return sjzdflService;
	}

	public void setSjzdflService(SjzdflService sjzdflService) {
		this.sjzdflService = sjzdflService;
	}

	public String execute() throws Exception {
		List<Sjzdfl> allSjzdfl = sjzdflService.getAllSjzdfl();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("allSjzdfl", allSjzdfl);
		return this.SUCCESS;
	}
}
