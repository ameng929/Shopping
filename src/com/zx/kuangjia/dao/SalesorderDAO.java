package com.zx.kuangjia.dao;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.Salesorder;

public interface SalesorderDAO {

	public abstract void save(Salesorder transientInstance);

	public abstract void delete(Salesorder persistentInstance);

	public abstract Salesorder findById(java.lang.Integer id);

	public abstract List findByExample(Salesorder instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findByUserid(Object userid);

	public abstract List findByAddr(Object addr);

	public abstract List findByStatus(Object status);

	public abstract List findByPhone(Object phone);

	public abstract List findAll();
	
	public abstract List findAll(Page page);
	public abstract int queryConut();

	public abstract Salesorder merge(Salesorder detachedInstance);

	public abstract void attachDirty(Salesorder instance);

	public abstract void attachClean(Salesorder instance);

}