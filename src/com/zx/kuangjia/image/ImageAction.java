package com.zx.kuangjia.image;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;


public class ImageAction extends ActionSupport {


	public String execute() throws Exception {
		HttpSession session =ServletActionContext.getRequest().getSession();
		ImageEnsure images = new ImageEnsure();
		String str;
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			str = images.getEnsure(0,0,response.getOutputStream());
		
		    session.setAttribute("strEnsure", str); 
		//out.close();
		
		    response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//out=pageContext.pushBody();
		return null;
	}

}
