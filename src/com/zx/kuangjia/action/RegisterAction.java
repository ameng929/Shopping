package com.zx.kuangjia.action;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.kuangjia.po.User;
import com.zx.kuangjia.service.UserService;

public class RegisterAction extends ActionSupport {
	private UserService userService;
	private String username;
	private String addr;
	private String email;
	private String password;
	private String phone;
	private String password2;
	private int right=0;
	public int getRight() {
		return right;
	}

	public void setRight(int right) {
		this.right = right;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

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
		//if(userService.isExit(username)==true){
		//	response.sendRedirect("Register.jsp");
		//}
			User u1=new User();
			u1.setAddr(addr);
			u1.setEmail(email);
			u1.setUsername(username);
			u1.setPassword(password);
			u1.setPhone(phone);
			u1.setRdate(new Timestamp(System.currentTimeMillis()));
			u1.setRight(0);
			userService.save(u1);
			return this.SUCCESS;
		
		

	}
	
}
