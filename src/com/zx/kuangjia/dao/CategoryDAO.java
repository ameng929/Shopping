package com.zx.kuangjia.dao;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.Category;

public interface CategoryDAO {

	public abstract void save(Category transientInstance);

	public abstract void delete(Category persistentInstance);

	public abstract Category findById(java.lang.Integer id);

	public abstract List findByExample(Category instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findByPid(Object pid);

	public abstract List findByName(Object name);

	public abstract List findByDescr(Object descr);

	public abstract List findByCno(Object cno);

	public abstract List findByGrade(Object grade);

	public abstract List findAll();
	public abstract List findAll(Page page);
	public abstract int queryConut();

	public abstract Category merge(Category detachedInstance);

	public abstract void attachDirty(Category instance);

	public abstract void attachClean(Category instance);

}