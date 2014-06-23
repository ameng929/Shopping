package com.zx.kuangjia.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.kuangjia.po.Sjzdfl;
import com.zx.kuangjia.po.Sjzdxx;
import com.zx.kuangjia.service.SjzdflService;
import com.zx.kuangjia.service.SjzdxxService;

public class UpdateSjzdflAction extends ActionSupport {
	private Integer[] sjzdflIds;
	private String[] sjzdflmcs;
	private SjzdflService sjzdflService;
	private SjzdxxService sjzdxxService;

	private String[] checks;

	public String[] getChecks() {
		return checks;
	}

	public void setChecks(String[] checks) {
		this.checks = checks;
	}

	public SjzdflService getSjzdflService() {
		return sjzdflService;
	}

	public void setSjzdflService(SjzdflService sjzdflService) {
		this.sjzdflService = sjzdflService;
	}

	public Integer[] getSjzdflIds() {
		return sjzdflIds;
	}

	public void setSjzdflIds(Integer[] sjzdflIds) {
		this.sjzdflIds = sjzdflIds;
	}

	public String[] getSjzdflmcs() {
		return sjzdflmcs;
	}

	public void setSjzdflmcs(String[] sjzdflmcs) {
		this.sjzdflmcs = sjzdflmcs;
	}

	public String execute() throws Exception {
		for (int i = 0; i < sjzdflIds.length; i++) {
			Sjzdfl sjzdfl = new Sjzdfl();
			sjzdfl.setSjzdflId(sjzdflIds[i]);
			sjzdfl.setSjzdflmc(sjzdflmcs[i]);
			// 如果要删除数据字典分类
			if (sjzdflmcs[i].equals("")) {
				List<Sjzdxx> allSjzdxx = sjzdxxService
						.getAllSjzdxxBySjzdfl(sjzdfl);
				for (Sjzdxx sjzdxx : allSjzdxx) {
					sjzdxx.setSjzzxxmc("");
					sjzdxx.setQiyong("no");
					sjzdxxService.updateSjzdxx(sjzdxx);
				}
			}
			sjzdfl.setQiyong("no");
			for (String check : checks) {
				if (check.equals("qiyong" + (i + 1))) {
					sjzdfl.setQiyong("yes");
					break;
				}
			}
			sjzdflService.updateSjzdfl(sjzdfl);
		}
		return this.SUCCESS;
	}

	public SjzdxxService getSjzdxxService() {
		return sjzdxxService;
	}

	public void setSjzdxxService(SjzdxxService sjzdxxService) {
		this.sjzdxxService = sjzdxxService;
	}

}
