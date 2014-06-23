package com.zx.kuangjia.po;

import java.sql.Timestamp;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String descr;
	private Double normalprice;
	private Double memberprice;
	private Timestamp pdate;
	private Integer categoryid;
	private Integer recommend;

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** full constructor */
	public Product(String name, String descr, Double normalprice,
			Double memberprice, Timestamp pdate, Integer categoryid,
			Integer recommend) {
		this.name = name;
		this.descr = descr;
		this.normalprice = normalprice;
		this.memberprice = memberprice;
		this.pdate = pdate;
		this.categoryid = categoryid;
		this.recommend = recommend;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescr() {
		return this.descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public Double getNormalprice() {
		return this.normalprice;
	}

	public void setNormalprice(Double normalprice) {
		this.normalprice = normalprice;
	}

	public Double getMemberprice() {
		return this.memberprice;
	}

	public void setMemberprice(Double memberprice) {
		this.memberprice = memberprice;
	}

	public Timestamp getPdate() {
		return this.pdate;
	}

	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}

	public Integer getCategoryid() {
		return this.categoryid;
	}

	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}

	public Integer getRecommend() {
		return this.recommend;
	}

	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}

}