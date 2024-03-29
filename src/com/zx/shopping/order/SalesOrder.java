package com.zx.shopping.order;

import java.util.Date;
import java.util.List;

import com.zx.shopping.user.User;

public class SalesOrder {
	private int id;

	private User user;

	private String addr;

	private Date oDate;

	private int status;
	private String phone="";

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	private List<SalesItem> items;

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<SalesItem> getItems() {
		return items;
	}

	public void setItems(List<SalesItem> items) {
		this.items = items;
	}

	public Date getODate() {
		return oDate;
	}

	public void setODate(Date date) {
		oDate = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public void updateStatus() {
		OrderMgr.getInstance().updateStatus(this);
	}

}
