package com.zx.kuangjia.po;

/**
 * Sjzdxx entity. @author MyEclipse Persistence Tools
 */

public class Sjzdxx implements java.io.Serializable {

	// Fields

	private Integer sjzzId;
	private Sjzdfl sjzdfl;
	private String sjzzxxmc;
	private String qiyong;

	// Constructors

	/** default constructor */
	public Sjzdxx() {
	}

	/** full constructor */
	public Sjzdxx(Sjzdfl sjzdfl, String sjzzxxmc, String qiyong) {
		this.sjzdfl = sjzdfl;
		this.sjzzxxmc = sjzzxxmc;
		this.qiyong = qiyong;
	}

	// Property accessors

	public Integer getSjzzId() {
		return this.sjzzId;
	}

	public void setSjzzId(Integer sjzzId) {
		this.sjzzId = sjzzId;
	}

	public Sjzdfl getSjzdfl() {
		return this.sjzdfl;
	}

	public void setSjzdfl(Sjzdfl sjzdfl) {
		this.sjzdfl = sjzdfl;
	}

	public String getSjzzxxmc() {
		return this.sjzzxxmc;
	}

	public void setSjzzxxmc(String sjzzxxmc) {
		this.sjzzxxmc = sjzzxxmc;
	}

	public String getQiyong() {
		return this.qiyong;
	}

	public void setQiyong(String qiyong) {
		this.qiyong = qiyong;
	}

}