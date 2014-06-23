package com.zx.kuangjia.action;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.kuangjia.po.Sjzdxx;
import com.zx.kuangjia.service.SjzdflService;
import com.zx.kuangjia.service.SjzdxxService;

public class UpdateSjzdxxAction extends ActionSupport {
	private Integer sjzdflId;
	private Integer[] sjzzIds;
	private String[] sjzdxxmcs;
	private String[] checks;
	private String[] statu;

	public String[] getStatu() {
		return statu;
	}

	public void setStatu(String[] statu) {
		this.statu = statu;
	}

	private SjzdxxService sjzdxxService;
	private SjzdflService sjzdflService;

	public Integer getSjzdflId() {
		return sjzdflId;
	}

	public void setSjzdflId(Integer sjzdflId) {
		this.sjzdflId = sjzdflId;
	}

	public Integer[] getSjzzIds() {
		return sjzzIds;
	}

	public void setSjzzIds(Integer[] sjzzIds) {
		this.sjzzIds = sjzzIds;
	}

	public String[] getSjzdxxmcs() {
		return sjzdxxmcs;
	}

	public void setSjzdxxmcs(String[] sjzdxxmcs) {
		this.sjzdxxmcs = sjzdxxmcs;
	}

	public SjzdxxService getSjzdxxService() {
		return sjzdxxService;
	}

	public void setSjzdxxService(SjzdxxService sjzdxxService) {
		this.sjzdxxService = sjzdxxService;
	}

	public SjzdflService getSjzdflService() {
		return sjzdflService;
	}

	public void setSjzdflService(SjzdflService sjzdflService) {
		this.sjzdflService = sjzdflService;
	}

	public String[] getChecks() {
		return checks;
	}

	public void setChecks(String[] checks) {
		this.checks = checks;
	}

	public String execute() throws Exception {
		for (int i = 0; i < sjzzIds.length; i++) {
			Sjzdxx sjzdxx = new Sjzdxx();
			sjzdxx.setSjzzId(sjzzIds[i]);
			sjzdxx.setSjzdfl(sjzdflService.findSjzdflBySjzdflId(sjzdflId));
			sjzdxx.setSjzzxxmc(statu[i]);
			sjzdxx.setQiyong("no");
			for (String check : checks) {
				if (check.equals("qiyong" + (i + 1))) {
					sjzdxx.setQiyong("yes");
					break;
				}
			}
			sjzdxxService.updateSjzdxx(sjzdxx);
		}
		return this.SUCCESS;
	}

}
