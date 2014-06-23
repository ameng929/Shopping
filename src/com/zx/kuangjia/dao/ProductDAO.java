package com.zx.kuangjia.dao;

import java.util.List;

import com.zx.kuangjia.fenye.Page;
import com.zx.kuangjia.po.Product;

public interface ProductDAO {

	public abstract void save(Product transientInstance);

	public abstract void delete(Product persistentInstance);

	public abstract Product findById(java.lang.Integer id);

	public abstract List findByExample(Product instance);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List findByName(Object name);

	public abstract List findByDescr(Object descr);

	public abstract List findByNormalprice(Object normalprice);

	public abstract List findByMemberprice(Object memberprice);

	public abstract List findByCategoryid(Object categoryid);

	public abstract List findByRecommend(Object recommend);

	public abstract List findAll();
	public abstract List findAll(Page page);
	public abstract int queryConut();
	public abstract Product merge(Product detachedInstance);

	public abstract void attachDirty(Product instance);

	public abstract void attachClean(Product instance);

}