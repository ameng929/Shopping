package com.zx.kuangjia.po;

import java.util.HashSet;
import java.util.Set;

/**
 * Sjzdfl entity. @author MyEclipse Persistence Tools
 */

public class Sjzdfl implements java.io.Serializable {

	// Fields

	private Integer sjzdflId;
	private String sjzdflmc;
	private String qiyong;
	private Set sjzdxxes = new HashSet(0);

	// Constructors

	/** default constructor */
	public Sjzdfl() {
	}

	/** full constructor */
	public Sjzdfl(String sjzdflmc, String qiyong, Set sjzdxxes) {
		this.sjzdflmc = sjzdflmc;
		this.qiyong = qiyong;
		this.sjzdxxes = sjzdxxes;
	}

	// Property accessors

	public Integer getSjzdflId() {
		return this.sjzdflId;
	}

	public void setSjzdflId(Integer sjzdflId) {
		this.sjzdflId = sjzdflId;
	}

	public String getSjzdflmc() {
		return this.sjzdflmc;
	}

	public void setSjzdflmc(String sjzdflmc) {
		this.sjzdflmc = sjzdflmc;
	}

	public String getQiyong() {
		return this.qiyong;
	}

	public void setQiyong(String qiyong) {
		this.qiyong = qiyong;
	}

	public Set getSjzdxxes() {
		return this.sjzdxxes;
	}

	public void setSjzdxxes(Set sjzdxxes) {
		this.sjzdxxes = sjzdxxes;
	}

}