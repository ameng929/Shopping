package com.zx.kuangjia.po;

/**
 * Salesitem entity. @author MyEclipse Persistence Tools
 */

public class Salesitem implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer productid;
	private Double unitprice;
	private Integer pcount;
	private Integer orderid;
	private Integer judgec;

	// Constructors

	/** default constructor */
	public Salesitem() {
	}

	/** full constructor */
	public Salesitem(Integer productid, Double unitprice, Integer pcount,
			Integer orderid, Integer judgec) {
		this.productid = productid;
		this.unitprice = unitprice;
		this.pcount = pcount;
		this.orderid = orderid;
		this.judgec = judgec;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProductid() {
		return this.productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public Double getUnitprice() {
		return this.unitprice;
	}

	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}

	public Integer getPcount() {
		return this.pcount;
	}

	public void setPcount(Integer pcount) {
		this.pcount = pcount;
	}

	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getJudgec() {
		return this.judgec;
	}

	public void setJudgec(Integer judgec) {
		this.judgec = judgec;
	}

}