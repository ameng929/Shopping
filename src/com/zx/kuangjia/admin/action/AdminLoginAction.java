package com.zx.kuangjia.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.kuangjia.service.UserService;

public class AdminLoginAction extends ActionSupport {
	private UserService userService;
	private String username;
	private String password;
	private String code;
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String execute() throws Exception {


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		String rand1 = (String)request.getSession().getAttribute("strEnsure");
		rand1 = (String)request.getSession().getAttribute("strEnsure");
		System.out.println(rand1);
		com.zx.kuangjia.po.User u=userService.check(username, password);
		com.zx.shopping.user.User u1=new com.zx.shopping.user.User();
		u1.setAddr(u.getAddr());
		u1.setEmail(u.getEmail());
		u1.setId(u.getId());
		u1.setUsername(u.getUsername());
		u1.setPassword(u.getPassword());
		u1.setPhone(u.getPhone());
		u1.setRdate(u.getRdate());
		u1.setRight(u.getRight());
		
		System.out.println(u1.getUsername());
		System.out.println(code);
		
		if(code.equalsIgnoreCase(rand1)==false){
			response.sendRedirect("AdminLogin1.jsp");
		}
		request.setAttribute("user",u1);
		return this.SUCCESS;
	}
	
}
