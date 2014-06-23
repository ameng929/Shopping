package com.zx.kuangjia.dao;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.Collect;

public interface CollectDAO {

	public abstract void save(Collect transientInstance);

	public abstract void delete(Collect persistentInstance);

	public abstract Collect findById(java.lang.Integer id);

	public abstract List findByExample(Collect instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findByUid(Object uid);

	public abstract List findByPid(Object pid);

	public abstract List findAll();
	public abstract List findAll(Page page);
	public abstract int queryConut();

	public abstract Collect merge(Collect detachedInstance);

	public abstract void attachDirty(Collect instance);

	public abstract void attachClean(Collect instance);

}