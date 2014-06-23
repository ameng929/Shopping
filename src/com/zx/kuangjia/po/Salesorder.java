package com.zx.kuangjia.po;

import java.sql.Timestamp;

/**
 * Salesorder entity. @author MyEclipse Persistence Tools
 */

public class Salesorder implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userid;
	private String addr;
	private Timestamp odate;
	private Integer status;
	private String phone;

	// Constructors

	/** default constructor */
	public Salesorder() {
	}

	/** full constructor */
	public Salesorder(Integer userid, String addr, Timestamp odate,
			Integer status, String phone) {
		this.userid = userid;
		this.addr = addr;
		this.odate = odate;
		this.status = status;
		this.phone = phone;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Timestamp getOdate() {
		return this.odate;
	}

	public void setOdate(Timestamp odate) {
		this.odate = odate;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}