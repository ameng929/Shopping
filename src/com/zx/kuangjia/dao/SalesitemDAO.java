package com.zx.kuangjia.dao;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.Salesitem;

public interface SalesitemDAO {

	public abstract void save(Salesitem transientInstance);

	public abstract void delete(Salesitem persistentInstance);

	public abstract Salesitem findById(java.lang.Integer id);

	public abstract List findByExample(Salesitem instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findByProductid(Object productid);

	public abstract List findByUnitprice(Object unitprice);

	public abstract List findByPcount(Object pcount);

	public abstract List findByOrderid(Object orderid);

	public abstract List findByJudgec(Object judgec);

	public abstract List findAll();
	public abstract List findAll(Page page);
	public abstract int queryConut();

	public abstract Salesitem merge(Salesitem detachedInstance);

	public abstract void attachDirty(Salesitem instance);

	public abstract void attachClean(Salesitem instance);

}